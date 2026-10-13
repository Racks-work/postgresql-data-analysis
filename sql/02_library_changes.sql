-- Compare visits and Wi-Fi sessions for matched library agencies, 2016 vs 2018
-- Join on fscskey (verify identifier stability in source documentation)
SELECT
    a.stabr,
    a.libname,
    a.visits AS visits_2016,
    b.visits AS visits_2018,
    ROUND((b.visits - a.visits)::numeric / NULLIF(a.visits, 0) * 100, 2) AS visits_pct_change,
    a.wifisess AS wifi_2016,
    b.wifisess AS wifi_2018,
    ROUND((b.wifisess - a.wifisess)::numeric / NULLIF(a.wifisess, 0) * 100, 2) AS wifi_pct_change
FROM pls_fy2016_libraries AS a
JOIN pls_fy2018_libraries AS b USING (fscskey)
ORDER BY visits_pct_change DESC NULLS LAST;
