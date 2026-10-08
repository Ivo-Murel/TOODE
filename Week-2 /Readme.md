Meie ühine esitlus:

https://docs.google.com/presentation/d/17zH0yna0C4xXgK4qMWkMrlxvIhGTtx_2h1xMmsGTgLI/edit?slide=id.h6aed5a0e66413314_0_0#slide=id.h6aed5a0e66413314_0_0

# Week 2 – SQL andmete puhastamine

## Andmekvaliteedi koondraport

### Helen – Customers

**Domeen:** kliendiandmed (`customers`)

### Peamised leiud

- `customers` tabelis on kokku 3150 kliendikirjet.
- 380 kliendikirjel puudub e-posti aadress.
- 128 erinevat mitte-NULL e-posti aadressi esineb rohkem kui ühe korra.
- Linnanimedel esines algselt 54 erinevat kirjapilti. Pärast standardiseerimist `TRIM` ja `INITCAP` abil jäi alles 12 erinevat linnanime.
- Korduvate e-posti aadressidega on seotud 258 kliendikirjet. Kokku tuvastati 130 lisakirjet. Neid ei saa ilma täiendava kontrollita käsitleda kinnitatud kliendiduplikaatidena.
- Algses `customers` tabelis vajas linnanime kirjapildi standardiseerimist 252 kliendikirjet.
- Puuduvate andmete kontrollis ei tuvastatud puuduvaid eesnimesid, perenimesid ega telefoninumbreid (kõigis 0 kirjet).

### Puhastamine ja valideerimine

Andmete turvaliseks puhastamiseks loodi `customers` tabelist testkoopia
`customers_test`. Muudatused tehti testtabelis, et vältida originaalandmete
tahtmatut muutmist.

Linnanimed standardiseeriti kujule `INITCAP(TRIM(city))`. Pärast puhastamist
tehtud järelkontroll ei tuvastanud enam standardiseerimata linnaväärtusi.

Lisaks kontrolliti puuduvate väärtuste, korduvate e-posti aadresside ning
e-posti aadresside ja telefoninumbrite vormingut.

### Suurim üllatus

Kõige suurem ebajärjekindlus ilmnes linnanimedes: 54 erinevat kirjapilti
koondusid pärast standardiseerimist 12 linnanimeks.

### Soovitus Toomasele

Kliendiandmete kvaliteedi parandamisel tuleks esmajärjekorras kontrollida
puuduvaid ja korduvaid e-posti aadresse, kuna need võivad mõjutada klientide
korrektset tuvastamist ja kliendipõhist analüüsi.

Linnanimede sisestamisel on soovitatav rakendada ühtne standardiseerimisreegel,
et vältida sama asukoha salvestamist erinevate kirjapiltidega.

### Puuduvad andmed


380 kliendikirjel puudub e-posti aadress. Puuduvat e-posti aadressi ei ole võimalik olemasolevate andmete põhjal usaldusväärselt taastada ning see vajab vajadusel täiendavat andmeallikat või kontrolli.

Eesnimede, perenimede ja telefoninumbrite kontrollimisel puuduvaid väärtusi ei tuvastatud (kõigis 0 kirjet). Kontroll hõlmas nii NULL-väärtusi kui ka tühje tekstivälju.

### Puhastamisraport

| Kontrollitud probleem | Tulemus | Selgitus |
|---|---:|---|
| Korduvad e-posti aadressid | 128 | 258 seotud kliendikirjet, neist 130 lisakirjet. |
| Puuduv eesnimi | 0 | Puuduvaid väärtusi ei tuvastatud. |
| Puuduv perenimi | 0 | Puuduvaid väärtusi ei tuvastatud. |
| Ebajärjekindlad linnanimed | 252 | Nii mitmel kirjel vajas linnanimi standardiseerimist. |
| Puuduv telefon | 0 | Puuduvaid väärtusi ei tuvastatud. |
| Puuduv e-post | 380 | E-posti aadress puudub. |


### Kokkuvõte ja soovitus

Peamised probleemid on puuduvad e-posti aadressid, korduvate e-posti aadressidega kliendikirjed ja linnanimede ebajärjekindel kirjapilt.

Kõige olulisem on kontrollida puuduvaid e-posti aadresse, sest need võivad takistada klientidega suhtlemist ja kliendipõhist analüüsi.

Korduvate e-posti aadressidega kirjeid ei tohi automaatselt kustutada, sest sama e-posti aadress võib olla seotud erinevate inimestega. Enne muudatuste tegemist tuleb kirjeid täiendavalt kontrollida.

Linnanimed standardiseeriti testtabelis customers_test, originaaltabelit ei muudetud.
