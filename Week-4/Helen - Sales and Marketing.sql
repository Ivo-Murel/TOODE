-- =====================================================
-- NÄDAL 4 – GRUPITÖÖ
-- ROLL A – HELEN
-- MÜÜGI KOONDANDMED JA TURUNDUS
-- =====================================================

-- 1. MÜÜK KUUDE KAUPA – 2024

SELECT
    DATE_TRUNC('month', sale_date)::date AS kuu,
    COUNT(sale_id) AS muugikirjete_arv,
    ROUND(SUM(total_price), 2) AS kogukaive,
    ROUND(AVG(total_price), 2) AS keskmine_muugisumma
FROM sales
WHERE sale_date >= '2024-01-01'
  AND sale_date < '2025-01-01'
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY kuu;

-- VASTUSED:
-- | Kuu       | Müügikirjeid | Kogukäive | Keskmine summa |
-- |-----------|--------------|-----------|----------------|
-- | Jaanuar   | 312          | 85618.65  | 274.42         |
-- | Veebruar  | 334          | 90181.83  | 270.01         |
-- | Märts     | 412          | 109559.98 | 265.92         |
-- | Aprill    | 411          | 113838.38 | 276.98         |
-- | Mai       | 413          | 116843.02 | 282.91         |
-- | Juuni     | 509          | 144558.18 | 284.00         |
-- | Juuli     | 510          | 146800.80 | 287.84         |
-- | August    | 511          | 144870.17 | 283.50         |
-- | September | 392          | 109267.47 | 278.74         |
-- | Oktoober  | 391          | 127622.32 | 326.40         |
-- | November  | 392          | 110573.94 | 282.08         |
-- | Detsember | 550          | 170623.28 | 310.22         |

-- JÄRELDUS:
-- Suurim kuukäive oli detsembris (170 623,28 EUR).
-- Väikseim kuukäive oli jaanuaris (85 618,65 EUR).
-- Kõrgeim keskmine müügikirje summa oli oktoobris
-- (326,40 EUR).


-- =====================================================
-- 2. MÜÜK TOOTEKATEGOORIATE KAUPA – 2024
-- =====================================================

SELECT
    p.category AS kategooria,
    COUNT(DISTINCT p.product_id) AS myydud_tooteid,
    ROUND(SUM(s.total_price), 2) AS kogukaive,
    ROUND(AVG(s.unit_price), 2) AS keskmine_uhikuhind
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
WHERE s.sale_date >= '2024-01-01'
  AND s.sale_date < '2025-01-01'
GROUP BY p.category
HAVING SUM(s.total_price) > 5000
ORDER BY kogukaive DESC;

-- VASTUSED:
-- | Kategooria    | Tooteid | Kogukäive | Keskmine hind |
-- |---------------|---------|-----------|---------------|
-- | meeste_riided | 81      | 389738.54 | 188.99        |
-- | jalanõud      | 71      | 379576.38 | 219.59        |
-- | naiste_riided | 68      | 342064.71 | 198.78        |
-- | aksessuaarid  | 62      | 202238.77 | 126.29        |
-- | laste_riided  | 68      | 156739.62 | 85.45         |

-- JÄRELDUS:
-- Suurima käibega kategooria oli meeste_riided
-- (389 738,54 EUR), millele järgnesid jalanõud
-- (379 576,38 EUR).
-- Väikseima käibega oli laste_riided
-- (156 739,62 EUR).
-- Kõik viis kategooriat ületasid HAVING piiri.


-- =====================================================
-- 3. KUISED MÜÜGITRENDID – CTE JA LAG()
-- =====================================================

