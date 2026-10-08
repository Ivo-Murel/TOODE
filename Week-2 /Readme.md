

- [Vaata meie ühist esitlust siit:](https://docs.google.com/presentation/d/17zH0yna0C4xXgK4qMWkMrlxvIhGTtx_2h1xMmsGTgLI/edit?slide=id.h5149412c77256a12_1_46#slide=id.h5149412c77256a12_1_46)

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

------------------------------------------------------------------------------------------------------------------------------------

# 2. Nädala müügiandmete puhastamise raport

### Ivo - Sales

## KOKKUVÕTE
Käesolev raport annab ülevaate `sales` tabeli andmekvaliteedi auditist ja läbi viidud puhastustoimingutest. Andmete analüüsil ilmnes mitmeid vigu, mis moonutaksid ettevõtte müügiaruandeid. Kokku tuvastati süsteemist **6 908 probleemi** (kaasa arvatud tuhanded korduvad duplikaatridad ja loogikavead).

## Andmekvaliteedi probleemide ülevaade
1. **Duplikaadid:** Leiti 5 116 liigset rida, mis on seotud 4013 unikaalse arvenumbriga (`invoice_id`). Need paisutavad kunstlikult müügimahte.
2. **Puuduvad kliendid:** 1 487 real puudub `customer_id`, mis takistab kliendipõhiseid analüüse, kuigi kuupäevad ja summad on olemas.
3. **Loogikavead:** 305 tehingul on kogus ja ühiku hind positiivsed, kuid kogusumma on negatiivne.

---

## Enne / Pärast Andmete Puhastamise Tabel

| Andmekvaliteedi näitaja | Enne puhastamist | Pärast puhastamist | Muudatus / Selgitus |
| :--- | :---: | :---: | :--- |
| **Ridade koguarv** | 15 234 | 10 118 | Eemaldatud 5 116 duplikaatset rida |
| **Duplikaatsed arved** | 4 013 (5 116 rida) | 0 | Kõik korduvad read eemaldatud, säilitatud `MIN(id)` |
| **Puuduvad kliendid (`NULL customer_id`)** | 1 487 | 1 487 | Jäetud alles, vajab logidest tagaselja taastamist |
| **Negatiivse kogusummaga tehingud** | 305 | 305 | Tuvastatud loogikaviga, vajab täpsustust |

---

## Soovitused juhtkonnale
1. Duplikaadid: Paisutavad kunstlikult müügimahte ja summasid, need on vaja enne analüüsi ja raporti genereerimist eemaldada.
2. Negatiivsed kogusummad - tõenäoliselt süsteemi viga ja on vaja aru saada, millest need tekivad? 
3. Puuduvad customer_id (e-poe müük): Müükide kuupäevad ja summad on küll olemas, kuid tühjad väljad takistavad kliendipõhiseid analüüse (näiteks KES on parimad kliendid või kui palju klient on kokku ostnud). Toomas peaks uurima, kas neid andmeid on võimalik tagantjärele logidest või teistest tabelitest taastada.
4. E-poe store location on NULL, selguse ja arusaaavuse mõttes võiks “location” tähis samuti olla ONLINE, sarnaselt nagu see on “channel-il”.  

### Kertu – Products

**Domeen:** Tooteandmed (`products`)

### Peamised leiud

- `Products` tabelis on 362 tootekirjet.
- Tootetabelis on 12 rida duplikaate, mis on leitud veeru product_name kaudu.
- Kriitilistes väljades NULL- väärtused puuduvad.
- Loogilised vead (ebareaalsed hinnad) puuduvad.
- 0 erinevat kategooria väärtust.

### Puhastamine ja valideerimine

Andmete puhastamiseks loodi `products` tabelist testkoopia `products_test`. 
Muudatused tehti testtabelis vältimaks originaalandmete muutmist.

### Suurim üllatus

Duplikaatread olid igaüks eraldi product_idga aga product_name ja product_price/retail_price olid samad. 

### Soovitus Toomasele

Paremaks tooteanalüüsiks on tarvilik andmed puhastada ja standardiseerida. 

### Puuduvad andmed

Kontroll hõlmas nii NULL-väärtusi kui ka tühje tekstivälju.  
Tootetabelis oli NULL väärtusi eco_certified veerus 18 real.
Kriitilise tähtsusega ridadel oli 0 puuduvat väärtust.

### Puhastamisraport

| Kontrollitud probleem | Tulemus | Selgitus |
|---|---:|---|
| Duplikaadid | 12 | product_name väärtuse järgi leides |
| NULL väärtus | 18 | Puudusid väärtused eco_certificated veerus 18 kirjel |
| Null väärtused kriitilistes andmetes | 0 | Puuduvaid väärtusi ei tuvastatud. |
| Loogilised vead hindades | 0 | Puuduvaid väärtusi ei tuvastatud. |
| Erinevused kategooriate nimetuses | 0 | Puuduvaid väärtusi ei tuvastatud. |

### Kokkuvõte ja soovitus
Toodete tabeli korrastamiseks on tarvis uurida kas ja kui suurt mõju avaldavad 12 leitud duplikaati toodete tabeli analüüsi. 
Puuduvad andmeväärtused veerus eco_certificated tuleb korrastada. 
