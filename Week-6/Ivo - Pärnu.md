# DACA – 6. nädal | UrbanStyle – Pärnu kaupluse müügianalüüs

**Autor:** Ivo  
**Roll:** C – Pärnu kaupluse analüüs  
**Projekt:** UrbanStyle – asukohapõhine müügianalüüs  
**Analüüsitav asukoht:** Pärnu  

---

## 1. Kasutatud andmed

Analüüs põhineb UrbanStyle'i PostgreSQL-andmebaasi müügiandmetel.  
Kasutasin Power BI-s müügiandmeid tabelist `public sales` ning kontrollisin tulemusi Supabase'i SQL Editoris.

### Olulised andmeväljad

| Väli | Kasutus |
| :--- | :--- |
| `sale_date` | Müügikuupäev ja ajaline analüüs |
| `store_location` | Pärnu kaupluse eristamine |
| `total_price` | Müügitulu arvutamine |
| `invoice_id` | Unikaalsete tellimuste loendamine |

Power BI-s kasutasin ka toote- ja kliendiandmeid TOP toodete ning kategooriate visualiseerimiseks.

### Andmete filtreerimine

Pärnu analüüsi jaoks kasutasin filtrit:  
`store_location = 'Pärnu'`  
See võimaldas keskenduda ainult Pärnu kaupluse tulemustele.

---

## 2. Power BI kujundus

Koostasin Power BI  Pärnu kaupluse juhtimislaua.

### Dashboard'i pealkiri
**PÄRNU KAUPLUSE TULEMUSED 2024 VS 2023**

### Koostatud visualiseeringud

1. **UrbanStyle müügid 2023–2024** – joondiagramm müügitrendide jälgimiseks koos viitejoone ja turismihooaja märkustega.
2. **Müük aastate lõikes** – tulpdiagramm käibe võrdlemiseks (2023 vs 2024).
3. **Müük kategooriate kaupa** – sektordiagramm (jalanõud, meeste/naiste riided, aksessuaarid, laste riided).
4. **TOP 10 tooted** – horisontaalne tulpdiagramm enimmüüdud toodete tuvastamiseks.
5. **Kogukäibe KPI** – kogu perioodi käive (`273K €`).
6. **Müügikasvu KPI (2024 vs 2023)** – käibekasvu näitaja (`4.30%`).
7. **Unikaalsete klientide arv ja muutus** – klientide koguarv (`709`) ja kasv protsentides (`11.75%`).

---

## 3. Müügiülevaade ja põhitegurid

* **Müügikasv:** Pärnu kaupluse müügikasv võrreldaval perioodil (2024 vs 2023) oli **+4,30%** ning klientide arv kasvas **+11,75%** (kokku 709 unikaalset klienti).
* **Hooajalisus:** Suvehooaja tipus saavutatakse tavaliselt **15–17K €** kuukäive. Pärast aprilli müük korraks langeb, kuid hakkab uuesti kasvama Q2 teises pooles. Oktoobrist alates hakkab müük taas langema ja saavutab uue tipu detsembris.
* **Kategooriad:** Üle **50% müügist** tuleb jalanõudelt ja meeste riietelt.

---

## 4. Peamised leiud

* **Käibe maht:** Pärnu kaupluse kogunäitaja vaadeldaval perioodil on **273K €**.
* **Kliendibaas:** Pärnu kliendibaas on tervislikus kasvustruktuuris (+11,75% unikaalseid kliente).
* **Tooted:** TOP toodete seas domineerivad *Õuhune goretex kingad* ja *Praktiline kangast kõrge kontsaga kingad* (mõlemad ligikaudu 3.8K €).
* **Müügitsükkel:** Suvehooajal ja aasta lõpus (detsember) on selged müügitipud, samas kui sügise alguses (oktoober) toimub nõudluse jahtumine.

---

## 5. Edasised tegevused ja soovitused juhtkonnale

1. **Alustada suvekampaaniaga varem (mai):** Et haarata kinni suvehooaja varajasest kasvust.
2. **Keskenduda okt–nov kampaaniatele:** Toetamaks sügisest müügilangust.
3. **Mitte teha kampaaniad jaan–veebr:** Vältimaks madala tasuvusega turundustegevusi.
4. **Laovaru tagamine:** Veenduda, et TOP toodetel on kõrghooaja alguses piisav laojääk.
