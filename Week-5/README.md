# 5. nädal | UrbanStyle – Power BI visualiseerimine
## Meeskond TOODE 

[Grupitöö esitlus](https://docs.google.com/presentation/d/1bg1lFpKq04LwAn1vqwGZc_S45lVt2TCMeZ8oVTS-EaU/edit)

---

## 📊 Week 5 – Power BI visualiseerimine ja dashboard'ide koostamine

### 📌 Projekti ülevaade
Viiendal nädalal keskendusime SQL-iga analüüsitud andmete visuaalsele esitamisele Power BI Desktop keskkonnas. Koostasime interaktiivsed juhtimislauad (*dashboards*) UrbanStyle meeskonna erinevatele osapooltele (CEO, turundus, operatsioonid).

Töös kasutasime UrbanStyle brändivärve (peamine teal `#009B8D`), rakendasime tingimuslikku vormindamist (*conditional formatting*) ning järgisime *Data-ink ratio* põhimõtteid.

---

## 👥 Meeskond TOODE ja tööjaotus

| Liige | Roll | Valdkond | Töövahendid |
| :--- | :--- | :--- | :--- |
| **Ivo** | Roll A – CEO Dashboard | Kõrgtaseme KPI-d, müügitulu ja kasvu trendid | Power BI, SQL, PostgreSQL |
| **Kertu** | Roll B – Marketing Dashboard | Turunduskanalid, kliendihange ja AOV / Kohort | Power BI, SQL, PostgreSQL |
| **Helen** | Roll C – Operations Dashboard | Müügikohad, laoseisud ja kategooriad | Power BI, SQL, PostgreSQL |

---

## 📑 Meeskonnaliikmete analüüsid ja tulemused

### 1. Ivo – Roll A: CEO Dashboard (Kõrgtaseme müügitrendid)

* **Domeen ja eesmärk:**  
  Analüüsida ettevõtte käekäiku kõrgtasemel, et juhtkond näeks ühe pilguga, kas UrbanStyle kasvab või kahaneb.

* **Peamised leiud ja järeldused:**  
  * **Müügi kukkumine:** 2024. aasta oli parim müügiaasta (1,47M €), kuid 2025. aastal langes käive 200k € peale (märts-november müüki ei toimunud). 2026. aastal oli käive vaid ~4000 € (-99,7% vs 2024). Ettevõtte tegevus on sisuliselt seiskunud.
  * **Soovitus juhtkonnale:** Planeerida turunduskampaaniad ja tegevuse taaskäivitamine teadaolevatele kõrghooaja perioodidele (Q2 ja Q4).

---

### 2. Kertu – Roll B: Marketing Dashboard (Turundus ja kliendihange)

* **Domeen ja eesmärk:**  
  Hinnata turunduskanalite efektiivsust, klientide hoidmist ja keskmise ostukorvi (AOV) ning kohordi tihedust.

* **Peamised leiud ja järeldused:**  
  * **Liigne fookus uutel klientidel:** Strateegia on suunatud uute klientide püüdmisele, kuid kliendipidavus (*retention*) on madal.
  * **Madal korduvostude määr:** Enamik täppe asub diagrammi allosas (madal AOV ja madal kohorditihedus).
  * **Väga väärtuslik segment seostamata:** Kõrgeima kohorditiheduse (0,8–1,1) ja ostukorviga (270–320 €) segment pole otse turunduskanalitega seotud.
  * **Soovitus juhtkonnale:** Ehitada üles püsiklientide lojaalsusprogramm ja suunata turundus korduvostude stimuleerimisele.

---

### 3. Helen – Roll C: Operations Dashboard (Müügikohad ja laoseisud)

* **Domeen ja eesmärk:**  
  Analüüsida müügitulu paiknemist müügikohtade lõikes ning laovarude jaotust tootekategooriate ja asukohtade kaupa.

* **Peamised leiud ja järeldused:**  
  * **Tallinna domineerimine ja andmeauk:** Tuvastatud asukohtadest tegi Tallinn suurima käibe (1,09M €), kuid ligi 1,01M € väärtuses müükidel puudub asukoht (`NULL`).
  * **Laovarude jaotus:** Kogu laoseis on 376 785 ühikut. Suurim varu on kesklaos (162k tk) ning toodetest meeste riietel (101k tk).
  * **Soovitus juhtkonnale:** Kohustada müügisüsteemis asukoha salvestamist, et kaotada 1M€ andmeauk, ning võrrelda laoseise tegeliku müügikiirusega.

---

## 💡 Meeskonna ühised kokkuvõtlikud soovitused

* **Andmekvaliteet korda:** Täiendada andmebaasi reegleid, et tehingutelt ei puuduks `store_location` ning korrastada `inventory` tabeli negatiivsed jäägid.
* **Kliendi hoidmine (*Retention*):** Suunata fookus uute klientide ostmiselt olemasolevate VIP-klientide (ostud > 5000 €) hoidmisele ja korduvostudele.
* **Varude juhtimine:** Optimeerida meeste riiete ja jalanõude laovarusid vastavalt piirkondlikule nõudlusele.
