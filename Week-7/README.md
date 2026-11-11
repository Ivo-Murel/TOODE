# Nädal 7 – Python Pandas ja RFM-kliendisegmenteerimine

## Grupitöö esitlus

**Viide:** [Nädal 7 – UrbanStyle'i RFM-kliendisegmenteerimise grupitöö esitlus (Google Slides)](https://docs.google.com/presentation/d/1vbaf-APMytQiKg2gAz_WpOAedij0oYG_KPxh-iSFeSM/edit?slide=id.p#slide=id.p)


## Meeskond TOODE

**Liikmed:** Ivo, Kertu ja Helen

**Grupitöö teema:** UrbanStyle'i kliendiandmete analüüs ja RFM-kliendisegmenteerimine.

**Töö staatus:** Ettevalmistamisel.

## Nädala eesmärk

7. nädala eesmärk on analüüsida UrbanStyle'i müügi- ja kliendiandmeid Python Pandase abil, koostada RFM-kliendisegmenteerimine ning esitada juhtkonnale andmetel põhinevad järeldused ja soovitused.

Analüüsi abil soovime välja selgitada ettevõtte väärtuslikumad kliendid, tuvastada riskikliendid ning leida võimalusi kliendilojaalsuse suurendamiseks.

## Rollijaotus

| **Liige** | **Roll** | **Vastutus** |
|---|---|---|
| Ivo | A+b – Data Loading + Cleaning | Andmete laadimine, ühendamine ja puhastamine |
| Helen | C – RFM Analysis | RFM-näitajate arvutamine ja kliendisegmenteerimine |
| Kertu | D – Visualization | Visualiseerimine ja ärilised soovitused |

## Planeeritud töö

- UrbanStyle'i müügi- ja kliendiandmete laadimine.
- Andmete ühendamine ja kvaliteedikontroll.
- Puuduvate väärtuste ja duplikaatide kontrollimine.
- Recency, Frequency ja Monetary näitajate arvutamine.
- RFM-skooride määramine skaalal 1–5.
- Klientide jagamine RFM-segmentidesse.
- Plotly Expressi abil diagrammide koostamine.
- Tulemuste tõlgendamine ja äriliste soovituste esitamine.

## RFM-kliendisegmenteerimine

RFM-analüüs põhineb kolmel näitajal:

- **Recency (R)** – mitu päeva on möödunud kliendi viimasest ostust.
- **Frequency (F)** – mitu ostu klient on teinud.
- **Monetary (M)** – kui palju klient on kokku kulutanud.

RFM-skooride põhjal jagatakse kliendid segmentidesse.

| **RFM-skoor** | **Segment** |
|---|---|
| 13–15 | VIP Champions |
| 10–12 | Loyal |
| 7–9 | Potential |
| 4–6 | At Risk |
| 3 | Lost |

## Oodatavad tulemused ja järeldused

Grupitöö käigus soovime välja selgitada:

- VIP-klientide arvu ja nende kogukulutused.
- Lojaalsete klientide osakaalu.
- Riskiklientide arvu ja ostukäitumise.
- Klientide jaotuse erinevate RFM-segmentide vahel.
- Võimalused kliendisuhete ja turundustegevuste parandamiseks.

Tulemuste põhjal koostame soovitused UrbanStyle'i tootejuhile Marko Saarele.

**Tegelikud tulemused ja järeldused lisatakse pärast grupitöö valmimist.**

## Tööde dokumentatsioon

Grupitöö tulemusena valmib ühine Jupyter Notebook, mis sisaldab:

1. Andmete laadimist ja ühendamist.
2. Andmete puhastamist.
3. RFM-analüüsi.
4. Kliendisegmenteerimist.
5. Plotly visualiseeringuid.
6. Ärilisi soovitusi ja kokkuvõtet.

**Ühine notebook:** `week7_rfm_complete.ipynb` – lisatakse pärast grupitööd.

Iga meeskonnaliige dokumenteerib oma panuse ka individuaalses GitHubi portfoolios.

## Kasutatud töövahendid

- Python
- Pandas
- Plotly Express
- Google Colab / Jupyter Notebook
- PostgreSQL ja Supabase
- GitHub
- ChatGPT (analüüsi ja dokumentatsiooni abivahend)

## Kokkuvõte

7. nädala grupitöö keskendub UrbanStyle'i klientide ostukäitumise analüüsimisele ja RFM-kliendisegmenteerimisele.

Meeskonnas on töö jaotatud kolmeks: Ivo vastutab andmete ettevalmistamise, Helen RFM-analüüsi ning Kertu visualiseerimise ja äriliste soovituste eest.

Ühise töö tulemusena valmib terviklik andmeanalüüs, mis aitab toetada UrbanStyle'i kliendisuhete ja turundustegevuste arendamist.

Lõplikud tulemused, analüüsifailid ja soovitused lisatakse pärast grupitöö valmimist.
