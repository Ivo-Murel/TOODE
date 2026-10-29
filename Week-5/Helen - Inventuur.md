# DACA – 5. nädal | UrbanStyle – Operations Dashboard

## Projekti ülevaade

**Autor:** Helen  
**Roll:** C – Operations Dashboard  
**Projekt:** UrbanStyle – müügi- ja laoseisu analüüs  
**Töövahendid:** PostgreSQL, Supabase, Power BI Desktop ja GitHub  
**Müügiandmete periood:** 2023–2026

## Projekti eesmärk

Minu ülesanne oli analüüsida UrbanStyle'i müügitulu müügikohtade lõikes ning laovarude jaotust tootekategooriate järgi.

Lisaks kohustuslikele visualiseeringutele koostasin täiendavad KPI-kaardid, asukohapõhise laoseisu diagrammi ja interaktiivsed filtrid.

Analüüsi eesmärk oli vastata järgmistele küsimustele:

- Millistes müügikohtades tekib kõige rohkem müügitulu?
- Kuidas jaotuvad laovarud tootekategooriate vahel?
- Kus paikneb kõige rohkem laovarusid?
- Kuidas on võimalik võrrelda müügitulu ja laoseisu valitud tootekategooria lõikes?
- Millised andmekvaliteedi probleemid mõjutavad tulemuste tõlgendamist?

---

## 1. Kasutatud andmed

Andmed pärinevad UrbanStyle'i PostgreSQL-andmebaasist, millele pääsesin ligi Supabase'i kaudu.

Power BI-s kasutasin järgmisi tabeleid:

| Tabel | Kasutus |
|---|---|
| `public sales` | Müügitulu ja müügikohtade analüüs |
| `public inventory` | Laokoguste ja asukohtade analüüs |
| `public products` | Toodete jaotamine kategooriatesse |
| `public customers` | Andmemudeli kliendiandmed |

### Olulised andmeväljad

| Väli | Tähendus |
|---|---|
| `sales.sale_date` | Müügitehingu kuupäev |
| `sales.store_location` | Müügikoht |
| `sales.total_price` | Müügitehingu summa |
| `inventory.quantity_available` | Saadaolev laokogus |
| `inventory.location` | Lao või kaupluse asukoht |
| `products.category` | Tootekategooria |
| `products.product_id` | Toodete sidumiseks kasutatav identifikaator |

Power BI andmemudelis kasutasin tabelitevahelisi seoseid.

Seos `products.product_id` ja `inventory.product_id` vahel võimaldas analüüsida laoseisu tootekategooriate järgi.

---

## 2. Müügitulu analüüs müügikohtade lõikes

### SQL-päring

```sql
SELECT
    store_location,
    SUM(total_price) AS tulu,
    COUNT(*) AS tehinguid
FROM sales
GROUP BY store_location
ORDER BY tulu DESC;
```

### Tulemused

| Müügikoht | Müügitulu (€) | Tehingute arv |
|---|---:|---:|
| Tallinn | 1 092 083,15 | 3 801 |
| Asukoht puudub (`NULL`) | 1 006 747,68 | 3 462 |
| Tartu | 521 603,11 | 1 797 |
| Pärnu | 288 744,04 | 1 058 |
| **Kokku** | **2 909 178,98** | **10 118** |

### Järeldus

Tallinnaga seotud müügitehingud moodustasid suurima tuvastatud müügikoha käibe – ligikaudu **1,09 miljonit eurot**.

Samas puudub ligikaudu **1,01 miljoni euro** väärtuses tehingutel müügikoha määrang.

See on oluline andmekvaliteedi probleem, sest takistab müügikohtade tulemuste täpset võrdlemist.

**Oluline:** puuduva müügikohaga tehinguid ei saa olemasolevate andmete põhjal automaatselt käsitleda veebimüügina.

### Äriline soovitus

Parandada müügitehingute andmekvaliteeti ning tagada, et iga tehingu juurde salvestatakse korrektne müügikoht või müügikanal.

---

## 3. Laoseisude analüüs tootekategooriate järgi

### SQL-päring

