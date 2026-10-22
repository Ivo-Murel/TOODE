--Keskmise tellimuse suurus 
SELECT 
    COUNT(sale_id) AS tellimuste_arv,
    ROUND(SUM(total_price), 2) AS kogukäive,
    ROUND(AVG(total_price), 0) AS keskmine_tellimus
FROM sales;
--Tellimuste arv 10118, kogukäive 2,9 miljonit keskmine ostukorv 288€

--Tootekategooriate koondandmed. Koosta ülevaade kategooriate kaupa:
SELECT
  p.category,
  COUNT(DISTINCT p.product_id) AS tooteid,
  ROUND(AVG(p.retail_price), 2) AS keskmine_hind,
  MIN(p.retail_price) AS min_hind,
  MAX(p.retail_price) AS max_hind
FROM products p
GROUP BY p.category
ORDER BY tooteid DESC;

--Tootekategooriate koondandmed. Koosta ülevaade kategooriate kaupa:, sama asi mis eelmine aga sorteeritud kõige kallima ühikuhinna alusel
SELECT
  p.category,
  COUNT(DISTINCT p.product_id) AS tooteid,
  ROUND(AVG(p.retail_price), 2) AS keskmine_hind,
  MIN(p.retail_price) AS min_hind,
  MAX(p.retail_price) AS max_hind
FROM products p
GROUP BY p.category 
ORDER BY max_hind DESC;
--Tulemus 5 kategooriat - kõige odavamad tooted on aksesuuaarides 13,53€ ja kõige kallimad on jalanõud 434,08€. 

select * from products limit 1

--Kuidas jagunevad ÖKO tooted kategooriate lõikes. 
SELECT
  p.category, p.eco_certified,
  COUNT(DISTINCT p.product_id) AS tooteid,
  ROUND(AVG(p.retail_price), 2) AS keskmine_hind,
  MIN(p.retail_price) AS min_hind,
  MAX(p.retail_price) AS max_hind
FROM products p
GROUP BY p.category, p.eco_certified
ORDER BY max_hind DESC;
--Tulemus 15 rida, kokku on 5 kategooriat kuna öko kategoorial on kolm väärtust, true, false ja null, siis iga kategooria kohta annab ühe rea, seega 5x3=15 rida.
-- Ökotooteid on vähemus (umbes 25–30% valikust): Ilma sertifikaadita on igas kategoorias märgatavalt rohkem kui ökosertifikaadiga tooteid.

--Mis kategooria on kõige kõrgema hinnaga
SELECT 
    p.eco_certified,
    COUNT(DISTINCT p.product_id) AS tooteid,
    ROUND(AVG(p.retail_price), 2) AS keskmine_hind,
    MIN(p.retail_price) AS min_hind,
    MAX(p.retail_price) AS max_hind
FROM products p
GROUP BY p.eco_certified
ORDER BY max_hind DESC;
--Tulemus kõige kõrgema keskmise hinnaga on NULL väärtusega tooted 204,95€ - vaja täpsustada mis need on, öko tooted on kõige madalama keskmise hinnaga selle raporti alusel

--Müüdud vs laos — ühendades products + sales + inventory
WITH müügid AS (
    SELECT product_id, SUM(quantity) AS müüdud
    FROM sales
    GROUP BY product_id
),
laod AS (
    SELECT product_id, SUM(quantity_available) AS laoseis
    FROM inventory
    GROUP BY product_id
)
SELECT 
    p.category AS kategooria,
    SUM(m.müüdud) AS müüdud_kokku,
    SUM(l.laoseis) AS laos_kokku,
    COUNT(DISTINCT p.product_id) AS erinevaid_tooteid,
    ROUND(SUM(m.müüdud)::numeric / NULLIF(COUNT(DISTINCT p.product_id), 0), 2) AS keskmine_müük_toote_kohta,
    ROUND(SUM(l.laoseis)::numeric / NULLIF(COUNT(DISTINCT p.product_id), 0), 2) AS keskmine_laoseis_toote_kohta
FROM products p
LEFT JOIN müügid m ON p.product_id = m.product_id
LEFT JOIN laod l ON p.product_id = l.product_id
GROUP BY p.category
HAVING SUM(m.müüdud) > 2000
ORDER BY müüdud_kokku DESC;

--Palju üldse tooteid on laos
SELECT 
    COUNT(DISTINCT product_id) AS erinevaid_tooteid_kokku,
    SUM(quantity_available) AS ühikuid_kokku
FROM inventory;
-Tulemus 350 toodet

