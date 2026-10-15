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

## Ivo – Customers + Sales (Roll B)

### Peamised leiud

Andmebaasis on 3150 klienti.
599 klienti (19 %) pole kunagi ostnud ja on mitteaktiivsed, lisaks nendest 236 kliendil puudub loyalty_tier, selle asemel on NULL.
Suurim klientide kadu (73%) tuleb kolmest linnast, kokku 434 klienti:
* Tallinnas 231 (39%)
* Tartus 133 (22%)
* Pärnus 70 klienti (12%)
* Ülejäänud linnad (27%)

Kliendid on registreerunud erinevatel kuupäevadel.
Viimati registreerus uus klient 2025 a. veebruaris.
Kõige rohkem kliente kadus perioodil 2024 november, kuni 2025 veebruar, olenevalt kuust 44-53 klienti.
Millest sellised numbrid? Kas andmebaasi ajaline piirang ei näita tulemusi või ei ole üle aasta aja ühtegi uut klienti juurde saadud.

TOP 20 klienti - erinevatest linnadest, nendest omakorda 10 suurimat klienti on ostnud üle 20K€ väärtuses.
| customer_id | klient | city | ostude_arv | ostude_kogusumma |
| :--- | :--- | :--- | :--- | :--- |
| 3618 | Tiina Pärn | Tartu | 73 | 27,668 |
| 3350 | Priit Rand | Pärnu | 76 | 26,286 |
| 2997 | Kevin Org | Tallinn | 78 | 23,467 |
| 2889 | Laura Tammik | Pärnu | 74 | 23,386 |
| 3648 | Erkki Ilves | Tartu | 72 | 22,942 |
| 3605 | Anu Kuusik | Tallinn | 77 | 21,626 |
| 4206 | Kersti Lill | Tallinn | 71 | 21,137 |
| 2221 | Riina Lill | Pärnu | 67 | 20,972 |
| 2154 | Annika Saar | Viljandi | 66 | 20,727 |
| 3722 | Ago Kull | Pärnu | 64 | 20,125 |
| 4949 | Marika Sepp | Tallinn | 66 | 19,078 |
| 4178 | Ago Lõoke | Jõhvi | 70 | 19,011 |
| 3556 | Merike Vaher | Tallinn | 69 | 18,332 |
| 3810 | Pille Sepp | Pärnu | 56 | 18,081 |
| 4018 | Terje Kukk | Rakvere | 61 | 16,146 |
| 4334 | Priit Järv | Tallinn | 33 | 8,302 |
| 2775 | Ants Paju | Pärnu | 27 | 7,924 |
| 2495 | Urmas Kask | Tallinn | 25 | 5,685 |
| 2955 | Tiina Laas | Tallinn | 13 | 5,418 |
| 3699 | Marko Pihl | Tartu | 10 | 4,523 |

### Soovitused Annale

* **Turunduse suunamine:** Suunata turundustegevused eelkõige kolme suuremasse linna (Tallinn, Tartu, Pärnu), kus asub enamik mitteaktiivsetest klientidest.
* **Turunduspaketi kaalumine:** Juhul kui on saadaval turunduspakett, mille tasu hõlmab ka ülejäänud 27% mitteaktiivsetest klientidest, kuid kulu on näiteks vaid 10% kõrgem, tasub seda varianti tõsiselt kaaluda.
* **Sihitud pakkumised:** Saata mitteaktiivsetele klientidele sihitud e-kiri või SMS personaalse pakkumisega.
* **Loyalty_tier aktiveerimine:** Klientidele, kellel puudub `loyalty_tier` märge (NULL), aktiveerida koheselt "Silver" staatus (kas tähtajaliselt või tähtajatult) ning saata vastavad teavitused ja eripakkumised eesmärgiga saada klientidelt esimene ost.
* **Süsteemi kontroll:** Selgitada välja, kas uute klientide registreerimisega on süsteemis tehniline viga või andmebaasi laadimisel ajaline piirang, kuna uusi registreerumisi ei kajastu.

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
| Inventuuritabeli kirjete arv | **1400** |
| Juurdetellimist või kontrolli vajavad laokirjed | **231 (16,5%)** |

