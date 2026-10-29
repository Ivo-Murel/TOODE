# 5. nädal | UrbanStyle – Power BI visualiseerimine

## Projekti ülevaade

**Autor:** Ivo
**Roll:** A – CEO DASHBOARD - Kõrgtaseme KPI-d, müügitulu, kasv.  
**Projekt:** UrbanStyle – müügi- ja laoseisu analüüs  
**Töövahendid:** PostgreSQL, Supabase, Power BI Desktop ja GitHub  
**Müügiandmete periood:** 2023–2026

## Projekti eesmärk

Peamine küsimus kas me kasvame - vastus, 2026-2025 on müükide langus ja kasvu ei ole.

Lisaks kohustuslikele visualiseeringutele koostasin täiendavad KPI-kaardid
- Müük aastate lõikes ja 2026 muutus vs 2024 - tulemus -99%
- Müügitrend aastate lõike ja kuude lõikes
- Klientide arv

---

## 1. Kasutatud andmed

| Tabelid | Kasutus |
|---|---|
| public sales | Müügitulu ja müügikohtade analüüs |
| public products | Toodete jaotamine kategooriatesse |
| public customers | Andmemudeli kliendiandmed |

PBI-s sai loodud:
- SQL päringud saamaks sisendit Power BI jaoks
- Sai loodud 2 diagrammi sobivate tüüpidega oma stakeholder'ile
- Selged pealkirjad, sildid ja värvid.
- Conditional formatting (roheline = kasv, punane = langus)
- Lühike äritõlgendus

---

### Äritõlgendus ja tegevused

- MÜÜGITRENDID - 2024 a. parim aasta käive 1,47M€, 2025 a. käive kukkus 200K€ peale (märts-nov müüki ei toimunud) ning 2026 a. tegi ettevõte kõigest 4000€ käivet (-99% vs 2024) - seega on ettevõtte tegevus sisuliselt lõpetatud.
- EDASISED TEGEVUSED - PLANEERIDA TURUNDUSKAMPAANIAID KÕRGHOOAJA PERIOODIDELE Q2 JA Q4.

---

### SQL-päringud

-- Käive kuude lõikes
SELECT DATE_TRUNC('month', sale_date) AS kuu,             
       SUM(total_price) AS tulu                     
FROM sales 
GROUP BY kuu 
ORDER BY kuu;                         
-- Tulemus 33 rida, märts-november 2025 müüke ei toimunud, parim kuu detsember 2024, kõige halvem kuu 2026 august.

-- Müükide muutus 2026 vs 2024
WITH yearly_sales AS (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS aasta,
        SUM(total_price) AS kogutulu
    FROM sales
    WHERE EXTRACT(YEAR FROM sale_date) IN (2024, 2026)
    GROUP BY EXTRACT(YEAR FROM sale_date)
)
SELECT 
    MAX(CASE WHEN aasta = 2024 THEN kogutulu END) AS tulu_2024,
    MAX(CASE WHEN aasta = 2026 THEN kogutulu END) AS tulu_2026,
    -- Rahaline muutus eurodes (2026 miinus 2024)
    (MAX(CASE WHEN aasta = 2026 THEN kogutulu END) - MAX(CASE WHEN aasta = 2024 THEN kogutulu END)) AS muutus_eurodes,
    -- Muutuse protsent
    ROUND(
        ((MAX(CASE WHEN aasta = 2026 THEN kogutulu END) - MAX(CASE WHEN aasta = 2024 THEN kogutulu END)) / 
        NULLIF(MAX(CASE WHEN aasta = 2024 THEN kogutulu END), 0)) * 100, 2
    ) AS muutus_protsentides
FROM yearly_sales;
-- 2026 a tulu 4K€ vs 2024 1,4miljonit, langus 99,7%
