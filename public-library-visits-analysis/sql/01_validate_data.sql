-- Check imported record counts and availability of visits data.
SELECT '2016' AS fiscal_year,
       COUNT(*) AS total_libraries,
       COUNT(DISTINCT fscskey) AS unique_library_ids,
       COUNT(visits) AS libraries_with_visits
FROM public.pls_fy2016_libraries
UNION ALL
SELECT '2018' AS fiscal_year,
       COUNT(*) AS total_libraries,
       COUNT(DISTINCT fscskey) AS unique_library_ids,
       COUNT(visits) AS libraries_with_visits
FROM public.pls_fy2018_libraries;

-- Count matched identifiers with reported visits in both years.
SELECT COUNT(*) AS matched_records_with_visits
FROM public.pls_fy2016_libraries AS a
JOIN public.pls_fy2018_libraries AS b
  ON a.fscskey = b.fscskey
WHERE a.visits IS NOT NULL AND b.visits IS NOT NULL;
