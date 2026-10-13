# Data and setup notes

The original assignments reference these tables:

| Table | Fields needed | Purpose |
|---|---|---|
| `pls_fy2016_libraries` | `fscskey`, `stabr`, `libname`, `popu_lsa`, `visits`, `wifisess` | 2016 library usage |
| `pls_fy2018_libraries` | `fscskey`, `visits`, `wifisess` | 2018 library usage |
| `acs_2014_2018_stats` | `median_hh_income`, `pct_masters_higher` | Income/education correlation |

Source references in coursework include the Public Libraries Survey and ACS statistics. Verify dataset licensing, origin, and source links before publication. Data files are not included in this starter.

## Validation checklist
- [ ] Verify CSV header names match PostgreSQL schema
- [ ] Verify data imports completed without error
- [ ] Verify library IDs are stable across years and rows are unique
- [ ] Check for zero denominators and missing/sentinel values
- [ ] Execute queries and compare counts to source data
- [ ] Capture screenshots of real results
- [ ] Add findings to README

**Important:** Queries are untested until run in a database populated with the original datasets. Annual differences do not necessarily imply causation.
