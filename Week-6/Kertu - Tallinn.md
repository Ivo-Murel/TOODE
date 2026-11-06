# DACA – 6. nädal | UrbanStyle – Tallinna kaupluse müügianalüüs

## Projekti ülevaade

**Autor:** Kertu  
**Meeskond:** Toode  
**Roll:** A – Tallinna kauplus  
**Projekt:** UrbanStyle – asukohapõhine müügianalüüs  
**Töövahendid:** PostgreSQL, Supabase, Power BI Desktop, Google Slides, GitHub ja ChatGPT  
**Analüüsitav periood:** 2023–2026  
**Analüüsitav asukoht:** Tallinn

---

## Projekti eesmärk

Minu ülesanne oli analüüsida UrbanStyle'i Tartu kaupluse müügitulemusi ning koostada interaktiivne Power BI juhtimislaud.

Analüüsi eesmärk oli vastata järgmistele küsimustele:

- Kui suur on Tallinna kaupluse müügitulu ja tellimuste arv?
- Kuidas on müügitulu aja jooksul muutunud?
- Millised on viis suurima müügituluga toodet?
- Kuidas jagunevad ostjad kliendisegmentide järgi?
- Millised andmekvaliteedi probleemid mõjutavad tulemuste tõlgendamist?
- Milliseid soovitusi saab analüüsi põhjal juhtkonnale anda?

Töö tulemusena valmis Tallinna kaupluse dashboard koos järelduste ja soovitustega.

## 1. Kasutatud andmed

Analüüs põhineb UrbanStyle'i PostgreSQL-andmebaasi müügiandmetel.

Kasutasin Power BI-s müügiandmeid tabelist `public sales`, `public products`, `public customers` ja `public inventory` ning kontrollisin tulemusi Supabase'i SQL Editoris.

Power BI-s kasutasin ka toote- ja kliendiandmeid TOP 5 toodete ning lojaalsustasemete visualiseerimiseks.

### Andmete filtreerimine

Tallinna analüüsi jaoks kasutasin filtrit:

`Müügikoht = 'Tallinn'`

## 2. Power BI juhtimislaua koostamine

Koostasin Power BI Desktopis eraldi Tallinna kaupluse juhtimislaua.

### Dashboard'i pealkiri

**Tallinna kaupluse dashboard**

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
| Müügitulu kokku | 1,01 mln € |
| Tellimuste arv | 3521 |
| Keskmine ostusumma | 286,63 € |
| Ärikasum | -113 000 |

### Interaktiivsed filtrid

Lisasin juhtimislauale:

- **Müügiperiood** – aastate 2023–2026 valimiseks.

Filter võimaldavad analüüsida Tallinna müügitulemusi erinevate perioodide lõikes.

### Täiendavad selgitused

Lisasin müügitrendi diagrammile:

- keskmise Tallinna müügitulu horisontaalse viitejoone;
- keskmise UrbanStyle müügitulu horisontaalse viitejoone
- märkuse 2024. aasta detsembri müügitipu kohta.
- märkuse 2023. aasta jõulumüügitipu kohta.

Ärikasumi lõikes TOP 5 diagrammile lisasin horisontaalse viitejoone keskmise ärikasumi kohta. 

Need selgitused aitavad juhtkonnal tulemusi paremini tõlgendada.

## 3. Müügitrendi analüüs

### Tulemused
UrbanStyle Tallinna poe müügitulemused on ajas kõikuvad. Tunda on tugevat sessoonsust ja müügitipud jäävad Juuli ning Detsembri kuudesse. 
Kõige suurem kuukäive oli **2024. aasta detsembris – 64 170 €**.
2023.  aasta jüulumüük oli madalama kogumüügiga. 

### Järeldus

Detsember eristus ülejäänud kuudest kõrge müügitulu poolest. Mis müügitipu põhjustas kindlalt väita ei saa, sest kliendikampaaniate mõju ostuharjumustele jäi väikeseks. 

### Äriline soovitus

Uurida 2024. aasta detsembri müügitulemuse põhjuseid, näiteks kampaaniaid, hooajalisust ja toodete nõudlust.

See aitaks hinnata, kas edukat müügiperioodi on võimalik korrata.

## 4. TOP 5 toodete analüüs

