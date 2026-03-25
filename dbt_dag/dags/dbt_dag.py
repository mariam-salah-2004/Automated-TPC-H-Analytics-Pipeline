import os
from datetime import datetime
from pathlib import Path
from cosmos import DbtDag, ProjectConfig, ExecutionConfig, ProfileConfig 
from cosmos.profiles import SnowflakeUserPasswordProfileMapping


profile_config = ProfileConfig(
    profile_name="default", 
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_conn",
        profile_args={"database": "dbt_db", "schema": "dbt_schema"}
    )
)


project_config = ProjectConfig(
    dbt_project_path="/usr/local/airflow/dags/dbt_pipline"
)


dbt_snowflake_dag = DbtDag(
    project_config=project_config,       
    profile_config=profile_config, 
    operator_args={"install_deps": True},
    execution_config = ExecutionConfig(dbt_executable_path="/usr/local/bin/dbt" ),
    schedule="@daily",
    start_date=datetime(2026, 3, 25),
    catchup=False,
    dag_id="dbt_dag"
)