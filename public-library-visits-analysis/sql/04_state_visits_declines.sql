-- Jurisdictions ranked by percentage change, lowest first.
SELECT
    a.stabr AS state,
    COUNT(*) AS libraries_compared,
    SUM(a.visits) AS visits_2016,
    SUM(b.visits) AS visits_2018,
    SUM(b.visits) - SUM(a.visits) AS visit_change,
    ROUND(
        (SUM(b.visits) - SUM(a.visits))::numeric
        / NULLIF(SUM(a.visits), 0) * 100,
        2
    ) AS percent_change
FROM public.pls_fy2016_libraries AS a
JOIN public.pls_fy2018_libraries AS b
    ON a.fscskey = b.fscskey
WHERE a.visits IS NOT NULL
  AND b.visits IS NOT NULL
GROUP BY a.stabr
ORDER BY percent_change ASC NULLS LAST;
