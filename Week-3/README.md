https://docs.google.com/presentation/d/1vTKA181LxwKDlUWqxf3ZkGqUgayEBVz-5nYewer8u9o/edit?slide=id.p#slide=id.p




# Week 3 – SQL JOINs

## Meeskond TOODE

Liikmed:
- Helen
- Ivo
- Kertu

## Nädala teema

SQL JOIN-päringud ja UrbanStyle'i andmete ühendamine.

Harjutame INNER JOIN, LEFT JOIN, RIGHT JOIN ning mitme tabeli ühendamist.

## Grupitöö

---
## Kertu – Sales + Customers (Roll A)

**Domeen:** Müük, Kliendid ja Turundus (`sales`, `customer`, `marketing`)

### Peamised leiud

| Kontrollitud näitaja | Tulemus | Kommentaar|
|---|---|---|
| Ostudega kliendiread | **9 130** | Tabelis on 9130 rida kliendirida, kes on sooritanud ostu|
| Suurima kogusummaga ostja | Tiina Pärn| Ostusumma kokku **27 668 €**|
| Suurima ostusummaga linn | Tallinn | Klientide ostu kogusumma **1 006 252 €**|
| Lojaalsustase | 1024 kliendil puudub| Lojaalsustasemeta klientidel koste kogusummas **1 071 805 €** |

### SQL-analüüs

**1. Klientide leidmine, kes on sooritanud ostu (INNER JOIN)**

Ühendasin `sales` ja `customer` tabelid `INNER JOIN` abil ning otsisin kliente, kes on sooritanud ostu.

**Tulemus:** 9 130 kliendirida, kes on sooritanud ostu.

**2. TOP 10 klienti kogumüügi summa järgi**

Kasutasin `COUNT(DISTINCT)`, `SUM()`, `GROUP BY` ja `ORDER BY` päringuid, et leida unikaalsed kliendinimed, kes on sooritanud oste suurimas kogusummas.

**Tulemus:** Leitud 10 kõige suurema  koguostusummaga klienti.

| Klient       | Linn     | Ostude_arv | Kogumüük    |
| ------------ | -------- | ---------- | ----------- |
| Tiina Pärn   | Tartu    | 73         |   27 668.02 |
| Priit Rand   | Pärnu    | 76         |   26 286.10 |
| Kevin Org    | Tallinn  | 78         |   23 467.13 |
| Laura Tammik | Pärnu    | 74         |   23 385.82 |
| Erkki Ilves  | Tartu    | 72         |   22 942.42 |
| Anu Kuusik   | Tallinn  | 77         |   21 626.10 |
| Kersti Lill  | Tallinn  | 71         |   21 137.47 |
| Riina Lill   | Pärnu    | 67         |   20 972.33 |
| Annika Saar  | Viljandi | 66         |   20 726.79 |
| Ago Kull     | Pärnu    | 64         |   20 124.61 |

**3. Suurima ostusummaga linnade järjestus**

Kasutasin `COUNT(DISTINCT)`, `SUM()`, `GROUP BY` ja `ORDER BY` päringuid, et leida millistest linnadest on ostetud suurimates summades tooteid.

**Tulemus:** Suurima koguostuga linn oli Tallinn – **1 006 252,88 €**.

**4. Müük lojaalsustasemete kaupa**

Leidsin kõigi 3 lojaalsustaseme müügisummad. Lisaks arvutasin kokku müügisummad klientidel, kellel ei ole lojaalsustaset märgitud.

**Tulemus:** Kõige suurema ostusummaga lojaalsustase oli ** Lojaalsustasemeta** summas **1 071 805,32€** ja kõige väiksemaga **Pronkstase** summas **423 854,75 €**.

**5. Kliendid, kelle ostusuma oli üle keskmise ostusumma**

Kasutasin `AVG()`, `SUM()`, `GROUP BY` ja `ORDER BY` ja `HAVING` päringuid, et leida esmalt kõikide klientide keskmine ostusumma ja seejärel klientide arv, kelle ostusumma oli suurem kui keskmine ostusumma. 

**Tulemus:** Keskmine klientide ostusumma oli **1 139,96** €.  Kliente, kelle ostusumma ületas keskmist ostusummat oli **762**, mis moodustas **29,87%** kõikidest klientidest.