### SQL-analüüs

**1. Müümata toodete leidmine (LEFT JOIN)**

Ühendasin `products` ja `sales` tabelid `LEFT JOIN` abil ning otsisin tooteid, millel puudub müügikirje.

**Tulemus:** 12 müümata toodet.


**2. Müümata toodete koguarv**

Kasutasin `COUNT(*)` funktsiooni, et kontrollida müümata toodete arvu.

**Tulemus:** 12 toodet.

 **MÜÜMATA TOOTED:**

1. Vintage nahkne tossud
2. Luksuslik keraamiline elastne vöö
3. Moodne keraamiline sall
4. Stiilne puust müts
5. Kerge siidine nahkkindad
6. Klassikaline kašmiir pusa
7. Luksuslik teksane polo särk
8. Minimalistlik kašmiir bleiser
9. Praktiline trikoo sukkpüksid
10. Elegantne keraamiline rahakott
11. Moodne villane nahk sandaalid
12. Stiilne orgaaniline pidžaama


**3. TOP 10 toodet müügitulu järgi**

Kasutasin `JOIN`, `SUM()`, `GROUP BY` ja `ORDER BY` päringuid, et järjestada tooted müügitulu alusel.

**Tulemus:** Suurima müügituluga toode oli „Õhuline sünteetiline sporditossud“ – **27 347,04 €**.

**4. Tootekategooriate müügitulu võrdlus**

Arvutasin müügikirjete arvu ja müügitulu iga tootekategooria kohta.

**Tulemus:** Kõige suurema müügituluga kategooria oli **jalanõud (774 034,75 €)** ja kõige väiksemaga **lasteriided (305 844,45 €)**.

**5. Inventuuriandmete kontroll**

Kontrollisin `inventory` tabeli kirjete arvu funktsiooniga `COUNT(*)`.

**Tulemus:** Tabelis on **1400 kirjet**.

**6. Juurdetellimist vajavate laoseisude leidmine**

Ühendasin `inventory` ja `products` tabelid ning otsisin laokirjeid, mille `quantity_available` on väiksem või võrdne `reorder_point` väärtusega.

**Tulemus:** Leidsin juurdetellimise piiril või sellest allpool olevaid laoseise. Mõnel kirjel oli laoseis negatiivne (näiteks −46).

**7. Juurdetellimist vajavate laokirjete arv**

Kasutasin `COUNT(*)` funktsiooni, et lugeda kokku juurdetellimise piiril või sellest allpool olevad laokirjed.

**Tulemus:** **231 laokirjet ehk 16,5%** kõigist inventuurikirjetest.

### Suurim üllatus

Kõige üllatavam oli negatiivsete laoseisude esinemine. Näiteks ühe toote laoseis oli **−46 ühikut**.

See võib viidata laoseisuandmete vigadele või vajadusele kontrollida kaupade liikumise arvestust.

### Soovitused Annale ja Toomasele

1. **Müümata tooted:** kontrollida 12 müümata toote nõudlust ja hindu ning kaaluda sobivaid müügikampaaniaid.
2. **Populaarsed tooted:** jälgida jalanõude kategooria toodete saadavust, sest see kategooria tõi kõige rohkem müügitulu.
3. **Lasteriided:** uurida väiksema müügitulu põhjuseid ja võimalusi müügi parandamiseks.
4. **Inventuur:** kontrollida 231 tähelepanu vajavat laokirjet, selgitada välja negatiivsete laoseisude põhjused ning planeerida vajalikud juurdetellimised.

### Kokkuvõte

SQL JOIN-päringute abil tuvastasin **12 müümata toodet** ning võrdlesin toodete ja kategooriate müügitulu.

Kõige suurema müügituluga kategooria oli **jalanõud (774 034,75 €)**.

Inventuurianalüüs hõlmas **1400 laokirjet**, millest **231 (16,5%)** olid juurdetellimise piiril või sellest allpool. Negatiivsed laoseisud vajavad täiendavat kontrolli.