Koostasin 3 vertikaalset tulpdiagrammi, mis näitavad Tallinna kaupluse viit suurima müügituluga toodet, suurima müügiaarvuga toodet ja viit suurimat ärikasumit toovat toodet.

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
| Puudub | 98 000 € | 9,71% |
| VIP | 122 000 € | 12,07% |
| Aktiivne | 513 000 € | 50,82% |
| Tavaline | 277 000 € | 27,4% |
| **Kokku** | **1,01 mln €** | **100%** |

### Järeldus

**9,71% Tallinna klientidest puudub kliendisegment.**
**50,82%** Tallinna klientidest on aktiivsed - see tähendab, et nad on soetanud Tallinna poest korduvalt, ning nende ostusummad jäävad 1000-5000 €vahele. 

### Äriline soovitus

Hoida Aktiivne kliendisegment aktiivsena läbi klientide korduvostude propageerimise ja lojaalsuskampaaniate. Tegu on UrbanStyle lojaalseimate klientidega, kes toovad poole Tallinna poe müügitulust. 

## 6. Andmekvaliteet ja analüüsi piirangud

Analüüsi käigus tuvastasin mitmeid probleeme.

* 2025. aastal esineb müügikirjeid ainult **3 kuul** ja 2026. aastal **1 kuul**. Seetõttu ei ole nende aastate müügitulu otse võrreldav 2023. ja 2024. aasta täisaasta tulemustega.
* Segadus kampaanianadmetes tabelis `promotions`
* Klientisegmendi analüüsis ilmnes, et kliendid on sooritanud oste erinevates poodides ja kindel kliendieelistus poodide suhtes puudub või on raskelt määratav.
* Tallinna kaupluse laojääk on 3,5 korda suurem kui oleks tarvilik.

### Soovitused

- Kontrollida 2025–2026 müügiandmete täielikkust.
- Viia läbi klientidr ostuarjumuste ja poodide eelistuse süvaavalüüs.
- Kasutada aastate võrdlemisel võrreldava pikkusega perioode.
- Märkida aruannetes selgelt andmete piirangud.
- Viia läbi inventuur, selgitamaks tegelik laojäägi seisukord. 

## 7. Juhtkonnale esitatud andmelugu

* Ärikasum on miinuses -113,01 tuh €, kuigi kogukäive on 1,01 mln €. Suur müügitulu ei taga kasumlikkust, sest kampaaniad ja kõrged püsikulud söövad marginaali.
Tuleb koheselt üle vaadata allahindlusstrateegiad ja tegevuskulud.

* Aktiivsed kliendid moodustavad enamuse ehk 50,82% kogu müügitulust. Äri sõltub kriitiliselt ühest kindlast segmendist. Kui me neid ei hoia, kukub käive poole võrra,
mistõttu tuleb luua spetsiaalne lojaalsusprogramm just sellele sihtrühmale.

* Keskmine ostukorv on 286,63 €, kuid müügimahud kõiguvad tugevalt kuude lõikes. Kliendid teevad korraga suuri oste, kuid harva (n hooajaliste tippude ajal juulis ja detsembris).
Stabiilse rahavoo tagamiseks tuleb juurutada vahepealsetel madalperioodidel korduvostudele suunatud sihtkampaaniaid.

* Laojääk 3417 tk on ligi 3,5 korda suurem kui kriitiline reorder punkt. Raha on kinni seisvas kaubas (nt tabeli lõpus olevad luksuslikud smokingülikonnad ja flanellsärgid).
Vaba rahavoo tekitamiseks ja miinuse katmiseks tuleb korraldada kiire tühjendusmüük madala ringlusega toodetele.

## 8. Grupitöö ja esitlus

Tegutsesin 6. nädala grupitöös meeskonna **Toode** liikmena.
Minu vastutus oli **Roll a – Tallinna kaupluse analüüs**.

### Minu panus grupitöösse

- Koostasin Tallinna kaupluse Power BI juhtimislaua.
- Kontrollisin müüginäitajaid SQL-päringuga.
- Analüüsisin müügitulu, TOP 5 tooteid ja kliendisegmente.
- Tuvastasin andmekvaliteedi piirangud.
- Koostasi nTallinna kaupluse järeldused ja soovitused.
- Lisasin dashboard'i kuvatõmmise meeskonna Google Slidesi esitlusse.
- Panustasin meeskonna juhtkonna kokkuvõttesse Tallinna tulemustega.

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
