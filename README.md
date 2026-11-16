# BI Relegance Data Services

AL extension for Business Central that publishes query web services for the NAV master and accounting extracts listed in `Query Navision.txt`.

## Published queries

| Web service | Business Central source | Notes |
| --- | --- | --- |
| `BI_Vendor` | Vendor | Fields use underscore identifiers and NAV captions. Blocked is the BC status enum. |
| `BI_Customer` | Customer | Customer number and name. |
| `BI_VendorLedgerEntry` | Vendor Ledger Entry | Uses the full NAV extract field set, with the duplicate document-date column removed. |
| `BI_DetailedVendorLedgerEntry` | Detailed Vendor Ledg. Entry | Amounts are exposed in LCY as in the NAV extract. |
| `BI_GLAccount` | G/L Account | Account number, name, account type, and the native Business Central Income/Balance enum. |
| `BI_AnalyticalAccount` | Cost Type | Maps NAV analytical accounts to Business Central Cost Accounting and exposes the `TZSI Income/Balance` field from HOTEL BACK OFFICE. |
| `BI_CostCenter` | Cost Center | Code, name, and responsible person. |
| `BI_GeneralLedgerEntry` | G/L Entry | General ledger entry values and source references. |
| `BI_AnalyticalLedgerEntry` | Cost Entry | Maps cost type, cost center, and G/L entry references to NAV analytical ledger fields. |

Install and upgrade codeunits publish all query objects in the app's query ID range, following the reference extension's `Tenant Web Service` approach, and keep the published service names aligned with the `BI_*` query names. The app depends on HOTEL BACK OFFICE for the analytical account nature field. Query column identifiers use valid OData-safe underscores; captions retain the legacy NAV aliases. The company is selected by the Business Central web service URL; the legacy Qlik `Company Code` constant was not present in the NAV SQL table data and is not fabricated as a query column.

The legacy `Fiscal Code` is exposed through the Italian `Vendor` field. Blocked status and Income/Balance retain their native Business Central enum values; these query objects cannot apply the old NAV SQL text conversions (`True`/`False` and `CE`/`SP`). Boolean query columns are returned as JSON booleans rather than legacy text strings.