```sql
SELECT
    p.category,
    SUM(i.quantity_available) AS kogus
FROM inventory i
JOIN products p
    ON i.product_id = p.product_id
GROUP BY p.category
ORDER BY kogus DESC;
```

### Tulemused

| Tootekategooria | Laoseis (tk) |
|---|---:|
| `meeste_riided` | 101 189 |
| `jalanõusid` | 86 352 |
| `laste_riided` | 75 193 |
| `naiste_riided` | 63 970 |
| `aksessuaarid` | 50 081 |
| **Kokku** | **376 785** |

### Järeldus

Suurim laovaru on meeste rõivaste kategoorias (**101 189 tk**).

Väikseim laovaru on aksessuaaride kategoorias (**50 081 tk**).

Laokoguste erinevus ei tähenda automaatselt, et mõnes kategoorias on kaupa liiga palju või liiga vähe.

Selle hindamiseks tuleb laoseisu võrrelda tegeliku müügimahu ja toodete müügikiirusega.

### Äriline soovitus

Võrrelda iga tootekategooria laoseisu sama kategooria müügitulemustega.

See aitab hinnata varude piisavust ning tuvastada võimalikke üle- või alavarustuse riske.

---

## 4. Laoseisude analüüs asukohtade lõikes

Power BI-s koostasin täiendava diagrammi, mis näitab laovarude jaotust kesklao ning kaupluste vahel.

### Tulemused

| Asukoht | Laoseis (tk) |
|---|---:|
| Ladu | 162 334 |
| Pärnu | 78 978 |
| Tartu | 77 676 |
| Tallinn | 57 797 |
| **Kokku** | **376 785** |

### Järeldus

Suurim osa laovarudest paikneb kesklaos, kus on **162 334 toodet**.

Kauplustest on suurim laoseis Pärnus ja väikseim Tallinnas.

Kuna Tallinn on samal ajal suurima tuvastatud müügituluga müügikoht, tuleks täiendavalt uurida, kas varude paiknemine vastab piirkondlikule nõudlusele.

### Äriline soovitus

Võrrelda kaupluste müügitulu ja laoseisu ning hinnata, kas laovarude ümberjaotamine võiks parandada toodete kättesaadavust.

---

## 5. Power BI juhtimislaud

### Dashboard'i pealkiri

**UrbanStyle – müügi- ja laoseisu ülevaade (2023–2026)**

### Koostatud diagrammid

1. **Müügitulu müügikohtade lõikes (€)** – horisontaalne tulpdiagramm.
2. **Müügitulu osakaal aastate lõikes (%)** – rõngasdiagramm.
3. **Laoseisud tootekategooriate järgi (tk)** – horisontaalne tulpdiagramm.
4. **Laoseisud asukohtade lõikes (tk)** – horisontaalne tulpdiagramm.

### KPI-kaardid

| KPI | Tulemus |
|---|---:|
| Müügitulu kokku | 2,91 mln € |
| Laoseis kokku | 376 785 tk |

### Filtrid

- **Aastafilter:** 2023, 2024, 2025 ja 2026.
- **Tootekategooria filter:** võimaldab valida konkreetse tootekategooria.

### Ristfiltreerimine

Seadistasin Power BI-s diagrammidevahelise ristfiltreerimise.

Näiteks:

- Müügikoha valimisel muutub müügitulu KPI.
- Tootekategooria valimisel muutuvad vastavad müügi- ja laoseisunäitajad.
- Laoseisude kategooriadiagrammil valiku tegemisel muutub laoseisu KPI.

Laoseisu KPI arvutamisel kasutasin välja `quantity_available` summat, et näitaja reageeriks kategooriafiltrile korrektselt.

---

## 6. Aastate lõikes analüüsimine

Müügiandmed hõlmavad aastaid **2023–2026**.

Müügitulu osakaalu visualiseerimiseks koostasin rõngasdiagrammi.

2026. aasta müügitulu osakaal on ülejäänud aastatega võrreldes väga väike.

Aastate tulemuste võrdlemisel tuleb arvestada andmete ajalise katvusega.

