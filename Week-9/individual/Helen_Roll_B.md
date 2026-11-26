# Roll B – Tehnilise intervjueerija vaade

**Meeskond:** TOODE  
**Ettevõte:** UrbanStyle  
**Roll:** B – Technical Interviewer  
**Peatükid:** 5 – DA tööpakkumise kirjutamine ja 6 – DA intervjuu stsenaarium

## 1. Eesmärk

Hinnata nooremandmeanalüütiku tehnilisi teadmisi, koodi kvaliteeti,
probleemilahendusoskust, dokumentatsiooni ja analüüsitulemuste
usaldusväärsust.

Tegemist on üldise värbamisjuhendiga, mitte konkreetse kandidaadi hindamisega.

## 2. Peatükk 5 – DA tööpakkumise kirjutamine

Tehnilise intervjueerija vaatenurgast peaks tööpakkumine sisaldama
järgmisi oskuspõhiseid nõudeid:

- **SQL:** andmete filtreerimine, ühendamine ja agregeerimine.
- **Python ja Pandas:** andmete puhastamine, töötlemine ja analüüsimine.
- **Power BI või Plotly:** visualiseerimine ja tulemuste tõlgendamine.
- **Git ja dokumentatsioon:** versioonihalduse kasutamine, loetava
  koodi kirjutamine ning analüüside dokumenteerimine.

Oluline on oskus teadmisi praktiliselt rakendada ja oma lahendusi
põhjendada. Oskuste tõendamiseks sobivad ka õppeprojektid.

## 3. Peatükk 6 – DA intervjuu stsenaarium

### Tehniline pädevus ja vigade otsimine (15 min)

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
HAVING SUM(total_price) > 500 tingimust. WHERE filtreerib
üksikuid ridu enne grupeerimist, HAVING aga grupeeritud
tulemusi pärast agregatsiooni.

**Küsimus 5:** Kuidas käsitleksid Pythonis UrbanStyle'i müügiandmete
duplikaate ja puuduvaid väärtusi ning kontrolliksid puhastamise tulemust?

**Oodatav vastus:** Tuvastan duplikaadid ja puuduvad väärtused
meetoditega duplicated() ja isna(). Eemaldan tegelikud duplikaadid
drop_duplicates() abil ning käsitlen puuduvaid väärtusi vastavalt
nende tähendusele, kasutades fillna() või dropna().
Võrdlen ridade arvu, puuduvaid väärtusi ja müügisummasid
enne ning pärast puhastamist.

**Hindamise põhimõte:** Hinnatakse tehniliste teadmiste praktilist
rakendamist, lahenduste põhjendamist, vigade tuvastamist ja
tulemuste kontrollimist. Aktsepteeritakse ka teisi korrektseid lahendusi.

## 4. Rohelised lipud – tugeva kandidaadi tunnused

1. **Tehniline pädevus:** oskab kasutada SQL-i ja Pythonit ning
   põhjendada oma tehnilisi valikuid.

2. **Andmekvaliteet:** kontrollib duplikaate, puuduvaid väärtusi
   ja tulemuste õigsust, vältides ekslikke ärilisi järeldusi.

3. **Koodi kvaliteet ja dokumentatsioon:** kirjutab loetavat koodi,
   koostab arusaadavaid README-faile ja sisukaid commit-sõnumeid,
   võimaldades teistel tööd korrata.

## 5. Punased lipud – hoiatusmärgid

1. **Lahenduse mittemõistmine:** ei oska enda esitatud koodi
   selgitada ega vigu iseseisvalt tuvastada.

2. **Kontrollimatud tulemused:** puudub dokumentatsioon või
   andmekvaliteedi kontroll, mistõttu analüüsi usaldusväärsust
   ei saa hinnata.

## 6. Kandidaadi tehniline hindamistabel (Scorecard)

Tehniline intervjueerija täidab hindamistabeli iga kandidaadi kohta.
Maksimaalne punktisumma on 15 punkti.

| Hindamiskriteerium | 1 punkt (Nõrk) | 2 punkti (Rahuldav / Hea) | 3 punkti (Väga tugev) | Punktid |
|---|---|---|---|---|
| SQL | Ei mõista päringute loogikat. | Koostab lihtsamaid päringuid. | Kasutab JOIN-e ja agregaatfunktsioone, põhjendab valikuid. | ___ / 3 |
| Python ja andmekvaliteet | Ei oska andmevigu käsitleda. | Puhastab andmeid, kuid kontroll on puudulik. | Puhastab andmeid põhjendatult ja valideerib tulemusi. | ___ / 3 |
| Koodi kvaliteet | Kood on raskesti mõistetav. | Kood on arusaadav, kuid vajab täiendamist. | Kood on loetav, struktureeritud ja vajadusel kommenteeritud. | ___ / 3 |
| Git ja dokumentatsioon | Dokumentatsioon puudub. | README ja commit-sõnumid on osaliselt puudulikud. | Dokumentatsioon on selge ja töö korratav. | ___ / 3 |
| Power BI / Plotly | Ei oska visualiseeringuid tõlgendada. | Loob arusaadavaid visualiseeringuid. | Valib sobivad visualiseeringud ja seob tulemused äriotsustega. | ___ / 3 |
| **KOKKU** | | | Tehniline soovitus: ☐ Edasi ☐ Ei sobi | **___ / 15** |

## 7. Kokkuvõte ja soovitus UrbanStyle'ile

Kandidaadi hindamisel tuleks lisaks tehnilistele teadmistele
kontrollida tema oskust oma lahendusi põhjendada, tulemusi
valideerida ja ärilist väärtust selgitada.

Soovitan kasutada UrbanStyle'i müügiandmetel põhinevaid
praktilisi intervjuuküsimusi ning rakendada kõigi kandidaatide
puhul ühesuguseid hindamiskriteeriume.

## 8. AI kasutamine

Kasutasin ChatGPT abi hindamiskriteeriumide, roheliste ja punaste
lippude, intervjuuküsimuste, oodatavate vastuste ning hindamistabeli
koostamisel. Kohandasin oma töö vastavalt meeskonna valitud
peatükkidele ja ühisele värbamisjuhendile.