--Kuidas leida tooted, mida on vaja kohe juurde tellida?
--Kui laoseis (quantity_available) on väiksem või võrdne kriitilise piiriga (reorder_point), tuleb toodet juurde tellida.
SELECT 
    p.product_id,
    p.product_name AS toote_nimi,
    p.category AS kategooria,
    i.location AS asukoht,
    i.quantity_available AS laoseis,
    i.reorder_point AS miinimumtase,
    (i.reorder_point - i.quantity_available) AS puudujääk
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.quantity_available <= i.reorder_point
ORDER BY puudujääk DESC;
--Tulemus näitab, et 231 toodet (350st) oleks vaja juurde tellida, samas on osad tooted miinuses ja seega numbrid ei tundu realistlikud

-- Toodete järjestus kategooria sees — kasuta window function'i:
--Aknafunktsioon (window function) on SQL-is arvutus, mis teostab tehteid mingi rea suhtes määratud seotud ridade rühma (ehk "akna") põhjal, säilitades samal ajal iga üksiku rea eraldiseisvana. Aknafunktsioon kasutab alati OVER() klauslit, mis määratleb, kuidas read on rühmitatud ja järjestatud: Levinumad näited aknafunktsioonidest on ROW_NUMBER(), RANK(), SUM() OVER (...) (jooksev summa) ja AVG() OVER (...).
SELECT
  p.product_name,
  p.category,
  p.retail_price,
  ROW_NUMBER() OVER (
    PARTITION BY p.category
    ORDER BY p.retail_price DESC
  ) AS koht_kategoorias
FROM products p;
--Tulemus 362 rida

-- top3 kõige kasumlikumat toodet kategooriate lõikes
SELECT * FROM (
    SELECT 
        p.category,
        p.product_id,
        p.product_name,
        ROUND(SUM(s.quantity * (s.unit_price - p.cost_price))::numeric, 2) AS kasum,
        ROW_NUMBER() OVER (
            PARTITION BY p.category 
            ORDER BY SUM(s.quantity * (s.unit_price - p.cost_price)) DESC
        ) AS koht
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.category, p.product_id, p.product_name
) sub
WHERE koht <= 1
ORDER BY category, koht;

-- top1 kõige kasumlikumat toodet kategooriate lõikes
SELECT * FROM (
    SELECT 
        p.category,
        p.product_id,
        p.product_name,
        ROUND(SUM(s.quantity * (s.unit_price - p.cost_price))::numeric, 0) AS kasum,
        ROW_NUMBER() OVER (
            PARTITION BY p.category 
            ORDER BY SUM(s.quantity * (s.unit_price - p.cost_price)) DESC
        ) AS koht
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.category, p.product_id, p.product_name
) sub
WHERE koht <= 1
ORDER BY kasum desc;
-- tossud, pullover, tweed kampsun, puust müts, chino püksid

--Kategooriate kasumlikkus, laojääk. 
WITH lao_summad AS (
    SELECT 
        product_id, 
        SUM(quantity_available) AS kokku_laos
    FROM inventory
    GROUP BY product_id
)
SELECT 
    p.category AS kategooria,
    SUM(s.quantity) AS müüdud_kokku,
    SUM(ls.kokku_laos) AS laos_kokku,
    COUNT(DISTINCT p.product_id) AS erinevaid_tooteid,
    ROUND(SUM(s.total_price)::numeric, 2) AS käive,
    ROUND(SUM(s.quantity * (s.unit_price - p.cost_price))::numeric, 2) AS kasum
FROM products p
JOIN sales s ON p.product_id = s.product_id
LEFT JOIN lao_summad ls ON p.product_id = ls.product_id
GROUP BY p.category
ORDER BY käive DESC;

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
-- SEE ON HEA KOKKUVÕTLIK TABEL
--Top 10 kõige kasumlikumat toodet, mis on nende laojääk, müük.
--kasum/käive ühe müüdud tüki kohta
WITH lao_andmed AS (
    SELECT 
        product_id,
        SUM(quantity_available) AS laoseis_kokku
    FROM inventory
    GROUP BY product_id
)
SELECT 
    p.product_id,
    p.product_name AS toote_nimi,
    p.category AS kategooria,
    COALESCE(l.laoseis_kokku, 0) AS laoseis,
    SUM(s.quantity) AS müüdud_kogus,
    ROUND(SUM(s.total_price)::numeric, 0) AS käive,
    ROUND(AVG(s.unit_price)::numeric, 2) AS käive_tüki_kohta,
    ROUND(SUM(s.quantity * (s.unit_price - p.cost_price))::numeric, 0) AS kasum,
    ROUND(AVG(s.unit_price - p.cost_price)::numeric, 2) AS kasum_tüki_kohta,
    p.cost_price AS omahind
FROM products p
JOIN sales s ON p.product_id = s.product_id
LEFT JOIN lao_andmed l ON p.product_id = l.product_id
GROUP BY p.product_id, p.product_name, p.category, p.cost_price, l.laoseis_kokku
ORDER BY kasum DESC
LIMIT 10;

