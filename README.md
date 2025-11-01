# Banking DB (SQLite Version)

This project is a small banking database modeled originally for Oracle LiveSQL and ported to **SQLite**. It contains:

1. **Schema** – all tables and relationships
2. **Sample data** – branches, employees, clients, accounts, loans…
3. **Reporting queries** – example business queries (“functional requirements”)
4. **Maintenance script** – periodic updates/cleanups (salary raise, delete inactive accounts, extend loan offers…)

---

## 📁 Project Structure

```text
.
├── 01_schema.sql         # CREATE TABLE ... (SQLite-ready)
├── 02_sample_data.sql    # INSERT + initial UPDATEs
├── 03_queries.sql        # SELECT reports / functional requirements
├── 04_maintenance.sql    # UPDATE / DELETE business rules
└── README.md
