--siia lisada mida igaüks tegi ja viimane kustutab ära mittevajalikud lõigud

Oma koodid kopeerime siia, kõik 3 inimest, igaüks oma lõik. 
3 peamist asja, järeldused/soovitused Toomasele. 

Soovitus toomasele, punkt 3 LK 14

NB! VAADAKE ÜLE SEE MINU SUURIMA ÜLLATUSE LÕIK SIIN MÕNED READ ALLPOOL, MINUL ÜLLATUSI EI OLNUD, SAMUTI ON VAJA KA INFOT NENDE 5116 DUPLIKAADI KOHTA, ET MIS NEED SIIS ON, KAS SEE OLI E-POE MÜÜK? 
--------------------------------------
Meie grupitöö esitlus - https://docs.google.com/document/d/1-67q0odWr2Sl6yUHkp7SpQoLdLggkgR70ejm7MTvFKc/edit?pli=1&tab=t.0

Selle nädala küsimus: Mitu duplikaati on UrbanStyle'i müügiandmetes tegelikult ja mida need numbrid meile räägivad? Kokku on 5116 duplikaati.
Suurim üllatus - suurt üllatust ei olnud, pigem on segadus.  

Ivo Murel
Analüüsisin Products tabelit
Kokku on tabelis 5 erinevat tootekategooriat, mis sisaldavad 362 erinevat toodet. 
Kategooriad jagunevad järgmiselt: 
■	jalanõud (73 rida/72 toodet), 
■	laste riided (70rida), 
■	aksessuaarid(67 rida), 
■	naisteriided (70 rida)
■	meesteriided(82rida), 
Kõige kallim toode on sporditossud 434,08€ ning kõige odavam toode on village kangasvöö, mis maksab 13,53€. 
Seejuures 18 tootel on öko-sertifikaadi väärtus on NULL, põhjus vajaks täpsustamist.  

5 koodi mida kasutasin
--	Loe tooted kategooriati kokku:
SELECT category, COUNT(*) AS toodete_arv
FROM products
GROUP BY category
ORDER BY toodete_arv DESC;

--	Leia keskmised hinnad kategooriati
SELECT category,
       COUNT(*) AS toodete_arv,
       MIN(retail_price) AS min_hind,
       MAX(retail_price) AS max_hind
FROM products
GROUP BY category
ORDER BY max_hind DESC;


SELECT category, COUNT(*) AS toodete_arv
FROM products
GROUP BY category
ORDER BY toodete_arv DESC;

--	Kombineeri tingimused: Leia tooted, mille hind on üle 50 EUR konkreetses kategoorias:
SELECT * FROM products
WHERE retail_price > 50 AND category = 'jalanõusid'
ORDER BY retail_price DESC;

--Mis kategooria all on kõige rohkem raha kinni
SELECT category, SUM(cost_price) AS kokku_omahind 
FROM products 
GROUP BY category 
ORDER BY kokku_omahind DESC;

## Helen – müügiandmed

Uurisin sales tabelit.

### 3 peamist leidu
- sales tabelis on kokku 15 234 müügirida.
- Kõige suurem müügisumma on 2170,40 € ja kõige väiksem -1405,32 €.
- 1487 müügireal puudub kliendi ID (customer_id).

### Soovitus Toomasele
Müügiandmete kvaliteedi parandamiseks soovitan esmalt analüüsida negatiivsete tehingute tekkepõhjuseid ning selgitada, kas need kajastavad tagastusi, paranduskandeid või andmekvaliteedi probleeme. Lisaks tuleks uurida 1487 müügirida, millel puudub customer_id, sest puuduv kliendiinfo võib piirata kliendikäitumise ja müügitulemuste edasist analüüsi.

### SQL päringud:
```sql

-- PÄRING 1/5: Mitu müügirida on sales tabelis kokku?
SELECT COUNT(*) AS ridade_arv FROM sales;
-- TULEMUS: sales tabelis on kokku 15 234 müügirida.


-- PÄRING 2/5: Näitab sales tabeli esimest 10 rida ja kõiki veerge.
SELECT * FROM sales LIMIT 10;
-- TULEMUS: Kuvati 10 esimest müügirida koos sales tabeli veergude ja andmetega.


-- PÄRING 3/5: Näitab 15 viimast Tallinna kaupluse müüki.
SELECT * FROM sales WHERE store_location = 'Tallinn' ORDER BY sale_date DESC LIMIT 15;
-- TULEMUS: Kuvati 15 viimast Tallinna kaupluse müüki; tulemuste seas esines ka puuduva customer_id-ga müük.


-- PÄRING 4/5: Näitab 10 kõige suurema müügisummaga tehingut.
SELECT * FROM sales ORDER BY total_price DESC LIMIT 10;
-- TULEMUS: Suurim müügisumma on 2170,40 € ja see esineb tulemuses kahel real.

-- PÄRING 4.1/5: 10 väikseimat tehingut 
SELECT * FROM sales ORDER BY total_price ASC LIMIT 10;
-- TULEMUS: Kõik 10 väikseimat tehingut on negatiivse müügisummaga. Kõige väiksem müügisumma on -1405,32 €; nullsummaga tehinguid nende 10 seas ei ole.


-- PÄRING 5/5:Mitu rida esineb, kus kliendi info on puudu?
SELECT COUNT(*) - COUNT(customer_id) AS puuduv_klient FROM sales;
-- TULEMUS: 1487 müügireal puudub kliendi ID (customer_id).


-- KOKKUVÕTE:
-- sales tabelis on kokku 15 234 müügirida ning tabel sisaldab infot müügitehingute, klientide, toodete, hindade, müügikanalite ja kaupluste kohta.
-- Tallinna müüke vaadates oli näha ka tehing, millel puudus customer_id.
-- Kõige suurem müügisumma oli 2170,40 €, samas kui kõige väiksem oli -1405,32 € ning kõik 10 väikseimat tehingut olid negatiivse summaga.
-- Kokku puudus customer_id 1487 müügireal.
-- Negatiivsed müügisummad ja puuduv kliendiinfo vajavad edasist kontrollimist.

```

Kertu