-----------------

--sama nagu eelmine päring, aga öko serdid on külge pandud
WITH lao_andmed AS (
    SELECT 
        product_id,
        SUM(quantity_available) AS laoseis_kokku
    FROM inventory
    GROUP BY product_id
)
SELECT 
    p.product_id,
    p.product_name AS toote_nimi,
    p.category AS kategooria,
    COALESCE(l.laoseis_kokku, 0) AS laoseis,
    SUM(s.quantity) AS müüdud_kogus,
    ROUND(SUM(s.total_price)::numeric, 0) AS käive,
    ROUND(AVG(s.unit_price)::numeric, 2) AS käive_tüki_kohta,
    ROUND(SUM(s.quantity * (s.unit_price - p.cost_price))::numeric, 0) AS kasum,
    ROUND(AVG(s.unit_price - p.cost_price)::numeric, 2) AS kasum_tüki_kohta,
    p.cost_price AS omahind,
    p.eco_certified AS öko_sertifikaat
FROM products p
JOIN sales s ON p.product_id = s.product_id
LEFT JOIN lao_andmed l ON p.product_id = l.product_id
GROUP BY p.product_id, p.product_name, p.category, p.cost_price, p.eco_certified, l.laoseis_kokku
ORDER BY kasum DESC
LIMIT 10;
--Toode id 1198 öko sertifikaat on NULL. _crypto_aead_det_decrypt

--Kontroll toode 1198 kõik atribuudid
SELECT *
FROM products
WHERE product_id = 1198;
--sertifikaat on tühi

--mitmel tootel on öko sertifikaat NULL
SELECT COUNT(*) AS null_sertifikaate_kokku
FROM products
WHERE eco_certified IS NULL;
--Tulemus 18 toodet

--tegelik laoseis kategooriate lõikes
WITH kategooria_laoseis AS (
    SELECT 
        p.category,
        SUM(i.quantity_available) AS laoseis_kokku,
        SUM(i.quantity_available * p.cost_price) AS laoseisu_vaartus
    FROM inventory i
    JOIN products p ON i.product_id = p.product_id
    GROUP BY p.category
),
kategooria_muuk AS (
    SELECT 
        p.category,
        SUM(s.quantity) AS muudud_kokku,
        SUM(s.total_price) AS kaive_kokku
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category
),
muugi_periood AS (
    SELECT 
        GREATEST(MAX(sale_date::date) - MIN(sale_date::date), 1) AS paevade_arv
    FROM sales
)
SELECT 
    kl.category AS kategooria,
    TRIM(TO_CHAR(kl.laoseis_kokku, 'FM999,999,999')) AS laoseis,
    TRIM(TO_CHAR(ROUND(kl.laoseisu_vaartus::numeric, 0), 'FM999,999,999')) AS laoseisu_vaartus_omahinnas,
    TRIM(TO_CHAR(ROUND(
        kl.laoseis_kokku / 
        NULLIF((km.muudud_kokku::numeric / mp.paevade_arv), 0), 
        0
    ), 'FM999,999,999')) AS laoseis_paevades,
    TRIM(TO_CHAR(km.muudud_kokku, 'FM999,999,999')) AS müüdud_tk_kokku_kogu_ajalugu,
    TRIM(TO_CHAR(ROUND(km.kaive_kokku::numeric, 0), 'FM999,999,999')) AS käive_kokku
FROM kategooria_laoseis kl
JOIN kategooria_muuk km ON kl.category = km.category
CROSS JOIN muugi_periood mp
ORDER BY km.kaive_kokku DESC;

--kas inventory tabeli tegelik laoseis (quantity_available) vastab tegelikule lao liikumiste ajaloole (inventory_movements - kõik sisse/välja liikumised)
WITH hetkel_laos AS (
    SELECT 
        p.category,
        i.product_id,
        i.quantity_available AS current_qty
    FROM inventory i
    JOIN products p ON i.product_id = p.product_id
),
liikumiste_neto AS (
    SELECT 
        p.category,
        m.product_id,
        SUM(m.quantity) AS movement_net_qty
    FROM inventory_movements m
    JOIN products p ON m.product_id = p.product_id
    GROUP BY p.category, m.product_id
)
SELECT 
    COALESCE(s.category, l.category) AS kategooria,
    SUM(COALESCE(s.current_qty, 0)) AS hetkel_laos_tooted,
    SUM(COALESCE(l.movement_net_qty, 0)) AS liikumiste_neto_saldo,
    SUM(COALESCE(s.current_qty, 0)) - SUM(COALESCE(l.movement_net_qty, 0)) AS erinevus
