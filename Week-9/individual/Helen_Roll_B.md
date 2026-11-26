# Roll B – Tehnilise intervjueerija vaade

**Meeskond:** TOODE  
**Ettevõte:** UrbanStyle  
**Roll:** B – Technical Interviewer  
**Peatükid:**
- 5 – DA tööpakkumise kirjutamine
- 6 – DA intervjuu stsenaarium

## 1. Eesmärk

Hinnata, kas andmeanalüütiku kandidaat oskab iseseisvalt andmeid
analüüsida, kirjutada kvaliteetset koodi, kontrollida tulemuste
usaldusväärsust ning põhjendada oma tehnilisi valikuid.

Tegemist on üldise värbamisjuhendiga, mitte konkreetse kandidaadi
hindamisega.

## 2. Peatükk 5 – DA tööpakkumise kirjutamine

Tehnilise intervjueerija vaatenurgast on olulised järgmised
oskuspõhised nõuded:

- **SQL:** andmete filtreerimine, ühendamine ja agregeerimine.
- **Python ja Pandas:** andmete puhastamine, töötlemine ja analüüsimine.
- **Power BI või Plotly:** andmete visualiseerimine ja tulemuste
  tõlgendamine.
- **Git ja dokumentatsioon:** oskus kasutada versioonihaldust,
  kirjutada loetavat koodi ning dokumenteerida oma analüüse nii,
  et teised meeskonnaliikmed saaksid neid mõista ja korrata.

Oluline on teadmiste praktiline rakendamine ja oskus oma
lahendusi põhjendada.

## 3. Peatükk 6 – DA intervjuu stsenaarium

### B. Tehniline pädevus ja vigade otsimine
(Technical Interviewer – 15 min)

**Küsimus 3:** Sinu SQL-päring annab pärast JOIN-i oodatust kaks
korda rohkem ridu. Kuidas tuvastad vea põhjuse ja kontrollid tulemust?

**Oodatav vastus:** Kontrollin JOIN-tingimusi, ühendamisvõtmete
unikaalsust ja võimalikke duplikaate. Võrdlen ridade arvu ning
müügisummasid enne ja pärast tabelite ühendamist. Tuvastan ja
parandan probleemi põhjuse.

**Küsimus 4:** Kuidas leiaksid SQL-i abil UrbanStyle'i kliendid,
kelle kogukulutus ületab 500 eurot? Selgita WHERE ja HAVING erinevust.

**Oodatav vastus:** Kasutan GROUP BY abil klientide grupeerimist,
SUM-funktsiooni kogukulutuse arvutamiseks ja
`HAVING SUM(total_price) > 500` tingimust.
WHERE filtreerib üksikuid ridu enne grupeerimist, HAVING aga
grupeeritud tulemusi pärast agregatsiooni.

**Küsimus 5:** Kuidas käsitleksid Pythonis UrbanStyle'i
müügiandmete duplikaate ja puuduvaid väärtusi ning kontrolliksid
puhastamise tulemust?

**Oodatav vastus:** Tuvastan duplikaadid ja puuduvad väärtused
meetoditega `duplicated()` ja `isna()`. Eemaldan tegelikud
duplikaadid `drop_duplicates()` abil ning käsitlen puuduvaid
väärtusi vastavalt nende tähendusele, kasutades `fillna()` või
`dropna()`. Võrdlen ridade arvu, puuduvaid väärtusi ja
müügisummasid enne ning pärast puhastamist.

**Hindamise põhimõte:** Hinnatakse tehniliste teadmiste
praktilist rakendamist, lahenduste põhjendamist, vigade
tuvastamist ja tulemuste kontrollimist. Aktsepteeritakse
ka teisi korrektseid lahendusi.

## 4. Rohelised lipud (3 – tugev kandidaat)

### 1. Tehniline pädevus

Oskab kasutada SQL-i ja Pythonit ning põhjendada oma
tehnilisi valikuid.

Näiteks selgitab kandidaat, miks kasutab UrbanStyle'i
ostudeta klientide leidmiseks LEFT JOIN-i.

**Põhjendus:** näitab tehniliste teadmiste mõistmist ja
iseseisvat probleemilahendusoskust.

### 2. Andmekvaliteet

Kontrollib duplikaate, puuduvaid väärtusi ja tulemuste
õigsust, vältides ekslikke ärilisi järeldusi.

