# Public Library Visits Analysis (2016–2018)

A PostgreSQL portfolio project analyzing changes in reported public-library visits between fiscal years 2016 and 2018. The analysis matches library records by `fscskey`, calculates changes in visits, and compares trends across states and territories.

## Project highlights

- **1,355,080,211** reported visits in 2016 across matched records with non-null visit counts
- **1,278,168,909** reported visits in 2018 for those same matched records
- **−76,911,302 visits (−5.68%)** overall
- **53 state/territory groupings** returned in the state-level analysis

These figures were observed in pgAdmin query results on October 14, 2026. They apply to matched records with non-null visit counts in both years, not necessarily all public libraries.

## Selected findings

### Largest percentage increases (visible results)

| Jurisdiction | Matched records | Change in visits | Percentage change |
|---|---:|---:|---:|
| Guam (GU) | 1 | +3,306 | +4.60% |
| South Dakota (SD) | 110 | +102,428 | +2.75% |
| Oklahoma (OK) | 119 | +286,754 | +2.19% |
| Montana (MT) | 82 | +34,632 | +0.81% |
| North Dakota (ND) | 78 | +14,647 | +0.67% |

### Largest percentage declines (visible results)

| Jurisdiction | Matched records | Change in visits | Percentage change |
|---|---:|---:|---:|
| Hawaii (HI) | 1 | −1,034,189 | −23.03% |
| American Samoa (AS) | 1 | −14,338 | −22.70% |
| Louisiana (LA) | 67 | −4,034,791 | −19.91% |
| Mississippi (MS) | 52 | −1,312,696 | −14.72% |
| South Carolina (SC) | 42 | −1,813,423 | −11.48% |
| Arkansas (AR) | 60 | −1,044,349 | −9.86% |
| Alabama (AL) | 223 | −1,448,517 | −9.26% |

**Interpretation:** Visits declined overall across the matched records, but changes varied across jurisdictions. Single-record jurisdictions (such as Hawaii, Guam, and American Samoa in this dataset) should not be interpreted as representative of all libraries within the jurisdiction.

## Tools and SQL concepts

PostgreSQL 18, pgAdmin 4, `INNER JOIN`, `GROUP BY`, `SUM`, `COUNT`, `COUNT(DISTINCT)`, `ROUND`, `NULLIF`, `ORDER BY`, and null filtering.

## Repository structure

```text
public-library-visits-analysis/
├── README.md
├── DATA_SETUP.md
├── sql/
│   ├── 01_validate_data.sql
│   ├── 02_overall_visits_change.sql
│   ├── 03_state_visits_increases.sql
│   ├── 04_state_visits_declines.sql
│   └── 05_data_quality_checks.sql
├── docs/
│   └── findings.md
└── .gitignore
```

## How to reproduce

1. Obtain the FY2016 and FY2018 Public Libraries Survey data from the source used for your coursework or the Institute of Museum and Library Services (IMLS).
2. Follow [DATA_SETUP.md](DATA_SETUP.md) to prepare and import the needed columns.
3. Open pgAdmin Query Tool connected to your PostgreSQL database.
4. Execute the files in `sql/` in numeric order.
5. Compare the results with the findings above. Results may differ if the data extracts, filtering, or library identifiers differ.

## Analysis approach and limitations

- `fscskey` is used to match records across fiscal years.
- An `INNER JOIN` retains only identifiers present in both datasets.
- Records with null `visits` in either year are excluded from change calculations.
- The state is taken from the FY2016 dataset (`a.stabr`).
- The queries assume each `fscskey` occurs at most once in each table; see `05_data_quality_checks.sql` to verify uniqueness.
- These are observational comparisons, not causal explanations for changes in library use.
- The 2016 table contains additional fields in the user's database; the 2018 table in this project needs only `fscskey`, `visits`, and `wifisess`.

## Source and attribution

Data: U.S. Public Libraries Survey (PLS), FY2016 and FY2018, Institute of Museum and Library Services (IMLS). The source CSVs are **not included** in this repository package. Check source documentation for field definitions and any revisions before publishing derived claims.

## Suggested resume bullet

Analyzed over 1.2 billion annual public-library visits using PostgreSQL; joined FY2016 and FY2018 library records, calculated a 5.68% decline across matched observations, and identified state-level visitation trends with reusable SQL queries.
