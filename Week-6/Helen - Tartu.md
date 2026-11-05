
# DACA – 6. nädal | UrbanStyle – Tartu kaupluse müügianalüüs

## Projekti ülevaade

**Autor:** Helen  
**Meeskond:** Toode  
**Roll:** B – Tartu kauplus  
**Projekt:** UrbanStyle – asukohapõhine müügianalüüs  
**Töövahendid:** PostgreSQL, Supabase, Power BI Desktop, Google Slides, GitHub ja ChatGPT  
**Analüüsitav periood:** 2023–2026  
**Analüüsitav asukoht:** Tartu

---

## Projekti eesmärk

Minu ülesanne oli analüüsida UrbanStyle'i Tartu kaupluse müügitulemusi ning koostada interaktiivne Power BI juhtimislaud.

Analüüsi eesmärk oli vastata järgmistele küsimustele:

- Kui suur on Tartu kaupluse müügitulu ja tellimuste arv?
- Kuidas on müügitulu aja jooksul muutunud?
- Millised on viis suurima müügituluga toodet?
- Kuidas jagunevad ostjad lojaalsustasemete järgi?
- Millised andmekvaliteedi probleemid mõjutavad tulemuste tõlgendamist?
- Milliseid soovitusi saab analüüsi põhjal juhtkonnale anda?

Töö tulemusena valmis Tartu kaupluse dashboard koos äriliste järelduste ja soovitustega.

---

## 1. Kasutatud andmed

Analüüs põhineb UrbanStyle'i PostgreSQL-andmebaasi müügiandmetel.

Kasutasin Power BI-s müügiandmeid tabelist `public sales` ning kontrollisin tulemusi Supabase'i SQL Editoris.

### Olulised andmeväljad

| Väli | Kasutus |
|---|---|
| `sale_date` | Müügikuupäev ja ajaline analüüs |
| `store_location` | Tartu kaupluse eristamine |
| `total_price` | Müügitulu arvutamine |
| `invoice_id` | Unikaalsete tellimuste loendamine |

Power BI-s kasutasin ka toote- ja kliendiandmeid TOP 5 toodete ning lojaalsustasemete visualiseerimiseks.

### Andmete filtreerimine

Tartu analüüsi jaoks kasutasin filtrit:

`store_location = 'Tartu'`

See võimaldas keskenduda ainult Tartu kaupluse tulemustele.

---

## 2. Müügitulu kontrollimine SQL-iga

Power BI-s kuvatud tulemuste kontrollimiseks koostasin Supabase'is SQL-päringu.

### SQL-päring

```sql
SELECT
    EXTRACT(YEAR FROM sale_date)::int AS aasta,
    COUNT(*) AS muugiridu,
    COUNT(DISTINCT invoice_id) AS tellimusi,
    ROUND(SUM(total_price)::numeric, 2) AS muugitulu,
    COUNT(DISTINCT DATE_TRUNC('month', sale_date)) AS kuid_andmetega
FROM public.sales
WHERE store_location = 'Tartu'
GROUP BY EXTRACT(YEAR FROM sale_date)
ORDER BY aasta;
```

### Tulemused aastate lõikes

| Aasta | Tellimused | Müügitulu (€) | Kuud, mil on müügikirjeid |
|---|---:|---:|---:|
| 2023 | 777 | 229 316,99 | 12 |
| 2024 | 905 | 260 044,23 | 12 |
| 2025 | 112 | 31 669,84 | 3 |
| 2026 | 3 | 572,05 | 1 |
| **Kokku** | **1 797** | **521 603,11** | |

### Järeldus

2024. aastal suurenes Tartu kaupluse müügitulu võrreldes 2023. aastaga **13,4%**.

Samal ajal kasvas tellimuste arv 777-lt 905-ni ehk ligikaudu **16,5%**.

See näitab, et müügitulu kasvu toetas eelkõige suurem tellimuste arv.

**Oluline:** 2025. ja 2026. aasta andmed on osalised. Seetõttu ei saa nende aastate väiksemat müügitulu tõlgendada tõendatud müügilangusena.

---

## 3. Power BI juhtimislaua koostamine

Koostasin Power BI Desktopis eraldi Tartu kaupluse juhtimislaua.

### Dashboard'i pealkiri

**UrbanStyle – Tartu kaupluse müügianalüüs (2023–2026)**

### Koostatud visualiseeringud

1. **Müügitulu kuude lõikes (€)** – joondiagramm müügitrendi jälgimiseks.
2. **TOP 5 toodet müügitulu järgi (€)** – horisontaalne tulpdiagramm.
3. **Ostjate lojaalsustasemete jaotus** – rõngasdiagramm.
4. **Müügitulu KPI** – kogu perioodi müügitulu.
5. **Tellimuste arvu KPI** – unikaalsete tellimuste arv.
6. **Keskmise ostusumma KPI** – keskmine müügitulu tellimuse kohta.

### KPI-kaardid

