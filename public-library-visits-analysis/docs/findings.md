# Analysis findings

## Research question

How did reported public-library visits change between fiscal years 2016 and 2018 among libraries with matching identifiers and available visit counts?

## Overall trend

The matched-library analysis found 1,355,080,211 visits in 2016 and 1,278,168,909 in 2018, a decrease of 76,911,302 visits (5.68%).

## Jurisdiction differences

The state-level query returned 53 jurisdictions. Among the highest percentage increases shown in the query results were Guam (+4.60%), South Dakota (+2.75%), and Oklahoma (+2.19%). The largest percentage declines shown were Hawaii (−23.03%), American Samoa (−22.70%), and Louisiana (−19.91%).

Hawaii, American Samoa, and Guam each had only one matched record in this comparison. The results are not equivalent to a survey of all branches within those jurisdictions.

## Methods

An inner join matched FY2016 and FY2018 library records by `fscskey`. Rows with null visits in either year were excluded. Overall and state-level totals were calculated with `SUM`; percentage changes were calculated relative to FY2016 totals with division by zero protected using `NULLIF`.

## Caveats

- Findings are based on matching identifiers, not the full universe of libraries in either year.
- Some jurisdictions contain very few matched records.
- Reported visitation figures may be subject to source definitions and reporting differences.
- These results describe changes but do not identify the reasons behind them.

## Evidence

Figures were transcribed from successful PostgreSQL/pgAdmin results provided during project development. The complete 53-row state-level result export was not provided, so only visible rows are documented.
