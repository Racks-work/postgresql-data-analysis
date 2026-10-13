-- Rank 2016 library agencies serving at least 250,000 people
-- Requires pls_fy2016_libraries (popu_lsa, visits, libname, stabr)
SELECT
    stabr,
    libname,
    popu_lsa,
    visits,
    ROUND(visits::numeric / NULLIF(popu_lsa, 0) * 1000, 2) AS visits_per_1000,
    RANK() OVER (ORDER BY visits::numeric / NULLIF(popu_lsa, 0) DESC NULLS LAST) AS visit_rate_rank
FROM pls_fy2016_libraries
WHERE popu_lsa >= 250000
ORDER BY visit_rate_rank, libname;