### Miks laoseisu ei analüüsitud aastate lõikes?

Inventuuriandmed näitavad andmestikus salvestatud laokoguseid.

Väli `last_updated` ei tõenda iseenesest, kui suur oli tegelik laoseis iga varasema aasta lõpus.

Seetõttu ei esitanud ma laoseisu ekslikult ajaloolise aastapõhise näitajana.

---

## 7. Andmekvaliteet ja analüüsi piirangud

Analüüsi käigus ilmnesid järgmised tähelepanekud.

### Puuduvad müügikohad

Osadel müügitehingutel puudub `store_location` väärtus.

Need tehingud moodustavad märkimisväärse osa kogumüügitulust.

Dashboard'il tähistasin need väärtusega **„Asukoht puudub”**.

### Ajaloolise laoseisu puudumine

Olemasolevate andmete põhjal ei saa kinnitada iga aasta tegelikku ajaloolist laoseisu.

Seetõttu kasutasin laoseisu analüüsis andmestikus olevaid koguseid.

### Müügitulu ja laoseisu võrdlemine

Suur laokogus ei tähenda automaatselt liigset varu.

Täiendavaks analüüsiks tuleks kasutada müügikiirust, nõudlust ja varude liikumise näitajaid.

---

## 8. Peamised ärilised järeldused

### 1. Müügikohtade tulemuslikkus

Tallinn on suurima tuvastatud müügituluga müügikoht.

Samas on märkimisväärsel osal müügitehingutest müügikoht määramata.

**Soovitus:** parandada müügikohtade andmete kvaliteeti.

### 2. Tootekategooriate laoseis

Suurim laovaru on meeste rõivaste kategoorias.

**Soovitus:** võrrelda laokoguseid kategooriate müügimahuga.

### 3. Laovarude paiknemine

Suurim osa laovarudest asub kesklaos.

**Soovitus:** hinnata varude jaotust kaupluste tegeliku nõudluse põhjal.

### 4. Interaktiivne aruandlus

Power BI filtrid võimaldavad kiiresti võrrelda eri müügikohti, aastaid ja tootekategooriaid.

**Soovitus:** kasutada juhtimislauda regulaarseks müügi- ja laoseisu jälgimiseks.

---

## 9. Kasutatud töövahendid

| Töövahend | Kasutus |
|---|---|
| PostgreSQL | Andmete hoidmine |
| Supabase | SQL-päringute käivitamine ja tulemuste kontroll |
| Power BI Desktop | Andmemudel, KPI-d ja visualiseeringud |
| GitHub | Projektifailide ja dokumentatsiooni talletamine |
| ChatGPT | Tehniline juhendamine ja dokumentatsiooni koostamise abi |

---

## 10. Projekti failid

Minu Roll C töö juurde kuuluvad:

- Power BI aruanne (`.pbix`)
- Müügitulu SQL-päring
- Laoseisu SQL-päring
- Dashboard'i ekraanipilt
- Käesolev `README.md`

Failide täpsed nimed ja asukohad tuleb viia vastavusse GitHubi kausta tegeliku sisuga.

---

## 11. Tehisintellekti kasutamine

Kasutasin töö käigus ChatGPT-d abivahendina.


---

## 12. Kokkuvõte

DACA 5. nädala Roll C ülesande käigus koostasin UrbanStyle'i müügi- ja laoseisu analüüsi.

Töö tulemusena valmis **nelja diagrammi, kahe KPI-kaardi ja interaktiivsete filtritega Power BI juhtimislaud**.

Analüüs näitas, et:

- Tallinn on suurima tuvastatud müügituluga müügikoht.
- Märkimisväärsel osal müügitehingutest puudub müügikoha määrang.
- Suurim laovaru on meeste rõivaste kategoorias.
- Suurim osa varudest paikneb kesklaos.
- Müügitulu ja laoseisu ühine analüüs aitab toetada varude planeerimist.

**Peamine järeldus:** andmepõhine müügi- ja laoseisu analüüs aitab tuvastada andmekvaliteedi probleeme ning toetab paremaid varude juhtimise otsuseid.
