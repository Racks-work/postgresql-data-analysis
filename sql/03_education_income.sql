-- Explore correlation between median household income and advanced education
-- PostgreSQL corr(Y, X) ignores rows where either input is NULL
SELECT
    COUNT(*) FILTER (WHERE median_hh_income IS NOT NULL AND pct_masters_higher IS NOT NULL) AS observations,
    ROUND(CORR(median_hh_income, pct_masters_higher)::numeric, 3) AS masters_income_correlation
FROM acs_2014_2018_stats;
