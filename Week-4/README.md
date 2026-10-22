# Week 4 – SQL agregatsioon ja andmete analüüs

## Meeskond TOODE

**Liikmed:**
- Helen
- Ivo
- Kertu

## Nädala teema

Neljandal nädalal keskendume SQL-i abil andmete grupeerimisele, agregeerimisele ja äriliste järelduste tegemisele UrbanStyle'i andmebaasis.

- [Vaata meie ühist esitlust siit:](https://docs.google.com/presentation/d/1NEEeLFbxaILTYv0__Oxeff_V8zb6N4MpVi6k0TyTfrk/edit?slide=id.p#slide=id.p)

Kasutame muu hulgas `GROUP BY`, `HAVING`, CTE-sid ja aknafunktsioone.

## Tööjaotus

| Liige | Roll | Vastutus |
|---|---|---|
| Helen | SALES | Müügi- ja turundusanalüüs |
| Ivo | Inventuur | Kategooriad, laoseis ja müügid |
| Kertu | Kliendid | Kliendianalüüs |

Rollid vahetuvad nädalate lõikes, et kõik meeskonnaliikmed saaksid harjutada erinevate andmevaldkondade analüüsimist.

## Tööfailid

Meeskonnaliikmete SQL-päringud ja analüüsitulemused lisame sellesse kausta töö käigus.

- `Helen-Sales` – Heleni müügi- ja turundusanalüüs (tegemisel)
- Ivo Inventuur
- `Kertu Customers` – kliendiprofiilide analüüs
- `Screenshots.md` – tulemuste ekraanipildid (lisamisel)

## Töö seis

**4. nädala meeskonnatöö on ettevalmistamisel.**
## Grupitöö


---

## Helen – Sales & Marketing (Roll A)

**Domeen:** Müügi koondandmed (`sales`, `products`)

### Peamised leiud

2024. aasta müügikäive oli kokku **1 470 358,02 €**.

- Suurima müügikäibega kuu oli **detsember** – 170 623,28 €.
- Väikseima müügikäibega kuu oli **jaanuar** – 85 618,65 €.
- Suurim kuine käibekasv toimus **detsembris (+54,3%)**.
- Suurim kuine käibelangus toimus **septembris (−24,6%)**.
- Suurima müügikäibega tootekategooria oli **meeste_riided** – 389 738,54 €.

### SQL-analüüs

**1. Müük kuude kaupa – 2024**

Kasutasin `DATE_TRUNC()`, `COUNT()`, `SUM()`, `AVG()` ja `GROUP BY` funktsioone, et analüüsida 2024. aasta müügikirjete arvu, kogukäivet ja keskmist müügikirje summat kuude kaupa.

**Tulemus:**

| Kuu | Müügikirjeid | Kogukäive (€) | Keskmine müügikirje summa (€) |
|---|---:|---:|---:|
| Jaanuar | 312 | 85 618,65 | 274,42 |
| Veebruar | 334 | 90 181,83 | 270,01 |
| Märts | 412 | 109 559,98 | 265,92 |
| Aprill | 411 | 113 838,38 | 276,98 |
| Mai | 413 | 116 843,02 | 282,91 |
| Juuni | 509 | 144 558,18 | 284,00 |
| Juuli | 510 | 146 800,80 | 287,84 |
| August | 511 | 144 870,17 | 283,50 |
| September | 392 | 109 267,47 | 278,74 |
| Oktoober | 391 | 127 622,32 | 326,40 |
| November | 392 | 110 573,94 | 282,08 |
| Detsember | 550 | 170 623,28 | 310,22 |

**Järeldus:** Detsember oli 2024. aasta tugevaim müügikuu nii kogukäibe kui ka müügikirjete arvu poolest. Jaanuaris oli väikseim kogukäive. Oktoobris oli kõrgeim keskmine müügikirje summa (326,40 €).

**2. Müük tootekategooriate kaupa – 2024**

Ühendasin `sales` ja `products` tabelid `JOIN` abil ning kasutasin `GROUP BY`, `COUNT(DISTINCT)`, `SUM()`, `AVG()` ja `HAVING` funktsioone.

Analüüsi kaasasin 2024. aasta tootekategooriad, mille kogukäive ületas 5 000 €.

**Tulemus:**

| Kategooria | Müüdud erinevaid tooteid | Kogukäive (€) | Keskmine ühikuhind (€) |
|---|---:|---:|---:|
| meeste_riided | 81 | 389 738,54 | 188,99 |
| jalanõud | 71 | 379 576,38 | 219,59 |
| naiste_riided | 68 | 342 064,71 | 198,78 |
| aksessuaarid | 62 | 202 238,77 | 126,29 |
| laste_riided | 68 | 156 739,62 | 85,45 |

**Järeldus:** Suurima müügikäibe andsid meeste riided (389 738,54 €) ja jalanõud (379 576,38 €). Kõige väiksema käibega olid laste riided (156 739,62 €). Jalanõude kategoorias oli kõrgeim keskmine ühikuhind (219,59 €).

Kõik viis kategooriat ületasid valitud `HAVING` piiri.

**3. Kuised müügitrendid – CTE ja LAG()**

Kasutasin CTE-d (`WITH`) kuupõhise müügikäibe arvutamiseks ja `LAG()` aknafunktsiooni eelmise kuu käibe leidmiseks.

Arvutasin iga kuu müügikäibe muutuse eurodes võrreldes eelmise kuuga.

**Tulemus:**

| Kuu | Kogukäive (€) | Eelmise kuu käive (€) | Muutus (€) |
|---|---:|---:|---:|
| Jaanuar | 85 618,65 | – | – |
| Veebruar | 90 181,83 | 85 618,65 | +4 563,18 |
| Märts | 109 559,98 | 90 181,83 | +19 378,15 |
| Aprill | 113 838,38 | 109 559,98 | +4 278,40 |
| Mai | 116 843,02 | 113 838,38 | +3 004,64 |
| Juuni | 144 558,18 | 116 843,02 | +27 715,16 |
| Juuli | 146 800,80 | 144 558,18 | +2 242,62 |
| August | 144 870,17 | 146 800,80 | −1 930,63 |
| September | 109 267,47 | 144 870,17 | −35 602,70 |
| Oktoober | 127 622,32 | 109 267,47 | +18 354,85 |
| November | 110 573,94 | 127 622,32 | −17 048,38 |
| Detsember | 170 623,28 | 110 573,94 | +60 049,34 |

**Järeldus:** Suurim kuine käibekasv toimus detsembris (+60 049,34 €) ja suurim langus septembris (−35 602,70 €). Jaanuari muutust ei arvutatud, sest analüüs algas 2024. aasta jaanuarist.

**4. Edasijõudnute osa – kuust-kuusse käibekasv protsentides**

Täiendasin CTE ja `LAG()` abil koostatud trendianalüüsi, arvutades käibemuutuse protsentides. Nulliga jagamise vältimiseks kasutasin `NULLIF()` funktsiooni.

**Tulemus:**

| Kuu | Käibemuutus (%) |
|---|---:|
| Jaanuar | – |
| Veebruar | +5,3% |
| Märts | +21,5% |
| Aprill | +3,9% |
| Mai | +2,6% |
| Juuni | +23,7% |
| Juuli | +1,6% |
| August | −1,3% |
| September | −24,6% |
| Oktoober | +16,8% |
| November | −13,4% |
| Detsember | +54,3% |

**Järeldus:** Detsembri müügikäive suurenes novembriga võrreldes 54,3%, samas kui septembris vähenes käive augustiga võrreldes 24,6%. Need tulemused näitavad märkimisväärseid kuiseid kõikumisi, kuid ühe aasta andmete põhjal ei saa veel kinnitada püsivat hooajalisust.

### Müügianalüüsi kokkuvõte juhtkonnale 

2024. aasta müügikäive oli kuude lõikes kõikuv. Kõrgeim kuukäive oli detsembris (170 623,28 €) ja madalaim jaanuaris (85 618,65 €). Detsembri käive ületas jaanuari oma ligikaudu 99%.

Kuust-kuusse võrdluses toimus suurim kasv detsembris (+60 049,34 € ehk 54,3%) ning suurim langus septembris (−35 602,70 € ehk 24,6%).

Tootekategooriate lõikes andsid 2024. aastal suurima käibe meeste riided (389 738,54 €) ja jalanõud (379 576,38 €).

Juhtkonnal tuleks detsembri suurema müügimahu põhjal hinnata aastalõpu laovarude ja müügivõimekuse vajadust ning uurida septembri käibelangust müügikanalite, kampaaniate ja tootekategooriate lõikes.

Püsiva hooajalisuse hindamiseks on vajalik võrrelda mitme aasta sama perioodi müügitulemusi.

### Kvaliteedikontroll

Kontrollisin, kas 2024. aasta kogu müügikäive vastab tootekategooriate kaudu arvutatud kogukäibele.

**Tulemus:**

| Kontroll | Summa (€) |
|---|---:|
| 2024. aasta kogu müügikäive | 1 470 358,02 |
| Tootekategooriate kogukäive | 1 470 358,02 |
| Erinevus | 0,00 |

Mõlemad summad kattusid täpselt. Kontroll ei tuvastanud müügikäibe erinevusi `sales` ja `products` tabelite ühendamisel.

Lisaks kontrollisin juhendi kvaliteedinõudeid:

- `GROUP BY` päringud töötasid veatult.
- `HAVING` oli kasutatud tootekategooriate analüüsis.
- CTE ja `LAG()` olid kasutatud müügitrendide arvutamiseks.
- Juhtkonna kokkuvõte sisaldas andmetel põhinevaid ärilisi järeldusi.

**Kvaliteedikontroll läbitud.**

### Suurim üllatus

2024. aasta detsembris kasvas müügikäive võrreldes novembriga **54,3%**, mis oli aasta suurim suhteline kuine kasv.

Samal ajal vähenes septembri käive augustiga võrreldes **24,6%**. Nii suurte kõikumiste põhjuseid tasub täiendavalt uurida, et eristada kampaaniate, müügimahtude ja võimaliku hooajalisuse mõju.

### Soovitused Kristile

- **Aastalõpu müügiplaneerimine:** hinnata detsembri suurema müügimahu põhjal laovarude, personali ja müügivõimekuse vajadust.
- **Septembri languse analüüs:** uurida müügikanalite, kampaaniate ja tootekategooriate tulemusi, et selgitada käibelanguse põhjuseid.
- **Olulisemate kategooriate jälgimine:** pöörata tähelepanu meeste riiete ja jalanõude müügile, kuna need andsid 2024. aastal suurima käibe.
- **Kasumlikkuse hindamine:** analüüsida lisaks müügikäibele toodete kulusid ja kasumimarginaale.
- **Hooajalisuse kontroll:** võrrelda vähemalt mitme aasta müügitulemusi enne pikaajaliste hooajaliste otsuste tegemist.

### SQL-fail
[Helen – Sales and Marketing.sql](Helen%20-%20Sales%20and%20Marketing.sql)


---
## Kertu – Customers (Roll B)

**Domeen:** Kliendid  `customer`

### Peamised leiud


### SQL-analüüs

**1. Kliendigruppide analüüs CTE, iga kliendi kogukulutus ja segmenteerimine**

Ühendasin `sales` ja `customer` tabelid ning arvutasin iga kliendi kogukulutuse ning leidsin segmendi.

**Tulemus:**  
| Segment| Kliente | Keskmine_kulu|
|---|---|---|
| VIP | 19 | 18 227 € |
| Regular | 917 | 1 615 € |
| Tavaline | 1615| 492 €|

**2. TOP 10 klienti kogukulu järgi**

Kasutasin `COUNT ()`, `SUM()`, `GROUP BY`,`HAVING` ja `ORDER BY`  päringuid, et leida TOP 10 klienti, kes on sooritanud oste suurimas kogusummas.

**Tulemus:** Leitud 10 kõige suurema  koguostusummaga klienti.

| customer_id | kliendi_nimi | tellimuste_arv | kogukulu |
| ----------- | ------------ | -------------- | --------- |
| 3618        | Tiina Pärn   | 73             | 27 668.02  |
| 3350        | Priit Rand   | 76             | 26 286.10  |
| 2997        | Kevin Org    | 78             | 23 467.13  |
| 2889        | Laura Tammik | 74             | 23 385.82  |
| 3648        | Erkki Ilves  | 72             | 22 942.42  |
| 3605        | Anu Kuusik   | 77             | 21 626.10  |
| 4206        | Kersti Lill  | 71             | 21 137.47  |
| 2221        | Riina Lill   | 67             | 20 972.33  |
| 2154        | Annika Saar  | 66             | 20 726.79  |
| 3722        | Ago Kull     | 64             | 20 124.61  |

**3. Kliendisegmentide koondstatistika**

Kasutasin `COUNT()`, `SUM()`, `GROUP BY` ja `ORDER BY` päringuid jagamaks kliente segmentidesse. Piirid arvestatud week 3 leitud keskmise ostusumma järgi, mis oli 1 140 €
Piirid:
a) VIP kogukulu > 5000 €
b) Regular 5000 € < kogukulu >1000 €
c) Tavaline kogukulu < 1000 €