WITH kuu_myyk AS (
    SELECT
        DATE_TRUNC('month', sale_date)::date AS kuu,
        ROUND(SUM(total_price), 2) AS kaive
    FROM sales
    WHERE sale_date >= '2024-01-01'
      AND sale_date < '2025-01-01'
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    kuu,
    kaive,
    LAG(kaive) OVER (ORDER BY kuu) AS eelmine_kuu,
    kaive - LAG(kaive) OVER (ORDER BY kuu) AS muutus
FROM kuu_myyk
ORDER BY kuu;

-- VASTUSED:
-- | Kuu       | Käive     | Eelmine kuu | Muutus    |
-- |-----------|-----------|-------------|-----------|
-- | Jaanuar   | 85618.65  | NULL        | NULL      |
-- | Veebruar  | 90181.83  | 85618.65    | 4563.18   |
-- | Märts     | 109559.98 | 90181.83    | 19378.15  |
-- | Aprill    | 113838.38 | 109559.98   | 4278.40   |
-- | Mai       | 116843.02 | 113838.38   | 3004.64   |
-- | Juuni     | 144558.18 | 116843.02   | 27715.16  |
-- | Juuli     | 146800.80 | 144558.18   | 2242.62   |
-- | August    | 144870.17 | 146800.80   | -1930.63  |
-- | September | 109267.47 | 144870.17   | -35602.70 |
-- | Oktoober  | 127622.32 | 109267.47   | 18354.85  |
-- | November  | 110573.94 | 127622.32   | -17048.38 |
-- | Detsember | 170623.28 | 110573.94   | 60049.34  |

-- JÄRELDUS:
-- Suurim kuine käibekasv toimus detsembris
-- (+60 049,34 EUR).
-- Suurim käibelangus toimus septembris
-- (-35 602,70 EUR).


-- =====================================================
-- 4. MÜÜGIANALÜÜSI KOKKUVÕTE JUHTKONNALE
-- =====================================================

-- 2024. aasta müügikäive kõikus kuude lõikes.
-- Kõrgeim kuukäive saavutati detsembris
-- (170 623,28 EUR) ja madalaim jaanuaris
-- (85 618,65 EUR), kusjuures detsembri käive
-- oli jaanuariga võrreldes ligikaudu 99% suurem.
--
-- Kuust-kuusse võrdluses toimus suurim kasv
-- detsembris (+60 049,34 EUR) ja suurim langus
-- septembris (-35 602,70 EUR).
--
-- 2024. aasta suurima käibega tootekategooria
-- oli meeste_riided (389 738,54 EUR), millele
-- järgnesid jalanõud (379 576,38 EUR).
--
-- JUHTKONNALE:
-- Detsembri tugev müügitulemus viitab vajadusele
-- pöörata aastalõpu perioodil tähelepanu laovarude
-- ja müügivõimekuse planeerimisele.
-- Septembri languse põhjuseid tuleks täiendavalt
-- analüüsida müügikanalite ja kampaaniate lõikes.
-- Hooajalisuse kinnitamiseks tuleb võrrelda
-- mitme aasta sama perioodi tulemusi.


-- =====================================================
-- EDASIJÕUDNUTE OSA (30%)
-- KUISE KÄIBE MUUTUS PROTSENTIDES
-- =====================================================

WITH kuu_myyk AS (
    SELECT
        DATE_TRUNC('month', sale_date)::date AS kuu,
        SUM(total_price) AS kaive
    FROM sales
    WHERE sale_date >= '2024-01-01'
      AND sale_date < '2025-01-01'
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    kuu,
    ROUND(kaive, 2) AS kogukaive,
    ROUND(LAG(kaive) OVER (ORDER BY kuu), 2)
        AS eelmise_kuu_kaive,
    ROUND(
        (kaive - LAG(kaive) OVER (ORDER BY kuu))
        / NULLIF(LAG(kaive) OVER (ORDER BY kuu), 0) * 100,
        1
    ) AS kasvu_protsent
FROM kuu_myyk
ORDER BY kuu;

-- VASTUSED:
-- | Kuu       | Kogukäive | Eelmine kuu | Kasv (%) |
-- |-----------|-----------|-------------|----------|
-- | Jaanuar   | 85618.65  | NULL        | NULL     |
-- | Veebruar  | 90181.83  | 85618.65    | 5.3      |
-- | Märts     | 109559.98 | 90181.83    | 21.5     |
-- | Aprill    | 113838.38 | 109559.98   | 3.9      |
-- | Mai       | 116843.02 | 113838.38   | 2.6      |
-- | Juuni     | 144558.18 | 116843.02   | 23.7     |
-- | Juuli     | 146800.80 | 144558.18   | 1.6      |
-- | August    | 144870.17 | 146800.80   | -1.3     |
-- | September | 109267.47 | 144870.17   | -24.6    |
-- | Oktoober  | 127622.32 | 109267.47   | 16.8     |
-- | November  | 110573.94 | 127622.32   | -13.4    |
-- | Detsember | 170623.28 | 110573.94   | 54.3     |

-- JÄRELDUS:
-- Suurim suhteline käibekasv oli detsembris
-- (+54,3%) ning suurim langus septembris
-- (-24,6%).
-- Ühe aasta andmed ei kinnita veel püsivat
-- hooajalist müügimustrit.


-- =====================================================
-- KVALITEEDIKONTROLL – 2024. AASTA MÜÜGIKÄIVE
-- =====================================================

SELECT
    (
        SELECT ROUND(SUM(total_price), 2)
        FROM sales
        WHERE sale_date >= '2024-01-01'
          AND sale_date < '2025-01-01'
    ) AS kogu_muugikaive,
    (
        SELECT ROUND(SUM(s.total_price), 2)
        FROM sales s
        JOIN products p
            ON s.product_id = p.product_id
        WHERE s.sale_date >= '2024-01-01'
          AND s.sale_date < '2025-01-01'
    ) AS kategooriate_kaive;

-- KONTROLLI TULEMUS:
-- 2024. aasta kogu müügikäive: 1 470 358,02 EUR.
-- Kategooriate müügikäive: 1 470 358,02 EUR.
-- Erinevus: 0,00 EUR.
--
-- GROUP BY päringud töötasid veatult.
-- HAVING oli kasutatud kategooriate analüüsis.
-- CTE ja LAG() olid kasutatud trendianalüüsis.
-- Juhtkonna kokkuvõte põhines SQL-i tulemustel.
--
-- KVALITEEDIKONTROLL LÄBITUD.
