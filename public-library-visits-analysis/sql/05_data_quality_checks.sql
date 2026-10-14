-- Confirm fscskey uniqueness before interpreting joins as one-to-one.
SELECT '2016' AS fiscal_year, fscskey, COUNT(*) AS records
FROM public.pls_fy2016_libraries
GROUP BY fscskey
HAVING COUNT(*) > 1
UNION ALL
SELECT '2018' AS fiscal_year, fscskey, COUNT(*) AS records
FROM public.pls_fy2018_libraries
GROUP BY fscskey
HAVING COUNT(*) > 1;

-- Missing visit counts in each dataset.
SELECT '2016' AS fiscal_year,
       COUNT(*) FILTER (WHERE visits IS NULL) AS missing_visits
FROM public.pls_fy2016_libraries
UNION ALL
SELECT '2018' AS fiscal_year,
       COUNT(*) FILTER (WHERE visits IS NULL) AS missing_visits
FROM public.pls_fy2018_libraries;

-- Count identifiers that do not have a match in the other fiscal year.
SELECT
  (SELECT COUNT(*) FROM public.pls_fy2016_libraries a
   WHERE NOT EXISTS (
     SELECT 1 FROM public.pls_fy2018_libraries b
     WHERE b.fscskey = a.fscskey)) AS only_in_2016,
  (SELECT COUNT(*) FROM public.pls_fy2018_libraries b
   WHERE NOT EXISTS (
     SELECT 1 FROM public.pls_fy2016_libraries a
     WHERE a.fscskey = b.fscskey)) AS only_in_2018;