**Tulemus:** 
| Segment | Klientide_arv | Segmendi_keskmine_kaive |
| ------- | ------------- | ----------------------- |
| VIP     | 19            | 18 227.01               |
| Regular | 917           | 1 615.43                |
| Tavaline   | 1615          | 492.30                  |

**4. Segmentide koondstatistika**

Leidsin kõigi 3 segmendi keskmise käibe. Lisaks leidsin, millistes linnades on kõige rohkem VIP kliente. 

**Tulemus:**
| segment  | klientide_arv | segmendi_keskmine_kaive | enim_vip_kliente_linnades                                               |
| -------  | ------------- | ----------------------- | ----------------------------------------------------------------------- |
| VIP      | 19            | 18227.01                | Tallinn (8), Pärnu (6), Tartu (2), Jõhvi (1), Rakvere (1), Viljandi (1) |
| Regular  | 917           | 1615.43                 | -                                                                       |
| Tavaline | 1615          | 492.30                  | -                                                                       |

**5. Iga linna kohta leitud 5 top klienti, kliendisegment ja kogukulu**

Kasutasin `ROUND()`, `SUM()`, `GROUP BY`,`ORDER BY` `, `RANK` ja `CASE WHEN` päringuid, et leida esmalt kõikide klientide kogukulu ja linn, seejärel ägada need segmentideks ning leida igalinna kohta top 5 VIP klienti järjestatuna kogukulu järgi.  

**Tulemus:** Iga linna kohta leitud VIP klientide järjestus, Piiratud tulemusi iga linna kohta 5ga. 

### Suurim üllatus
 

### Soovitused Kristile
* Kasvatada VIP kientide lojaalsusprogrammi luues eraldi personaalse ja eksklusiivse teeninduse. Näiteks individuaalne suhtlus, eelisjuurdepääs uutele kollektsioonidele, stiilinõustamine.
* Aktiivse segmendi ehitamine VIP-ks läbi sihtmärgistatud progresseerivate pakkumiste. Need stimuleerivad keskmise ostukorvi kasvu ja sagedust.
* Näidata investoritele selget kliendiredelit: kuidas tavakliendist saab 1000 € künnise ületamisel Aktiivne klient ja sealt edasi 5000 € künnisega VIP.  See tõestab toimivat klienditeekonda ja stabiilset rahakäibet. 


SQL-analüüsid, tulemused, järeldused ja ühised soovitused lisame pärast ülesannete tegemist.

## Kasutatavad töövahendid

- Supabase SQL Editor
- PostgreSQL
- GitHub

---

## Ivo – Inventory (Roll c)

Domeen: Inventory Agregaatfunktsioonid: COUNT, SUM, AVG, MIN, MAX

Mida mina tegin selle nädala jooksul:
Minu roll - Inventory tabeli analüüs, lisaks products products + sales tabelid Analüüsisin tootekategooriaid, laoseisu ja müüdud vs laos suhteid. Kasutasin GROUP BY, HAVING ja window functions, et leida probleemsed kategooriad.

Peamised leiud:
* Kõige kõrgema keskmise hinnaga müüakse jalanõusid 214€/ühik.
* Kõige kasumlikum toode on sünteetilised sporditossud 10,7K€
* Andmekvaliteedi probleem (NULL väärtused): Igasse kategooriasse jagub tooteid ,mille puhul sertifikaadi info puudub täielikult.
* Andmete järgi on laos 350 toodet neist 231 oleks vaja kohe juurde tellida.

| product_id | toote_nimi | kategooria | laoseis | müüdud_kogu | käive | käive_tüki_kohta | kasum | kasum_tüki_kohta | omahind |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1031 | Õhuline sünteetiline sporditossud | jalanõusid | 536 | 63 | 27347 | 434.08 | 10570 | 167.77 | 266.31 |
| 1108 | Trendikas goretex oxfordid | jalanõusid | 6221 | 65 | 23376 | 371.05 | 9569 | 147.22 | 223.83 |
| 1223 | Praktiline kangast kõrge kontsaga kingad | jalanõusid | 396 | 68 | 21119 | 325.72 | 9034 | 132.91 | 192.81 |
| 1293 | Boheemlaslik linane pullover | naiste_riided | 810 | 64 | 17567 | 351.33 | 8576 | 134.00 | 217.33 |
| 1198 | Õhuline sünteetiline kõrge kontsaga kingad | jalanõusid | 7378 | 79 | 21296 | 291.72 | 8291 | 104.95 | 186.77 |
| 1143 | Õhuline linane jakk | naiste_riided | 367 | 63 | 19393 | 311.20 | 8103 | 128.67 | 182.53 |
| 1160 | Moodne villane nahk sandaalid | jalanõusid | 430 | 54 | 19171 | 368.67 | 7678 | 142.19 | 226.48 |
| 1210 | Vintage tweed kampsun | meeste_riided | 2901 | 52 | 18727 | 373.00 | 7661 | 147.39 | 225.61 |
| 1009 | Praktiline merino villane parka | meeste_riided | 564 | 59 | 19620 | 332.55 | 7423 | 125.81 | 206.74 |
| 1069 | Klassikaline seemisnahkne jooksutossud | jalanõusid | 285 | 45 | 18118 | 406.84 | 7407 | 163.94 | 242.90 |

| category | tooteid | keskmine_hind | min_hind | max_hind |
| :--- | :--- | :--- | :--- | :--- |
| jalanõusid | 73 | 214.10 | 58.49 | 434.08 |
| meeste_riided | 82 | 189.91 | 48.85 | 374.54 |
| naiste_riided | 70 | 192.58 | 32.93 | 351.33 |
| aksessuaarid | 67 | 125.71 | 13.53 | 231.13 |
| laste_riided | 70 | 85.30 | 22.70 | 168.82 |

Kõikide kategooriate laoseis kokku on sadades tuhandetes ühikutes, keskmine laojääk ühe toote kohta 750-1200+tk, seejuures on osad tooted miinuses.

Inventory tabel on “õhku täis”, laoseisud tuhandetes pea igal tootel ja negatiivse väärtusega laojäägid on andmebaasi viga.
* Tõenäoliselt on inventory tabelisse tehtud eraldiseisvaid andmebaasi importeid või käsitsi ülekirjutamisi ja kaks tabelit ei ole omavahel kooskõlas ja andmed on vigased.
* Inventory movements tabelist võib olla puudu näiteks välja liikumised (müük, mahakandmine) või inventory tabelit on valesti muudetud. Ideaalis peaks mõlemad numbrid olema samad.

Kuna laovarud või müüginumbrid on valed, muudab see küsitavaks ka kogu ülejäänud andmete/müükide õigsuse.

| kategooria | laoseis | laoseisu_väärtus_omahinnas | laoseis_päevades | müüdud_kokku_kogu_ajalugu | käive_kokku | liikumiste_neto_saldo | erinevus |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| jalanõusid | 86,352 | 13,756,779 | 29,439 | 3,737 | 774,035 | 45,452 | 40,900 |
| meeste_riided | 101,189 | 12,651,539 | 31,282 | 4,121 | 749,799 | 45,093 | 56,096 |
| naiste_riided | 63,970 | 8,947,625 | 22,613 | 3,604 | 686,464 | 42,983 | 20,987 |
| aksessuaarid | 50,081 | 4,536,257 | 19,747 | 3,231 | 393,036 | 33,569 | 16,512 |
| laste_riided | 75,193 | 4,320,705 | 25,989 | 3,686 | 305,844 | 44,115 | 31,078 |

Soovitused:
* Kontrollida laojääkide õigsust – laoseisu ja liikumiste logi erinevus on kokku ca 165 000 ühikut.
* Kontrollida tootenimede õigsust (nt puust müts)
* 18 tootel on öko sertifikaadid NULL väärtusega, kui sertifikaadid puuduvad, siis asendada null FALSE-ga.
