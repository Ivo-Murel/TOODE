-- WEEK 2 GRUPITÖÖ – HELEN
-- Roll B: Customers / kliendiandmete puhastamine

-- 1. Loome customers tabelist turvalise testkoopia
CREATE TABLE customers_test AS
SELECT * FROM customers;

-- 2. Kontrollime customers_test ridade arvu
SELECT COUNT(*) AS ridade_arv
FROM customers_test;
-- TULEMUS: customers_test tabelis on 3150 rida.
-- Testkoopia sisaldab sama palju ridu kui algne customers tabel.

-- 3. Kontrollime korduvaid e-posti aadresse
SELECT
    email,
    COUNT(*) AS koopiate_arv
FROM customers_test
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;
--Näiteks on tulemusel näha:
-- mihkel.rosin@yahoo.com → 3 korda
-- maris.paas@mail.ee → 3 korda
-- mitmed teised → 2 korda

-- 4. Loendame, mitu erinevat e-posti aadressi esineb rohkem kui ühe korra
SELECT COUNT(*) AS korduvate_emailide_arv
FROM (
    SELECT email
    FROM customers_test
    WHERE email IS NOT NULL
    GROUP BY email
    HAVING COUNT(*) > 1
) AS korduvad_emailid;

-- TULEMUS: customers_test tabelis esineb 128 erinevat
-- mitte-NULL e-posti aadressi rohkem kui ühe korra.

-- 5. Kontrollime puuduvaid kliendiandmeid
SELECT
    COUNT(*) FILTER (WHERE first_name IS NULL) AS puuduv_eesnimi,
    COUNT(*) FILTER (WHERE last_name IS NULL) AS puuduv_perenimi,
    COUNT(*) FILTER (WHERE email IS NULL) AS puuduv_email,
    COUNT(*) FILTER (WHERE phone IS NULL) AS puuduv_telefon
FROM customers_test;
-- TULEMUS:
-- Eesnimi puudub 0 kliendil.
-- Perenimi puudub 0 kliendil.
-- E-post puudub 380 kliendil.
-- Telefon puudub 0 kliendil.
-- Puuduvatest kontaktandmetest vajab tähelepanu eelkõige email.

-- 6. Kontrollime linnanimede erinevaid kirjapilte
SELECT
    city,
    COUNT(*) AS kirjete_arv
FROM customers_test
WHERE city IS NOT NULL
GROUP BY city
ORDER BY city;

-- 7. Kontrollime linnanimede arvu pärast kirjapildi ühtlustamist
SELECT
    COUNT(DISTINCT INITCAP(TRIM(city))) AS puhastatud_linnade_arv
FROM customers_test
WHERE city IS NOT NULL;
-- TULEMUS:
-- Linnanimedel oli algselt 54 erinevat kirjapilti.
-- TRIM ja INITCAP abil kirjapilti ühtlustades jääb 12 erinevat linnanime.
-- See näitab, et city väljal esineb palju ebajärjekindlaid kirjapilte.

-- 8. NB! Vaata kogu 8 samm ennem kui midagi köivitad! Standardiseerime linnanimede kirjapildi testtabelis!! NB UPDATE muudab nüüd test tabelit, selectiga vaid vaatasime.
UPDATE customers_test
SET city = INITCAP(TRIM(city))
WHERE city IS NOT NULL;
-- TULEMUS:
-- Linnanimede kirjapilt standardiseeriti customers_test tabelis.
-- Järelkontroll tagastas 0 rida.
-- Kõik city väärtused vastavad nüüd TRIM + INITCAP kujule.
-- Originaalset customers tabelit ei muudetud.

-- 8A. Eelvaade: kontrollime, kuidas linnanimed muutuksid! Selle tegin enne 8 Run käivitamist!!!!!!!!!!!!!!!!!!!
SELECT
    city AS enne,
    INITCAP(TRIM(city)) AS parast
FROM customers_test
WHERE city IS NOT NULL
  AND city <> INITCAP(TRIM(city))
ORDER BY city;

-- 8 AA JÄRELKONTROLL, et kõik toimis nii nagu peab! Selle tegin peale puhastamist.

SELECT
    city AS enne,
    INITCAP(TRIM(city)) AS parast
FROM customers_test
WHERE city IS NOT NULL
  AND city <> INITCAP(TRIM(city))
ORDER BY city;


-- ENNE PUHASTAMIST: erinevate linnakirjapiltide arv
SELECT COUNT(DISTINCT city) AS algseid_kirjapilte
FROM customers
WHERE city IS NOT NULL;


-- PÄRAST PUHASTAMIST: erinevate linnanimede arv
SELECT COUNT(DISTINCT city) AS linnu_parast_puhastamist
FROM customers_test
WHERE city IS NOT NULL;

-- 9. Kontrollime, kas sama e-postiga kirjetel on erinevad nimed
SELECT
    email,
    COUNT(*) AS kirjete_arv,
    COUNT(DISTINCT CONCAT(first_name, ' ', last_name)) AS erinevaid_nimesid
FROM customers_test
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
   AND COUNT(DISTINCT CONCAT(first_name, ' ', last_name)) > 1
ORDER BY erinevaid_nimesid DESC, kirjete_arv DESC;

-- 10. Eelvaade: mitu e-posti aadressi vajab standardiseerimist
SELECT COUNT(*) AS parandamist_vajavad_emailid
FROM customers_test
WHERE email IS NOT NULL
  AND email != LOWER(TRIM(email));
-- TULEMUS:
-- Parandamist vajavaid e-posti aadresse on 0.
-- Kõik olemasolevad e-posti aadressid vastavad juba LOWER + TRIM kujule.
-- E-posti aadresside UPDATE ei ole vajalik.


-- 11. Kontrollime telefoninumbrite standardset kuju
SELECT
    phone,
    CASE
        WHEN phone LIKE '+372%' THEN phone
        WHEN phone LIKE '372%' THEN '+' || phone
        WHEN LENGTH(phone) = 7 THEN '+372' || phone
        ELSE phone
    END AS standardne_telefon
FROM customers_test
WHERE phone IS NOT NULL
LIMIT 10;

-- TULEMUS:
-- Kontrollitud 10 telefoninumbrit olid juba +372 formaadis.
-- CASE WHEN kontrollis telefoninumbrite kuju.
-- Kontrollitud näidetes ei olnud formaati vaja muuta.
