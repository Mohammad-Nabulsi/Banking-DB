import streamlit as st
import sqlite3
import pandas as pd

conn = sqlite3.connect("banking.db")
cursor = conn.cursor()

# Session state to trigger refresh
if "refresh" not in st.session_state:
    st.session_state.refresh = 0

# Fetch table names dynamically
cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")
tables = [row[0] for row in cursor.fetchall()]

choice = st.sidebar.selectbox("Select a Table", tables, key="table_select")

# Query input
query = st.text_area("Enter your SQL query:")

if st.button("Run Query"):
    try:
        if query.strip().lower().startswith("select"):
            df = pd.read_sql_query(query, conn)
            st.dataframe(df)
        else:
            cursor.execute(query)
            conn.commit()
            st.success("✅ Query executed successfully.")

            # Increase refresh counter to force rerun
            st.session_state.refresh += 1

    except Exception as e:
        st.error(f"❌ Error: {e}")

# Always display current table
df = pd.read_sql_query(f"SELECT * FROM {choice}", conn)
st.dataframe(df)
