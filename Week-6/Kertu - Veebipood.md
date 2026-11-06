# DACA – 6. nädal | UrbanStyle – Veebipoe müügianalüüs

## Projekti ülevaade

**Autor:** Kertu  
**Meeskond:** Toode  
**Roll:** A – Veebipood kauplus  
**Projekt:** UrbanStyle – asukohapõhine müügianalüüs  
**Töövahendid:** PostgreSQL, Supabase, Power BI Desktop, Google Slides, GitHub ja Gemini 
**Analüüsitav periood:** 2023–2026  
**Analüüsitav asukoht:** Veebipood

---

## Projekti eesmärk

Minu ülesanne oli analüüsida UrbanStyle'i Veebipoe müügitulemusi ning koostada interaktiivne Power BI juhtimislaud.

Analüüsi eesmärk oli vastata järgmistele küsimustele:

- Kui suur on Veebipoe müügitulu ja tellimuste arv?
- Kuidas on müügitulu aja jooksul muutunud?
- Millised on viis suurima müügituluga toodet?
- Kuidas jagunevad ostjad kliendisegmentide järgi?
- Millised andmekvaliteedi probleemid mõjutavad tulemuste tõlgendamist?
- Milliseid soovitusi saab analüüsi põhjal juhtkonnale anda?

Töö tulemusena valmis veebipoe dashboard koos järelduste ja soovitustega.

## 1. Kasutatud andmed

Analüüs põhineb UrbanStyle'i PostgreSQL-andmebaasi müügiandmetel.

Kasutasin Power BI-s müügiandmeid tabelist `public sales`, `public products`, `public customers` ja `public inventory` ning kontrollisin tulemusi Supabase'i SQL Editoris.

Power BI-s kasutasin ka toote- ja kliendiandmeid TOP 5 toodete ning lojaalsustasemete visualiseerimiseks.

### Andmete filtreerimine

Tallinna analüüsi jaoks kasutasin filtrit:

`Müügikoht = 'Online'`

## 2. Power BI juhtimislaua koostamine

Koostasin Power BI Desktopis eraldi Veebipoe juhtimislaua.

### Dashboard'i pealkiri

**Veebipoedashboard**

### Koostatud visualiseeringud

1. **Müügitulu kuude lõikes (€)** – joondiagramm müügitrendi jälgimiseks.
2. **TOP 5 toodet müügitulu järgi (€)** – vertikaalne tulpdiagramm.
3. **TOP 5 toodet müügikoguse järgi (tk)** – vertikaalne tulpdiagramm.
4. **TOP 5 toodet ärikasumi järgi (€)** – vertikaalne tulpdiagramm.
5. **Kliendisegment** – rõngasdiagramm.
6. **Inventori tabel** – tabeldiagramm.
7. **Müügitulu KPI** – kogu perioodi müügitulu.
8. **Tellimuste arvu KPI** – unikaalsete tellimuste arv.
9. **Keskmise ostusumma KPI** – keskmine müügitulu tellimuse kohta.
10. **Ärikasum KPI** - ärikasum asukoga lõikes.

### KPI-kaardid

| KPI | Tulemus |
|---|---:|
| Müügitulu kokku | 998 550 € |
| Tellimuste arv | 3436 |
| Keskmine ostusumma | 290,62 € |
| Ärikasum | -114 520 € |

### Interaktiivsed filtrid

Lisasin juhtimislauale:

- **Müügiperiood** – aastate 2023–2026 valimiseks.

Filter võimaldavad analüüsida Veebipoe müügitulemusi erinevate perioodide lõikes.

### Täiendavad selgitused

Lisasin müügitrendi diagrammile:

- keskmise Veebipoe müügitulu horisontaalse viitejoone;
- keskmise UrbanStyle müügitulu horisontaalse viitejoone
- märkuse 2024. aasta detsembri müügitipu kohta.

Ärikasumi lõikes TOP 5 diagrammile lisasin horisontaalse viitejoone keskmise ärikasumi kohta. 

Need selgitused aitavad juhtkonnal tulemusi paremini tõlgendada.

## 3. Müügitrendi analüüs

### Tulemused
UrbanStyle veebipoe müügitulemused on ajas kõikuvad ent 2023-2024 kasvava trendiga. Tunda on tugevat sessoonsust ja müügitipud jäävad Juuli ning Detsembri kuudesse. 
Kõige suurem kuukäive oli **2024. aasta detsembris – 63 204 €**.

### Järeldus

Detsember eristus ülejäänud kuudest kõrge müügitulu poolest. Mis müügitipu põhjustas kindlalt väita ei saa, sest kliendikampaaniate mõju ostuharjumustele jäi väikeseks. 

### Äriline soovitus

Uurida 2024. aasta detsembri müügitulemuse põhjuseid, näiteks kampaaniaid, hooajalisust ja toodete nõudlust.

See aitaks hinnata, kas edukat müügiperioodi on võimalik korrata.

## 4. TOP 5 toodete analüüs

Koostasin 3 vertikaalset tulpdiagrammi, mis näitavad veebipoe viit suurima müügituluga toodet, suurima müügiaarvuga toodet ja viit suurimat ärikasumit toovat toodet.

### Tulemus

Kõikides TOP 5 diagrammides figureerisid erinevad tooted.

### Järeldus

Toodete müügitulu võrdlus koguselise ja ärikasumi võrdlusega näitab, et populaarsed nii müügitulu kui koguselõikes on tooted, mis ei too ettevõttele erilist ärikasumit.
Kõige edukamate toodete tundmine on kasulik sortimendi ja kampaaniate planeerimisel.

