Nädal 8 – UrbanStyle'i Python API-d ja automatiseerimine
## Meeskond TOODE

**Liikmed:** Ivo, Kertu ja Helen

## Meeskonna töö
- [Vaata selle nädala meeskonnatöö esitlust siit](https://docs.google.com/presentation/d/1uZ4M79CZbJbHnxTO83OWkw0dK4sQwf2zO5v7F9jSuVU/edit?slide=id.p#slide=id.p)

## Rollijaotus

| **Liige** | **Roll** | **Vastutus** |
| :--- | :--- | :--- |
| Ivo | A+B – API Query + Data Processing | Andmete pärimine Supabase API-st (`data_fetcher.py`) ja andmete töötlemine (`transform.py`) |
| Kertu | C – Visualization + Saving | Andmete visualiseerimine ja eksportimine (`visualize_export.py`) |
| Helen | D – Automation Script | Kogu pipeline'i automatiseerimine ja orkestreerimine (`pipeline.py`) |

---

## Nädala eesmärk
Pythoni automatiseerimine. 
* Luua Pythoni funktsioonid, mis pärivad UrbanStyle.ltd andmed Supabase API-st (müügi-, kliendi- ja tooteandmed).
* Kirjutada transformeerimisfunktsioonid: puhastada andmed, arvutada nädalased koondnäitajad ja KPI-d ning liita andmestikud.

**Sisend:** Supabase Python client (`supabase-py`), `.env` fail API tunnustega ning DataFrame'id (müügi-, kliendi-, tooteandmed).  
**Väljund:** `data_fetcher.py` (3 funktsiooni, mis tagastavad DataFrame'e) ja `transform.py` (4 funktsiooni andmete töötlemiseks). Loodud ja testitud: Supabase API-st laetud andmed on edukalt pagineeritud, puhastatud (8,950 rida) ning seadistatud tiimi ühise pipeline'i integreerimiseks.

---

## Roll A: API Query (`data_fetcher.py`)

**Tehtud töö (Baas + Edasijõudnute tase):**
- **Turvaline ühendus:** API võtmed (`SUPABASE_URL`, `SUPABASE_KEY`) laetakse `.env` failist `python-dotenv` abil.
- **Andmepärimise funktsioonid:** Loodud `fetch_sales(start_date, end_date)` (koos kuupäevafiltritega), `fetch_customers()` ja `fetch_products()`.
- **Pagination (üle 1000 rea piirangu):** Lisatud vahemikupõhine (`.range()`) tsükkel, mis laeb andmed 1000-realiste lehtede kaupa, et kätte saada kogu andmebaasi sisu.
- **Veakäsitlus ja töökindlus:** Kõik päringud on ümbritsetud `try/except` blokkidega ning varustatud *exponential backoff* korduskatsete loogikaga (ootab 2, 4, 8 sek) võrgutõrgete korral.

**Peamised leiud (Toorandmete maht):**
- **Müügiandmed (`sales`):** 10 118 rida, 12 veergu (baaspäring tagastas vaikimisi vaid 1000 rida).
- **Kliendiandmed (`customers`):** 3 150 rida, 9 veergu.
- **Tooteandmed (`products`):** 362 rida, 9 veergu.
- *Märkus Roll B-le:* Andmed on toorkujul (sisaldavad veel duplikaate ja NULL-väärtusi), puhastamine ja filtreerimine toimub järgmises etapis (`transform.py`).

---

## Roll B: Data Processing (`transform.py`)

**Tehtud töö ja funktsioonid:**
1. **`clean_data_advanced(df)` (Edasijõudnute tase):**
   * Eemaldab duplikaadid (lähtudes `invoice_id`-st).
   * Eemaldab puuduvate väärtustega (NULL) read kriitilistest veergudest (`customer_id`, `sale_date`, `total_price`).
   * Valideerib andmetüübid ja väärtuste vahemikud (eemaldab negatiivsed ja ebamõistlikud hinnad).
   * Teisendab kuupäevad õigesse `datetime` formaati.
   * Sisaldab sisseehitatud logimist (`logging`), mis raporteerib igat transformatsiooni sammu.
2. **`merge_datasets(df_sales, df_customers)`:**
   * Liidab müügi- ja kliendiandmed omavahel `customer_id` alusel (`left join`), säilitades kõik tehingud.
3. **`calculate_weekly_aggregates(df)`:**
   * Grupeerib andmed nädalate kaupa (`resample('W')`) ning arvutab välja nädalase kogutulu, tellimuste arvu ja keskmise tellimuse väärtuse.
4. **`calculate_kpis(df)`:**
   * Tagastab sõnastiku peamiste äri-KPI-dega: kogutulu, unikaalsete klientide arv ja keskmine tellimuse väärtus.

**Peamised tulemused ja KPI-d:**
- **Algne ridade arv:** 10 118 rida
- **Puhastatud ridade arv (lõplik shape):** 8 950 rida
- **Kogutulu (Total Revenue):** 270 620,89 € (1000-realises baasvalimis)
- **Unikaalsed kliendid (Unique Customers):** 661 (baasvalimis) / 2 540 (kogu puhastatud andmestikus)
- **Keskmine tellimuse väärtus (Average Order Value):** 298,37 €

*Tulemusi sai võrreldud ka eelmise nädala failidega ja need klappisid täielikult.*

