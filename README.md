# Cricket Matrix

## Included Files:
- `Cricket_Database_dump.sql`: SQL script to restore the complete database.
- `Sub-directory/`: Contains CSV data, SQL creation and loading scripts, queries and problematic_queries along with a README file.
- `Cricket_Matrix_demo_video`: Includes demo of the project with instructions.
- `phase2_report` : Report of the phase 2 project
- `FINAL_Website/`: Contains the components of the web application:
   - `app.py`: Main file for running the web application.
   - `conversion.py`: Handles database connections.
   - `Images/`: Directory for images used in the website.
   - `queries.py`: SQL queries used in the web application.

### Database Setup:
- **Database Name:** `<your_database_name>`
- **Username:** `<your_username>`
- **Password:** `<your_password>`

### SQL Scripts:
- `create.sql`: Establishes the database schema.
- `load.sql`: Populates the database with data from CSV files.

### Execution Steps:
1. Run `create.sql` to set up the database schema.
2. Run `load.sql` to import data into the database.

### Queries:
- Use `queries.sql` for data analysis and retrieval.

## Dependencies:
The web application relies on several Python libraries:
- **Python (>=3.12)**
- **pandas (>=1.0.0)**
- **numpy (>=1.18.0)**
- **psycopg2 (>=2.8.6)**
- **streamlit (>=0.79.0)**
- **st_aggrid (>=0.3.0)**
- **pickle (>=4.0.0)**

### Installation:
To install the required dependencies, use the command:

- `pip install pandas numpy psycopg2 streamlit st_aggrid`


## Usage Notes:
- `Update the database connection details (name, username, password) in the application scripts`.

## Running the Website:
- Start the web application with:
- `streamlit run app.py`