### Äriline soovitus

 Populariseerida tuleks kõrge marginaaliga toodete müüki, et oleks võimalik ärikahjum seljatada. Jälgida uute toodete segmendi valikul ja olemasolvate toodete turunduskampaaniate planeerimisel ärikasumi maksimeerimise seisukohta. 

## 5. Kliendisegmentide analüüs

Koostasin rõngasdiagrammi Tallinna kaupluse ostjate jaotuse kuvamiseks kliendisegmendi järgi.

### Tulemused

| Kliendisegment| Müügitulu | Osakaal |
|---|---:|---:|
| Puudub | 98 000 € | 9,81% |
| VIP | 126 000 € | 12,67% |
| Aktiivne | 502 000 € | 50,22% |
| Tavaline | 273 000 € | 27,34% |
| **Kokku** | **998 550 €** | **100%** |

### Järeldus

**9,81% Veebipoe klientidest puudub kliendisegment.**
**50,22%** veebipoe klientidest on aktiivsed - see tähendab, et nad on soetanud veebipoest korduvalt, ning nende ostusummad jäävad 1000-5000 €vahele. Samuti aitabveebipoe aktiivsete klientide arvukus hoida kokku rendikuludelt.

### Äriline soovitus

Hoida Aktiivne kliendisegment aktiivsena läbi klientide korduvostude propageerimise ja lojaalsuskampaaniate. Tegu on UrbanStyle lojaalseimate klientidega, kes toovad poole veebipoe müügitulust. 

## 6. Andmekvaliteet ja analüüsi piirangud

Analüüsi käigus tuvastasin mitmeid probleeme.

* 2025. aastal esineb müügikirjeid ainult **3 kuul** ja 2026. aastal **1 kuul**. Seetõttu ei ole nende aastate müügitulu otse võrreldav 2023. ja 2024. aasta täisaasta tulemustega.
* Segadus kampaanianadmetes tabelis `promotions`
* Klientisegmendi analüüsis ilmnes, et kliendid on sooritanud oste erinevates poodides ja kindel kliendieelistus poodide suhtes puudub või on raskelt määratav.
* Mingil tehnilisel põhjusel ei toimi müügikoha filter veebipoe laovaru tabelis.

### Soovitused

- Kontrollida 2025–2026 müügiandmete täielikkust.
- Viia läbi klientidr ostuarjumuste ja poodide eelistuse süvaavalüüs.
- Kasutada aastate võrdlemisel võrreldava pikkusega perioode.
- Märkida aruannetes selgelt andmete piirangud.
- Viia läbi inventuur, selgitamaks tegelik laojäägi seisukord. 

## 7. Juhtkonnale esitatud andmelugu

* Kampaaniad ei taga kasumlikkust Ärikasum on 103,88 tuh € miinuses.  Allahindlused söövad ära kogu teenitud marginaali.  
Lõpetada tuleb laiaulatuslikud allahindluskampaaniad ja viia fookus täishinnaga tootegruppidele nt  ärikasumit toovatele kaupade müügile.

* E-pood genereerib rekordilist keskmist ostukorvi 290,13 €. Veebipoe klient on valmis tegema suuri ja kalleid oste, mis annab tugeva eelise logistika- ja 
pakendamiskulude optimeerimiseks tellimuse kohta.

* Veebipoe müügitulu on saavutanud miljonilise mastaabi - 924,05 tuh € ja 3185 tellimust. Digitaalne turuosa on edukalt kätte võidetud ja e-pood on 
tõestanud oma suutlikkust toimida UrbanStyle'i  tulugeneraatorina.

* Korduvostjad moodustavad poole kogu e-poe käibest - Aktiivsed kliendid: 465 tuh € / 50,38%. Äri püsivus tugineb tugevale püsikliendibaasile, mis võimaldab 
tulevikus vähendada kulukaid uute klientide hankimise kulusid.

## 8. Grupitöö ja esitlus

Tegutsesin 6. nädala grupitöös meeskonna **Toode** liikmena.
Minu vastutus oli **Roll A – Veebipoe analüüs**.

### Minu panus grupitöösse

- Koostasin veebipoe Power BI juhtimislaua.
- Kontrollisin müüginäitajaid SQL-päringuga.
- Analüüsisin müügitulu, TOP 5 tooteid ja kliendisegmente.
- Tuvastasin andmekvaliteedi piirangud.
- Koostasi veebipoe järeldused ja soovitused.
- Lisasin dashboard'i kuvatõmmise meeskonna Google Slidesi esitlusse.
- Panustasin meeskonna juhtkonna kokkuvõttesse veebipoe tulemustega.

## 9. Kasutatud töövahendid

| Töövahend | Kasutus |
|---|---|
| PostgreSQL | Müügiandmete hoidmine |
| Supabase | SQL-päringud ja tulemuste kontrollimine |
| Power BI Desktop | Andmeanalüüs, KPI-d ja visualiseeringud |
| Google Slides | Grupitöö esitluse koostamine |
| GitHub | Töö dokumenteerimine |
| Gemini | Tehniline juhendamine ja teksti koostamise abi |

AI kasutus grupitöös: Lasin AI pakkuda sobilike värve ilmestamaks grupitöö dashboardi vastavalt UrbanStyle värvipalettile. 
Küsisin abi DAX päringute koostamisel veateadete ilmumisel ja äriliste järelduste  loogilisuse tõestamisel. 
