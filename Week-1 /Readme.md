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

Helen


Kertu
