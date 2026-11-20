
# Week 8 – Python API-d ja automatiseerimine

## Roll C – Visualiseerimine ja tulemuste salvestamine

Minu roll C oli kirjutada Pythoni kood, mis loob töödeldud müügiandmete põhjal graafikud ja salvestab tulemused failidesse. Kasutasin selleks Plotly teeki ning kirjutasin kolm funktsiooni.

**Koodi blokkide selgitus:**

- Impordib graafikute loomiseks vajalikud Plotly moodulid.
- `create_weekly_chart()` – loob nädalase müügitulu joondiagrammi.
- `create_kpi_summary()` – kuvab kolm põhinäitajat: kogumüügitulu, unikaalsete klientide arv ja keskmine tellimuse väärtus.
- `export_results()` – loob vajadusel `output`-kausta ning salvestab andmed CSV-failina ja graafikud HTML-failidena.
- Lisab failinimedele kuupäeva, et salvestatud tulemusi oleks lihtne eristada.
- Testisin funktsioone näidisandmetega ja kontrollisin, et failid tekivad ning graafikud avanevad brauseris.

**AI kasutus:** Kasutasin AI abi koodi kirjutamisel, Plotly funktsioonidest arusaamisel ja vigade parandamisel. AI aitas leida ka selgema viisi KPI-de kuvamiseks. Katsetasin lahendusi ise ning kontrollisin, kas kood töötab ja tulemused salvestuvad õigesti.



## Roll D - Automatiseerimine ja pipeline

Minu roll D oli koostada pipeline kood, mis võtab tiimikaaslaste poolt koostatud failid ja ühendab need üheks sujuvaks automaatseks protsessiks. 
Kasutatud on logger teeki logi loomiseks, smtplib saadab e-kirju , pathlib teeb failihaldust ja mimetext koostab emaili teksti. 

**Koodi blokkide selgitus:**
- Impordib kõik vajalikud teegid
- Impordib vajalikud dataframid ROll A, B ja C failidest.
- Loob tagavara andmefailid juhuks kui Supabase on kättesaamatu
- Loggeri mooduli spetsifikatsioon
- Kood teavituste saatmiseks: simulatsioon teavituste saatmise kohta emailile ja Google Chati.
-  ETL pipeline retry konfiguratsioon - 3 korda proovimist.
-  ETL pipeline järjendus: pipeline osade käivitus, logging, data extract, transform, visualise ja salvestus.
-  Kokkuvõtte andmed
  
AI kasutus: AI abi kasutasin pipeline koodi kirjutamisel ja täpse ülesehituse seletamisel. AI aitas paigutada pipeline elemendid loogilisse järjekorda, et iga protsess toimiks täpselt õigel ajal.

  
  



