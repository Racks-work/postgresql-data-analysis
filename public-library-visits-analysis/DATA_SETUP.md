# Data setup (PostgreSQL / pgAdmin 4)

## Database and tables

Connect to the PostgreSQL database where you want to run the analysis (for example, `portfolio_data_analysis`). This project expects:

- `public.pls_fy2016_libraries` with `fscskey`, `stabr`, `visits` (other columns are optional for this analysis)
- `public.pls_fy2018_libraries` with `fscskey`, `visits`, `wifisess`

If the tables do not yet exist, the following minimal schemas can be used:

```sql
CREATE TABLE IF NOT EXISTS public.pls_fy2016_libraries (
    fscskey TEXT PRIMARY KEY,
    stabr TEXT,
    visits INTEGER
);

CREATE TABLE IF NOT EXISTS public.pls_fy2018_libraries (
    fscskey TEXT PRIMARY KEY,
    visits INTEGER,
    wifisess INTEGER
);
```

**Important:** If your 2016 table already contains `libname`, `popu_lsa`, or other columns, do not recreate or replace it. The existing table can be used directly.

## Preparing a CSV

The CSV must have columns in the same order as the target table's selected import columns. For a three-column 2018 CSV, use:

```csv
fscskey,visits,wifisess
```

The file must contain actual data rows after the header. If the source file has additional columns, prepare a separate import CSV containing only the three fields above.

## Import with pgAdmin

1. In the Object Explorer, navigate to **Databases → your database → Schemas → public → Tables**.
2. Right-click the appropriate table and select **Import/Export Data**.
3. Select **Import** and choose the actual CSV file using the file picker (do not prepend another directory to a full file path).
4. Set **Format: csv**, **Header: Yes** if the first row has column names, **Delimiter: comma (,)**, **Quote: double quote (\")**, and **Encoding: UTF8**.
5. On the **Columns** tab, select only the fields included in your import CSV, in matching order.
6. Run the import, then check its status in the Processes tab.

If you see `No such file or directory`, browse to the file again and ensure it exists in the selected location. If you see `invalid input syntax for type integer: "visits"`, ensure **Header: Yes**. Avoid importing the same file repeatedly into a populated table without checking for duplicates.

## Verify the imported data

```sql
SELECT COUNT(*) FROM public.pls_fy2016_libraries;
SELECT COUNT(*) FROM public.pls_fy2018_libraries;
```

In the user's successful pgAdmin screenshots, the 2016 table contained **9,252 rows** and the 2018 table contained **9,261 rows**. Your results may vary with different extracts.

Proceed with `sql/01_validate_data.sql` once both tables are populated.