FROM hetkel_laos s
FULL OUTER JOIN liikumiste_neto l ON s.product_id = l.product_id AND s.category = l.category
GROUP BY COALESCE(s.category, l.category)
ORDER BY erinevus DESC;
--Tulemus, kõikides kategooriates on müük olnud suurem kui tegelik laoseis ja see on viinud laoseisu kümnete ja sadade tuhandetega miinusesse. Tõenäoliselt on inventory tabelisse tehtud eraldiseiseid andmebaasi importeid või käsitsi ülekirjutamisi ja kaks tabelit ei ole omavahel kooskõlas ja andmed on vigased. Inventory movements tabelist võib olla puudu näiteks väljaliikumised (müük, mahakandmine) või inventory tabelit on valesti muudetud. Ideaalis peaks mõlemad numbrid olema samad. 


--eelmised kaks päringut ühes tabelis
WITH kategooria_laoseis AS (
    SELECT 
        p.category,
        SUM(i.quantity_available) AS laoseis_kokku,
        SUM(i.quantity_available * p.cost_price) AS laoseisu_väärtus
    FROM inventory i
    JOIN products p ON i.product_id = p.product_id
    GROUP BY p.category
),
kategooria_müük AS (
    SELECT 
        p.category,
        SUM(s.quantity) AS müüdud_kokku,
        SUM(s.total_price) AS käive_kokku
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category
),
kategooria_liikumised AS (
    SELECT 
        p.category,
        SUM(m.quantity) AS liikumiste_neto_saldo
    FROM inventory_movements m
    JOIN products p ON m.product_id = p.product_id
    GROUP BY p.category
),
müügi_periood AS (
    SELECT 
        GREATEST(MAX(sale_date::date) - MIN(sale_date::date), 1) AS päevade_arv
    FROM sales
)
SELECT 
    kl.category AS kategooria,
    TRIM(TO_CHAR(kl.laoseis_kokku, 'FM999,999,999')) AS laoseis,
    TRIM(TO_CHAR(ROUND(kl.laoseisu_väärtus::numeric, 0), 'FM999,999,999')) AS laoseisu_väärtus_omahinnas,
    TRIM(TO_CHAR(ROUND(
        kl.laoseis_kokku / 
        NULLIF((km.müüdud_kokku::numeric / mp.päevade_arv), 0), 
        0
    ), 'FM999,999,999')) AS laoseis_päevades,
    TRIM(TO_CHAR(km.müüdud_kokku, 'FM999,999,999')) AS müüdud_kokku_kogu_ajalugu,
    TRIM(TO_CHAR(ROUND(km.käive_kokku::numeric, 0), 'FM999,999,999')) AS käive_kokku,
    TRIM(TO_CHAR(COALESCE(klm.liikumiste_neto_saldo, 0), 'FM999,999,999')) AS liikumiste_neto_saldo,
    TRIM(TO_CHAR(kl.laoseis_kokku - COALESCE(klm.liikumiste_neto_saldo, 0), 'FM999,999,999')) AS erinevus
FROM kategooria_laoseis kl
LEFT JOIN kategooria_müük km ON kl.category = km.category
LEFT JOIN kategooria_liikumised klm ON kl.category = klm.category
CROSS JOIN müügi_periood mp
ORDER BY km.käive_kokku DESC;

---------------------
WITH toote_laoseis AS (
    SELECT 
        product_id,
        SUM(quantity_available) AS laoseis_kokku
    FROM inventory
    GROUP BY product_id
),
toote_liikumised AS (
    SELECT 
        product_id,
        SUM(quantity) AS liikumiste_neto
    FROM inventory_movements
    GROUP BY product_id
),
arvutus AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category,
        COALESCE(tl.laoseis_kokku, 0) AS laoseis_inventory,
        COALESCE(ml.liikumiste_neto, 0) AS liikumiste_neto,
        COALESCE(tl.laoseis_kokku, 0) - COALESCE(ml.liikumiste_neto, 0) AS vahe
    FROM products p
    LEFT JOIN toote_laoseis tl ON p.product_id = tl.product_id
    LEFT JOIN toote_liikumised ml ON p.product_id = ml.product_id
    WHERE p.category = 'meeste_riided'
)
SELECT *
FROM arvutus
ORDER BY ABS(vahe) DESC
LIMIT 15;

-----------
--Millised tooted on miinuses
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    i.quantity_available AS laoseis
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.quantity_available < 0
ORDER BY i.quantity_available ASC;
--Tulemus 10 toodet.

--kuidas tekkisid miinused
SELECT 
    movement_id,
    product_id,
    movement_type,
    quantity,
    timestamp,
    reference
FROM inventory_movements
WHERE product_id = 1111
ORDER BY timestamp ASC;


