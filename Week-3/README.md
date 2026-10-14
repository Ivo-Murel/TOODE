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
