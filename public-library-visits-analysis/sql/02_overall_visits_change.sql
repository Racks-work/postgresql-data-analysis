-- Overall visitation change across matched libraries with non-null visits.
SELECT
    SUM(a.visits) AS total_visits_2016,
    SUM(b.visits) AS total_visits_2018,
    SUM(b.visits) - SUM(a.visits) AS total_visit_change,
    ROUND(
        (SUM(b.visits) - SUM(a.visits))::numeric
        / NULLIF(SUM(a.visits), 0) * 100,
        2
    ) AS percent_change
FROM public.pls_fy2016_libraries AS a
JOIN public.pls_fy2018_libraries AS b
    ON a.fscskey = b.fscskey
WHERE a.visits IS NOT NULL
  AND b.visits IS NOT NULL;
