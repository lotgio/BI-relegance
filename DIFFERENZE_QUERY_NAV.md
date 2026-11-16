# Differenze tra le query NAV e i servizi Business Central

## Scopo e fonti

Questo documento confronta gli estratti SQL NAV/Qlik contenuti nel file `Query Navision.txt` con le query AL dell'estensione BI Relegance. Il confronto riguarda struttura, campi, nomi e trasformazioni definite nel codice; non verifica la corrispondenza dei dati effettivamente presenti nei due ambienti.

## In breve

- I servizi BC usano i nomi `BI_*` (per esempio `BI_CostCenter`); le sezioni NAV usano nomi come `COST_CENTER` e `GENERAL_LEDGER`.
- I nomi tecnici delle colonne AL usano underscore per essere compatibili con AL/OData. Le caption mantengono, dove possibile, le etichette leggibili dell'estratto NAV.
- `Company Code` non è esposto come colonna: nell'estratto NAV era una costante Qlik (`vCompanyCode`), mentre in BC la società viene scelta nel percorso OData, ad esempio `Company('Relegance')`.
- Alcune conversioni di valori del vecchio SQL non sono riprodotte: i flag restano booleani o enum BC invece di stringhe `True`/`False` e `CE`/`SP`.
- I campi NAV basati su Option/enum (per esempio tipo conto, tipo documento e tipo movimento) usano i corrispondenti tipi/valori nativi BC; non è stata aggiunta una ricodifica verso gli eventuali codici numerici storici.
- La sorgente NAV usa tabelle o campi personalizzati. In BC alcune entità sono state mappate sulle tabelle standard di contabilità dei costi; il confronto non implica che i dati o le regole aziendali siano identici.

## Confronto per estratto

| Estratto NAV | Servizio/query BC | Tabella BC | Differenze principali |
| --- | --- | --- | --- |
| `VENDOR` | `BI_Vendor` | Vendor | Campi anagrafici e codice fiscale mantenuti. `Blocked` non viene convertito nella stringa `True`/`False`; BC espone il proprio stato enum. La caption AL è `Blocked Vendor Status`, mentre NAV la chiamava `Blocked Vendor Flag`. |
| `CUSTOMER` | `BI_Customer` | Customer | Numero e nome cliente mantenuti. `Company Code` è omesso come colonna. |
| `VENDOR_LEDGER` | `BI_VendorLedgerEntry` | Vendor Ledger Entry | I campi del set completo sono mantenuti. I due SELECT preliminari NAV ripetono `VL Entry ID` e `Document Date TMP`; nell'endpoint AL la data è esposta una volta come `Reference Document Date TMP`. `Open` è booleano BC, non testo `True`/`False`. `Company Code` è omesso. |
| SELECT dettagliato del partitario fornitori | `BI_DetailedVendorLedgerEntry` | Detailed Vendor Ledg. Entry | Esposto come servizio separato. Gli importi restano quelli in valuta locale (`LCY`), come nel NAV. `Company Code` è omesso. |
| `GL_ACCOUNT` | `BI_GLAccount` | G/L Account | Numero, nome e tipo conto mantenuti. `Income_Balance` non viene convertito in `CE`/`SP`; viene esposto il valore enum Business Central. `Company Code` è omesso. |
| `AL_ACCOUNT` | `BI_AnalyticalAccount` | Cost Type | La tabella NAV `Analytical Account` è mappata sulla tabella BC `Cost Type`. Il campo natura usa l'estensione `TZSI Income/Balance` di HOTEL BACK OFFICE; non viene applicata la conversione NAV `0 → CE`, `1 → SP`. `Company Code` è omesso. |
| `COST_CENTER` | `BI_CostCenter` | Cost Center | La tabella NAV `Analytical Cost Center` è mappata sulla tabella BC `Cost Center`. Codice, nome e responsabile sono esposti. `Company Code` è omesso. |
| `GENERAL_LEDGER` | `BI_GeneralLedgerEntry` | G/L Entry | I campi contabili e i riferimenti sono mantenuti. `System-Created Entry` è booleano BC, non testo `True`/`False`. `Company Code` è omesso. |
| `ANALYTICAL_LEDGER` | `BI_AnalyticalLedgerEntry` | Cost Entry | La tabella NAV `Analytical Ledger Entry` è mappata su BC `Cost Entry`. `System-Created Entry` è booleano BC, non testo `True`/`False`. `Company Code` è omesso. |

## Differenze di nomi e formato

### Servizi

In BC i nomi OData pubblicati sono quelli delle query AL con prefisso `BI_`, per esempio `BI_CostCenter`. Non usare il nome della sezione NAV come nome del servizio, a meno che non sia effettivamente riportato in **Web Services**.

### Colonne

Le colonne AL hanno identificatori tecnici con underscore, ad esempio `Vendor_Main_Address_Postal_Code`; la caption leggibile corrispondente è `Vendor Main Address Postal Code`. Le caption non cambiano la natura o il tipo del dato restituito. Per integrazioni automatiche fare riferimento ai nomi effettivi esposti nei metadati OData.

### Società

La costante Qlik `vCompanyCode` non proviene dalle tabelle NAV lette e non è stata inventata come campo AL. La società si seleziona nell'URL OData, ad esempio `Company('Relegance')`.

## Differenze di tipo e valore da considerare nei consumer

| Campo NAV | Comportamento NAV | Comportamento BC |
| --- | --- | --- |
| `Blocked Vendor Flag` | Testo `True` o `False` ricavato da `Blocked = 1` | Enum `Blocked` nativo della scheda fornitore; non è lo stesso insieme di valori del flag NAV. |
| `Open Flag` | Testo `True` o `False` | Booleano JSON. |
| `GL System-Created Entry Flag` | Testo `True` o `False` | Booleano JSON. |
| `AL System-Created Entry Flag` | Testo `True` o `False` | Booleano JSON. |
| `GL Account Nature` | `CE` per 0, `SP` per 1, altrimenti NULL | Enum nativo `Income/Balance` di BC. |
| `AL Account Nature` | `CE` per 0, `SP` per 1, altrimenti NULL | Campo `TZSI Income/Balance` dell'estensione HOTEL BACK OFFICE; valore enum, senza conversione in `CE`/`SP`. |

Anche i campi enum come `Account Type`, `Document Type` ed `Entry Type` mantengono il tipo/valore Business Central. Il loro formato non è stato normalizzato ai codici Option numerici eventualmente restituiti dal vecchio SQL NAV.

I consumer che si aspettano le vecchie stringhe devono convertire questi valori oppure aggiornare la logica di lettura per gestire booleani ed enum BC.

## Riferimenti nel progetto

- Query AL: [cartella Query](./Query/).
- Pubblicazione e nomi dei web service: [BIAppInstall.Codeunit.al](./Codeunit/BIAppInstall.Codeunit.al) e [BIAppUpgrade.Codeunit.al](./Codeunit/BIAppUpgrade.Codeunit.al).
- File sorgente NAV usato per il confronto: `C:\Users\lotgio\Downloads\Query Navision.txt`.