| KPI | Tulemus |
|---|---:|
| Müügitulu kokku | 521 603,11 € |
| Tellimuste arv | 1 797 |
| Keskmine ostusumma | 290,26 € |
| Unikaalsed ostjad | 1 119 |

### Interaktiivsed filtrid

Lisasin juhtimislauale:

- **Aastafilter** – aastate 2023–2026 valimiseks.
- **Tootekategooria filter** – valitud kategooria tulemuste uurimiseks.

Filtrid võimaldavad analüüsida Tartu müügitulemusi erinevate perioodide ja tootekategooriate lõikes.

### Täiendavad selgitused

Lisasin müügitrendi diagrammile:

- keskmise müügitulu horisontaalse viitejoone;
- märkuse 2024. aasta detsembri müügitipu kohta.

Lojaalsustasemete diagrammile lisasin märkuse puuduvate kliendiandmete kohta.

Need selgitused aitavad juhtkonnal tulemusi paremini tõlgendada.

---

## 4. Müügitrendi analüüs

### Tulemused

2023. aasta müügitulu oli **229 316,99 €**.

2024. aasta müügitulu oli **260 044,23 €**.

Müügitulu suurenes aastaga **13,4%**.

Kõige suurem kuukäive oli **2024. aasta detsembris – 33 046,60 €**.

### Järeldus

Tartu kaupluse müügitulemused paranesid 2024. aastal.

Detsember eristus ülejäänud kuudest kõrge müügitulu poolest.

Samas ei saa ainult ühe kuu põhjal kindlalt järeldada, mis müügitipu põhjustas.

### Äriline soovitus

Uurida 2024. aasta detsembri müügitulemuse põhjuseid, näiteks kampaaniaid, hooajalisust ja toodete nõudlust.

See aitaks hinnata, kas edukat müügiperioodi on võimalik korrata.

---

## 5. TOP 5 toodete analüüs

Koostasin horisontaalse tulpdiagrammi, mis näitab Tartu kaupluse viit suurima müügituluga toodet.

### Tulemus

TOP 5 toodete seas oli suurima müügituluga **klassikaline seemisnahkne jooksutoss**, mille müügitulu oli ligikaudu **6 400 €**.

### Järeldus

Toodete müügitulu võrdlus aitab tuvastada, millised tooted annavad kaupluse käibesse suurema panuse.

Kõige edukamate toodete tundmine on kasulik sortimendi ja kampaaniate planeerimisel.

### Äriline soovitus

Jälgida TOP 5 toodete müügitulemusi ning võrrelda neid laoseisu ja kampaaniatega.

See aitab teha paremaid otsuseid toodete saadavuse ja turundustegevuste kohta.

---

## 6. Ostjate lojaalsustasemete analüüs

Koostasin rõngasdiagrammi Tartu kaupluse ostjate jaotuse kuvamiseks lojaalsustasemete järgi.

### Tulemused

| Lojaalsustase | Ostjaid | Osakaal |
|---|---:|---:|
| Puudub | 446 | 39,86% |
| Silver | 246 | 21,98% |
| Gold | 230 | 20,55% |
| Bronze | 197 | 17,61% |
| **Kokku** | **1 119** | **100%** |

Osakaalud kehtivad kõigi aastate valiku korral.

### Järeldus

**39,86% Tartu ostjatest puudub lojaalsustaseme märge.**

See on oluline andmekvaliteedi probleem, sest nii suure osa klientide lojaalsussegment pole teada.

Puuduv lojaalsustase ei tähenda automaatselt, et klient ei kuulu lojaalsusprogrammi.

### Äriline soovitus

Kontrollida, miks osal klientidest lojaalsustase puudub, ning täiendada kliendiandmeid.

See võimaldaks tulevikus täpsemalt analüüsida erinevate kliendisegmentide ostukäitumist.

---

## 7. Andmekvaliteet ja analüüsi piirangud

Analüüsi käigus tuvastasin kaks peamist andmekvaliteedi probleemi.

### 7.1. Osalised müügiandmed

2025. aastal esineb müügikirjeid ainult **3 kuul** ja 2026. aastal **1 kuul**.

Seetõttu ei ole nende aastate müügitulu otse võrreldav 2023. ja 2024. aasta täisaasta tulemustega.

**Oluline:** kuude arv näitab, mitmel kuul on andmebaasis müügikirjeid. See ei kinnita, kas ülejäänud kuudel müüki ei toimunud või on andmed puudu.

### 7.2. Puuduvad lojaalsustasemed

**446 ostjal ehk 39,86% Tartu ostjatest** puudub lojaalsustaseme märge.

See piirab kliendisegmentide põhjal tehtavate järelduste usaldusväärsust.

### Soovitused

- Kontrollida 2025–2026 müügiandmete täielikkust.
- Täiendada puuduvad kliendi lojaalsustasemed.
- Kasutada aastate võrdlemisel võrreldava pikkusega perioode.
- Märkida aruannetes selgelt andmete piirangud.

---

## 8. Peamised ärilised järeldused

### 1. Müügitulu kasv