### Suurim üllatus

Suurim üllatus oli see, et esmakordsed/lojaalsustasemeta ostud moodustavad kogumüügist ligikaudu **40%**. Samuti on väga suur osakaal Tallinnast pärit klientide ostudel müügitulust - **38%**.

### Soovitused Annale ja Toomasele

1. Pöörata tähelepanu turunduse plaanimisel kõikidele piirkondadele. Hetkel paistavad silma suurte ostumahtude lõikes Tallinn, Tartu ja Pärnu **~72%** - kus asuvad ka poed. Muud piirkonnad on tagasihoidliku ostusummaga. 
2. Meelitada kliente tegema kordusoste.
3. Suurendada klientide arvu, kes kulutavad enam kui keskmine ostusumma.  Hetkel on selliste klientide hulk **29%**.

## Helen – Products + Inventory (Roll C)

**Domeen:** Tooted, müük ja inventuur (`products`, `sales`, `inventory`)

### Peamised leiud

| Kontrollitud näitaja | Tulemus |
|---|---|
| Müümata tooted | **12 toodet** |
| Suurima müügituluga toode | Õhuline sünteetiline sporditossud – **27 347,04 €** |
| Suurima müügituluga kategooria | Jalanõud – **774 034,75 €** |
| Väikseima müügituluga kategooria | Lasteriided – **305 844,45 €** |
| Kõige rohkem müügikirjeid | Meesteriided – **2266** |
| Inventuuritabeli kirjete arv | **0** |

### SQL-analüüs

**1. Müümata toodete leidmine (LEFT JOIN)**

Ühendasin `products` ja `sales` tabelid `LEFT JOIN` abil ning otsisin tooteid, millel puudub müügikirje.

**Tulemus:** 12 müümata toodet.

**2. Müümata toodete koguarv**

Kasutasin `COUNT(*)` funktsiooni, et kontrollida müümata toodete arvu.

**Tulemus:** 12 toodet.

**3. TOP 10 toodet müügitulu järgi**

Kasutasin `JOIN`, `SUM()`, `GROUP BY` ja `ORDER BY` päringuid, et järjestada tooted müügitulu alusel.

**Tulemus:** Suurima müügituluga toode oli „Õhuline sünteetiline sporditossud“ – **27 347,04 €**.

**4. Tootekategooriate müügitulu võrdlus**

Arvutasin müügikirjete arvu ja müügitulu iga tootekategooria kohta.

**Tulemus:** Kõige suurema müügituluga kategooria oli **jalanõud (774 034,75 €)** ja kõige väiksemaga **lasteriided (305 844,45 €)**.

**5. Inventuuri ja laoseisu kontroll**

Kontrollisin `inventory` tabeli sisu ja kirjete arvu.

**Tulemus:** Tabelis oli **0 kirjet**. Laoseisu ja juurdetellimise vajadust ei saanud hinnata.

### Suurim üllatus

Kõige üllatavam oli see, et `inventory` tabel oli tühi nii ühises grupiprojektis kui ka individuaalses projektis.

See takistas laoseisu analüüsi, kuigi toodete müügitulu oli võimalik arvutada.

### Soovitused Annale ja Toomasele

1. **Müümata tooted:** kontrollida 12 müümata toote nõudlust ja hindu ning kaaluda sobivaid müügikampaaniaid.
2. **Populaarsed tooted:** jälgida jalanõude kategooria toodete saadavust, sest see kategooria tõi kõige rohkem müügitulu.
3. **Lasteriided:** uurida väiksema müügitulu põhjuseid ja võimalusi müügi parandamiseks.
4. **Inventuur:** täiendada `inventory` tabelit tegelike laoseisuandmetega, et oleks võimalik tuvastada juurdetellimist vajavad tooted.

### Kokkuvõte

SQL JOIN-päringute abil tuvastasin **12 müümata toodet** ning võrdlesin toodete ja kategooriate müügitulu.

Kõige suurema müügituluga kategooria oli **jalanõud (774 034,75 €)**.

Inventuuriandmete puudumise tõttu ei olnud võimalik hinnata tegelikku laoseisu. Edasiseks analüüsiks tuleb `inventory` tabelisse lisada andmed.