Näiteks tuvastab kandidaat UrbanStyle'i müügiandmetes
duplikaadid ja puuduvad väärtused ning kontrollib ridade
arvu ja müügisummasid enne ja pärast andmete puhastamist.

**Põhjendus:** aitab vältida ebausaldusväärseid
analüüsitulemusi ja ekslikke ärilisi otsuseid.

### 3. Koodi kvaliteet ja dokumentatsioon

Kirjutab loetavat koodi, koostab arusaadavaid README-faile
ja sisukaid commit-sõnumeid, võimaldades teistel tööd korrata.

Kood on loetav ja struktureeritud, README kirjeldab projekti
eesmärki, tööriistu, käivitamist ja tulemusi ning commit-sõnumid
kajastavad tehtud muudatusi.

**Põhjendus:** näitab dokumenteerimisoskust,
vastutustundlikkust ja valmisolekut meeskonnatööks.

## 5. Punased lipud (2 – hoiatusmärgid)

### 1. Lahenduse mittemõistmine

Ei oska enda esitatud koodi selgitada ega vigu
iseseisvalt tuvastada.

**Põhjendus:** töötav kood üksi ei tõenda lahenduse
mõistmist ega iseseisvat probleemilahendusoskust.

### 2. Kontrollimatud tulemused

Puudub dokumentatsioon või andmekvaliteedi kontroll,
mistõttu analüüsi usaldusväärsust ei saa hinnata.

**Põhjendus:** raskendab analüüsi usaldusväärsuse
hindamist ja töö kordamist.

## 6. Kandidaadi tehniline hindamistabel (Scorecard)

Tehniline intervjueerija täidab alloleva hindamistabeli
iga kandidaadi kohta. Maksimaalne punktisumma on 15 punkti.

| Hindamiskriteerium | 1 punkt (Nõrk) | 2 punkti (Rahuldav / Hea) | 3 punkti (Väga tugev) | Punktid |
|---|---|---|---|---|
| SQL | Ei mõista päringute loogikat. | Koostab lihtsamaid päringuid. | Kasutab JOIN-e ja agregaatfunktsioone, põhjendab valikuid. | \_\_\_ / 3 |
| Python ja andmekvaliteet | Ei oska andmevigu käsitleda. | Puhastab andmeid, kuid kontroll on puudulik. | Puhastab andmeid põhjendatult ja valideerib tulemusi. | \_\_\_ / 3 |
| Koodi kvaliteet | Kood on raskesti mõistetav. | Kood on arusaadav, kuid vajab täiendamist. | Kood on loetav, struktureeritud ja vajadusel kommenteeritud. | \_\_\_ / 3 |
| Git ja dokumentatsioon | Dokumentatsioon puudub. | README ja commit-sõnumid on osaliselt puudulikud. | Dokumentatsioon on selge ja töö korratav. | \_\_\_ / 3 |
| Power BI / Plotly | Ei oska visualiseeringuid tõlgendada. | Loob arusaadavaid visualiseeringuid. | Valib sobivad visualiseeringud ja seob tulemused äriotsustega. | \_\_\_ / 3 |
| **KOKKU** | | | Tehniline soovitus: ☐ Edasi ☐ Ei sobi | **\_\_\_ / 15** |

## 7. Kokkuvõte ja soovitus UrbanStyle'ile

Tehnilisel intervjuul tuleks hinnata lisaks töötavale
koodile kandidaadi mõtlemisprotsessi, tehniliste valikute
põhjendamist, andmekvaliteedi kontrollimist ja tulemuste
ärilist tähendust.

Soovitatav on kasutada UrbanStyle'i müügiandmetel
põhinevaid praktilisi SQL-i ja Pythoni ülesandeid ning
rakendada kõigi kandidaatide puhul samu hindamiskriteeriume.
Hinnata tuleb lahenduse loogikat, mitte üksnes koodi
kirjutamise kiirust.

## 8. AI kasutamine

Kasutasin ChatGPT abi hindamiskriteeriumide sõnastamisel,
roheliste ja punaste lippude, tehniliste intervjuuküsimuste,
oodatavate vastuste ning hindamistabeli koostamisel.

Kohandasin oma töö vastavalt DACA õppematerjalidele,
meeskonna valitud peatükkidele ja ühisele värbamisjuhendile.
