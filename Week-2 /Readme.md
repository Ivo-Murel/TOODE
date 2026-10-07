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
- Linnanimedel esines algselt 54 erinevat kirjapilti. Pärast väärtuste
  standardiseerimist `TRIM` ja `INITCAP` abil jäi alles 12 erinevat linnanime.

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

380 kliendikirjel puudub e-posti aadress. Puuduvat e-posti aadressi ei ole
võimalik olemasolevate andmete põhjal usaldusväärselt taastada ning see vajab
vajadusel täiendavat andmeallikat või kontrolli.
