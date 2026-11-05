# Nädal 6 – Helen: Tartu kaupluse analüüs

## Eesmärk

Analüüsida UrbanStyle'i Tartu kaupluse müügitulemusi Power BI-s ning koostada interaktiivne dashboard koos äriliste järelduste ja soovitustega juhtkonnale.

## Mida tegin

- Koostasin Tartu kaupluse müügianalüüsi Power BI-s.
- Lisasin müügitulu, tellimuste arvu ja keskmise ostusumma KPI-kaardid.
- Visualiseerisin kuupõhise müügitulu muutuse.
- Koostasin TOP 5 toodete tulpdiagrammi.
- Koostasin klientide lojaalsustasemete jaotuse diagrammi.
- Lisasin aasta ja tootekategooria filtrid.
- Lisasin müügigraafikule keskmise viitejoone ja selgitavad märkused.
- Lisasin dashboard'i kuvatõmmise meeskonna Google Slidesi esitlusse.

## Kuidas tegin

1. Kasutasin Power BI-s UrbanStyle'i müügiandmeid.
2. Filtreerisin andmed Tartu kaupluse järgi (`store_location = Tartu`).
3. Arvutasin müügitulu, tellimuste arvu ja keskmise ostusumma.
4. Koostasin diagrammid müügitrendi, toodete ja kliendisegmentide analüüsimiseks.
5. Kontrollisin aastapõhiseid müügitulemusi Supabase'is SQL-päringuga.
6. Võrdlesin 2023. ja 2024. aasta tulemusi ning kontrollisin hilisemate aastate andmete täielikkust.
7. Sõnastasin analüüsi põhjal järeldused ja soovitused juhtkonnale.

## Tulemused

| Näitaja | Tulemus |
|---|---:|
| Kogu müügitulu | 521 603,11 € |
| Tellimuste arv | 1 797 |
| Keskmine ostusumma | 290,26 € |
| Unikaalsed ostjad | 1 119 |
| 2024. aasta müügitulu kasv | 13,4% |
| Suurim kuukäive | 33 046,60 € (detsember 2024) |

## Peamised järeldused

- **Müügitulu kasvas:** 2024. aastal oli müügitulu 13,4% suurem kui 2023. aastal.
- **Parim müügikuu:** 2024. aasta detsember, müügitulu 33 046,60 €.
- **TOP 5 toodete liider:** klassikaline seemisnahkne jooksutoss, müügitulu ligikaudu 6 400 €.
- **Puudulikud kliendiandmed:** 39,86% Tartu ostjatest puudub lojaalsustaseme märge.
- **Puudulikud müügiandmed:** 2025. aastal on müügiandmeid 3 kuu ja 2026. aastal 1 kuu kohta. Seetõttu ei saa hilisemate aastate näilist langust pidada tõendatud müügilanguseks.

## Är iline järeldus ja soovitus

Tartu kaupluse 2024. aasta müügitulemused paranesid võrreldes 2023. aastaga. Kõige suurem kuukäive saavutati detsembris ning TOP 5 toodete seas oli edukaim klassikaline seemisnahkne jooksutoss. Analüüsi piiravad 2025–2026 puudulikud müügiandmed ja paljude klientide puuduvad lojaalsustasemed. Juhtkonnal soovitan parandada andmete kvaliteeti ning uurida detsembrikuu tugeva müügitulemuse põhjuseid.

## Dashboard ja esitlus

- **Power BI fail:** `UrbanStyle_Week6_Tartu.pbix`
- **Dashboard'i leht:** `Tartu`
- **Meeskond:** Toode
- **Esitlus:** ühine Google Slidesi esitlus, kuhu lisasin Tartu dashboard'i kuvatõmmise ja järeldused.

