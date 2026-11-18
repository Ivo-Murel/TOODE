import logging
import pandas as pd

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


def clean_data_advanced(df: pd.DataFrame) -> pd.DataFrame:
    """Puhastab andmed, valideerib tüübid ja vahemikud ning logib tegevused."""
    if df.empty:
        logging.warning("Sisend-DataFrame on tühi!")
        return df

    logging.info(f"Alustan andmete puhastamist. Algne ridade arv: {len(df)}")
    df_clean = df.copy()

    before_dup = len(df_clean)
    if 'invoice_id' in df_clean.columns:
        df_clean = df_clean.drop_duplicates(subset=['invoice_id'])
    else:
        df_clean = df_clean.drop_duplicates()
    logging.info(f"Eemaldatud duplikaadid: {before_dup - len(df_clean)} rida.")

    critical_cols = [c for c in ['customer_id', 'sale_date', 'total_price'] if c in df_clean.columns]
    before_na = len(df_clean)
    df_clean = df_clean.dropna(subset=critical_cols)
    logging.info(f"Eemaldatud puuduvate väärtustega read: {before_na - len(df_clean)} rida.")

    if 'total_price' in df_clean.columns:
        if not pd.api.types.is_numeric_dtype(df_clean['total_price']):
            df_clean['total_price'] = pd.to_numeric(df_clean['total_price'], errors='coerce')

        invalid_prices = (df_clean['total_price'] <= 0) | (df_clean['total_price'] > 100000)
        invalid_count = invalid_prices.sum()
        if invalid_count > 0:
            logging.warning(f"Leiti {invalid_count} ebamõistlikku või negatiivset total_price väärtust, eemaldan need.")
            df_clean = df_clean[~invalid_prices]

    if 'sale_date' in df_clean.columns:
        df_clean['sale_date'] = pd.to_datetime(df_clean['sale_date'], errors='coerce')
        df_clean = df_clean[df_clean['sale_date'] >= '2020-01-01']

    logging.info(f"Puhastamine edukalt lõpetatud. Lõplik ridade arv: {len(df_clean)}")
    return df_clean


def merge_datasets(df_sales: pd.DataFrame, df_customers: pd.DataFrame) -> pd.DataFrame:
    """Liidab müügi- ja kliendiandmed customer_id järgi (left join)."""
    if df_sales.empty or df_customers.empty:
        return df_sales
    return pd.merge(df_sales, df_customers, on='customer_id', how='left')


def calculate_weekly_aggregates(df: pd.DataFrame) -> pd.DataFrame:
    """Grupeerib andmed nädalate kaupa ja arvutab tulu, tellimuste arvu ning keskmise."""
    if df.empty or 'sale_date' not in df.columns or 'total_price' not in df.columns:
        return pd.DataFrame()

    weekly = df.resample('W', on='sale_date').agg(
        total_revenue=('total_price', 'sum'),
        order_count=('sale_id', 'count') if 'sale_id' in df.columns else ('total_price', 'count'),
        avg_order_value=('total_price', 'mean')
    ).reset_index()

    return weekly


def calculate_kpis(df: pd.DataFrame) -> dict:
    """Tagastab sõnastiku peamiste KPI-dega: kogutulu, unikaalsed kliendid, keskmine tellimuse väärtus."""
    if df.empty:
        return {"total_revenue": 0, "unique_customers": 0, "avg_order_value": 0}

    total_revenue = float(df['total_price'].sum()) if 'total_price' in df.columns else 0.0
    unique_customers = int(df['customer_id'].nunique()) if 'customer_id' in df.columns else 0
    avg_order_value = float(df['total_price'].mean()) if 'total_price' in df.columns else 0.0

    return {
        "total_revenue": round(total_revenue, 2),
        "unique_customers": unique_customers,
        "avg_order_value": round(avg_order_value, 2)
    }

if __name__ == "__main__":
    from data_fetcher import fetch_sales_advanced, fetch_customers_advanced
    
    print("Testin transformatsiooni...")
    df_sales = fetch_sales_advanced()
    df_customers = fetch_customers_advanced()
    
    # Testime puhastust
    df_clean = clean_data_advanced(df_sales)
    print(f"Puhastatud ridu: {len(df_clean)}")
    
    # Testime liitmist
    df_merged = merge_datasets(df_clean, df_customers)
    print(f"Liidetud andmete kuju (shape): {df_merged.shape}")
    
    # Testime KPI-sid
    kpis = calculate_kpis(df_clean)
    print("Arvutatud KPI-d:", kpis)