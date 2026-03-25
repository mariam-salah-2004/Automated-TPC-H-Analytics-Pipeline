# Automated TPC-H Analytics Pipeline 🚀

An automated data engineering pipeline that extracts, transforms, and orchestrates data from **Snowflake** using **dbt** (Data Build Tool) and **Apache Airflow** (via Astronomer Cosmos).

## 🏗️ Architecture
The project follows a modular transformation approach (Staging, Intermediate, and Marts):
- **Source:** Snowflake Sample Data (TPC-H).
- **Staging:** Cleaned and standardized raw tables using `dbt_utils`.
- **Intermediate:** Pre-aggregated metrics and joined entities for performance.
- **Marts:** Business-ready Fact tables (`fact_orders`) for final analysis.
- **Orchestration:** Apache Airflow running in Docker via Astro CLI, using Cosmos to dynamically render dbt nodes as Airflow tasks.

## 🛠️ Tech Stack
* **Data Warehouse:** Snowflake ❄️
* **Transformation:** dbt (models, macros, generic tests).
* **Orchestration:** Apache Airflow (Cosmos).
* **Environment:** Docker & Astro CLI.
* **Language:** SQL & Python.

## 🌟 Key Features
* **Surrogate Keys:** Implemented `dbt_utils.generate_surrogate_key` for unique record identification in staging.
* **Custom Macros:** Developed a reusable `discounted_amount` macro for dynamic financial calculations.
* **Data Quality:** Integrated generic tests (`unique`, `not_null`, `relationships`, `accepted_values`) at both source and model levels.
* **RBAC & Infrastructure:** Snowflake environment setup scripts included for Roles, Warehouses, and Permissions (RBAC).
* **Automated DAGs:** Used `astronomer-cosmos` to automatically turn dbt models into an Airflow DAG without manual task definition.

## 📁 Project Structure
- `/models/staging`: Source declarations and initial cleaning.
- `/models/marts`: Final business models and intermediate logic.
- `/macros`: Reusable Jinja/SQL logic.
- `dbt_dag.py`: Airflow DAG configuration using Cosmos.

## 🚀 How to Run
1. Install [Astro CLI](https://www.astronomer.io/opensource/).
2. Setup Snowflake credentials in Airflow Connections (`snowflake_conn`).
3. Run `astro dev start`.
<img width="1233" height="490" alt="image" src="https://github.com/user-attachments/assets/9a479e85-1bd4-48c7-a5e4-61d543ca68d5" />
