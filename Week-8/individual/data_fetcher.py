import os
import time
import logging
import pandas as pd
from dotenv import load_dotenv
from supabase import create_client

load_dotenv()
url = os.getenv("SUPABASE_URL")
key = os.getenv("SUPABASE_KEY")
supabase = create_client(url, key)


def fetch_with_pagination_and_retry(table_name: str, batch_size: int = 1000, max_retries: int = 3) -> pd.DataFrame:
    """Pärib Supabase tabelist kõik read paginatsiooni ja retry loogikaga."""
    all_data = []
    start = 0

    while True:
        end = start + batch_size - 1
        retries = 0
        success = False
        response_data = None

        while retries < max_retries and not success:
            try:
                response = supabase.table(table_name).select("*").range(start, end).execute()
                response_data = response.data
                success = True
            except Exception as e:
                retries += 1
                wait_time = 2 ** retries
                logging.warning(f"Katse {retries}/{max_retries} tabelile '{table_name}' ebaõnnestus: {e}")
                if retries >= max_retries:
                    logging.error(f"Kõik katsed tabeli '{table_name}' pärimiseks nurjusid.")
                    raise e
                time.sleep(wait_time)

        if not response_data:
            break

        all_data.extend(response_data)

        if len(response_data) < batch_size:
            break

        start += batch_size

    return pd.DataFrame(all_data)


def fetch_sales_advanced(start_date: str = None, end_date: str = None) -> pd.DataFrame:
    """Pärib kõik müügiandmed paginatsiooniga, toetades kuupäevafiltreid."""
    try:
        df = fetch_with_pagination_and_retry("sales")
        if not df.empty and 'sale_date' in df.columns:
            df['sale_date'] = pd.to_datetime(df['sale_date'])
            if start_date:
                df = df[df['sale_date'] >= pd.to_datetime(start_date)]
            if end_date:
                df = df[df['sale_date'] <= pd.to_datetime(end_date)]
        return df
    except Exception as e:
        logging.error(f"Müügiandmete pärimine ebaõnnestus: {e}")
        return pd.DataFrame()


def fetch_customers_advanced() -> pd.DataFrame:
    """Pärib kõik kliendiandmed paginatsiooniga."""
    return fetch_with_pagination_and_retry("customers")


def fetch_products_advanced() -> pd.DataFrame:
    """Pärib kõik tooteandmed paginatsiooniga."""
    return fetch_with_pagination_and_retry("products")

if __name__ == "__main__":
    print("Testin pärimist...")
    df = fetch_sales_advanced()
    print(f"Müügiandmeid laetud: {len(df)} rida")
    print(df.head())