2024. aastal kasvas Tartu kaupluse müügitulu **13,4%** võrreldes 2023. aastaga.

**Soovitus:** jätkata müügitrendi jälgimist ja uurida kasvu mõjutanud tegureid.

### 2. Detsembri müügitipp

2024. aasta detsembris saavutati suurim kuukäive – **33 046,60 €**.

**Soovitus:** analüüsida detsembri kampaaniaid ja hooajalist nõudlust.

### 3. Populaarseim toode

TOP 5 toodete seas juhtis klassikaline seemisnahkne jooksutoss ligikaudu **6 400 €** müügituluga.

**Soovitus:** arvestada edukamate toodetega sortimendi ja kampaaniate planeerimisel.

### 4. Puudulikud kliendiandmed

Ligi **40% ostjatest** puudub lojaalsustaseme märge.

**Soovitus:** parandada kliendiandmete kvaliteeti, et lojaalsussegmentide analüüs oleks usaldusväärsem.

### 5. Andmete ajaline katvus

2025. ja 2026. aasta müügiandmed on osalised.

**Soovitus:** vältida puudulike aastate põhjal järeldusi tegeliku müügilanguse kohta.

---

## 9. Juhtkonnale esitatud andmelugu

Tartu kaupluse müügitulu oli vaadeldaval perioodil kokku **521 603,11 €** ning 2024. aastal kasvas müügitulu **13,4%** võrreldes 2023. aastaga.

Kõige suurem kuukäive saavutati 2024. aasta detsembris ning TOP 5 toodete seas oli edukaim klassikaline seemisnahkne jooksutoss.

Analüüsi usaldusväärsust piiravad 2025–2026 osalised müügiandmed ja ligi 40% ostjate puuduvad lojaalsustasemed.

**Peamine soovitus:** täiendada müügi- ja kliendiandmeid ning kasutada edasistes äriotsustes kontrollitud ja võrreldavaid andmeid.

---

## 10. Grupitöö ja esitlus

Tegutsesin 6. nädala grupitöös meeskonna **Toode** liikmena.

Minu vastutus oli **Roll B – Tartu kaupluse analüüs**.

### Minu panus grupitöösse

- Koostasin Tartu kaupluse Power BI juhtimislaua.
- Kontrollisin müüginäitajaid SQL-päringuga.
- Analüüsisin müügitulu, TOP 5 tooteid ja ostjate lojaalsustasemeid.
- Tuvastasin andmekvaliteedi piirangud.
- Koostasin Tartu kaupluse ärilised järeldused ja soovitused.
- Lisasin dashboard'i kuvatõmmise meeskonna Google Slidesi esitlusse.
- Panustasin meeskonna juhtkonna kokkuvõttesse Tartu tulemustega.

---

## 11. Kasutatud töövahendid

| Töövahend | Kasutus |
|---|---|
| PostgreSQL | Müügiandmete hoidmine |
| Supabase | SQL-päringud ja tulemuste kontrollimine |
| Power BI Desktop | Andmeanalüüs, KPI-d ja visualiseeringud |
| Google Slides | Grupitöö esitluse koostamine |
| GitHub | Töö dokumenteerimine |
| ChatGPT | Tehniline juhendamine ja teksti koostamise abi |

---

## 12. Projekti failid

Tartu kaupluse analüüsiga seotud materjalid:

- **Power BI fail:** `UrbanStyle_Week6_Tartu.pbix`
- **Power BI aruandeleht:** `Tartu`
- **Dashboard'i kuvatõmmis:** lisatud meeskonna Google Slidesi esitlusse
- **SQL-päring:** aastapõhiste müügitulemuste kontrollimiseks
- **GitHubi dokumentatsioon:** `Week-6 / Helen - Tartu.md`

---





Müügitulemusi kontrollisin Supabase'i andmete põhjal ning lõplikud järeldused lähtuvad Tartu kaupluse analüüsist.

---

## 14. Kokkuvõte

DACA 6. nädala grupitöö raames koostasin UrbanStyle'i Tartu kaupluse interaktiivse Power BI müügianalüüsi.

Töö tulemusena valmis **kolme põhilise diagrammi, kolme KPI-kaardi, interaktiivsete filtrite, viitejoone ja selgitavate märkustega juhtimislaud**.

Analüüs näitas, et:

- Tartu kaupluse kogumüügitulu oli **521 603,11 €**.
- Tellimusi oli kokku **1 797**.
- 2024. aastal kasvas müügitulu **13,4%**.
- Suurim kuukäive oli 2024. aasta detsembris.
- TOP 5 toodete seas juhtis klassikaline seemisnahkne jooksutoss.
- Ligi 40% ostjatest puudub lojaalsustaseme märge.
- 2025–2026 müügiandmete osaline katvus piirab aastate võrdlemist.

**Peamine järeldus:** Tartu kaupluse 2024. aasta müügitulemused paranesid, kuid usaldusväärsete edasiste analüüside jaoks tuleb parandada müügi- ja kliendiandmete kvaliteeti.
