IVO # Nädal 7 MEESKOND: TOODE -  Python Pandas

## Ülesanne ja Eesmärk
Meeskond viib läbi RFM (Recency, Frequency, Monetary) analüüsi UrbanStyle.ltd kliendiandmetel Python pandas abil ja esitab Markole konkreetsed soovitused.
Väljund: Uks terviklik Jupyter Notebook, kus iga sektsioon on koostatud uhe meeskonnaliikme poolt. Notebook jookseb algusest lõpuni ilma veata.

---

Grupitöös oli minu ülesandeks müügi- ja kliendiandmete ühendamine (Roll A) ning täielik andmete puhastustorustiku teostamine (Roll B).
* Müügi- ja kliendiandmete ühendamine (`pd.merge`)
* Müügiarvete deduplitseerimine `invoice_id` alusel
* Puuduvate väärtuste (NULL) filtreerimine ja puhastamine
* Kuupäeva andmetüüpide teisendamine (`pd.to_datetime`)
* Puhastusraporti genereerimine (lõplik `shape` ja unikaalsed kliendid
---

### TEHNILINE ÜLEVAADE
Sai loodud ja läbi viidud andmete laadimise ja puhastus Pandas teegiga:
- **Roll A (Data Loading):** Laadisin CSV-failid (`urbanstyle_sales.csv` ja `urbanstyle_customers.csv`) ning liitsin nad `pd.merge(..., how='left')` abil `customer_id` võtme alusel, et tuua müügitabelisse juurde kliendi e-mail ja eesnimi.
- **Roll B (Data Cleaning):** Eemaldasin duplikaatarved `invoice_id` järgi (`drop_duplicates`), kirjastasin NULL-väärtused kriitilistest veergudest (`dropna` eemaldas puuduvad `customer_id`, `sale_date` ja `total_price` read), konverteerisin `sale_date` veeru Pandas `datetime` formaati ning eemaldasin negatiivsed ja null-summad (`total_price > 0`).
- Geminit ja Google AI Studiot-d kasutasin koodi loogika ning vigade diagnoosimise abilisena.

---

### Grupitöö PEAMISED LEIUD
* **Toorandmete maht (Roll A):** Müügitabeli algne maht oli 15 234 rida ja 11 veergu, mis pärast kliendiandmete liitmist kasvas 13 veeruni.
* **Arvete deduplitseerimine:** Pärast `invoice_id` pikkuspõhist puhastust eemaldati duplikaadid (toores sales tabel sisaldas 5 116 duplikaatarvet) ning alles jäi 10 118 tehingut.
* **Lõplik puhastatud andmestik (Roll B):** Pärast puuduvate kliendi ID-de ja anomaalsete hindade eemaldamist jäi RFM-analüüsiks alles täpselt 8 950 puhast tehingurida.
* **Kliendibaas:** Puhastatud andmestik sisaldab 2 540 unikaalset ostnud klienti ajavahemikus 01.01.2023 kuni 06.09.2026.

---

### SOOVITUSED:
* **Andmekvaliteet sisendsüsteemis:** Tagada e-poe ja kassasüsteemi liidestuses, et tehinguga pandaks alati kaasa kehtiv `customer_id`, vältimiseks tehingute väljajäämist RFM-analüüsist.
* **Hinnaanomaaliad:** Seadistada süsteemi kontrollid, mis ei luba sisestada tehingule nulli või negatiivset summat (`total_price <= 0`).
