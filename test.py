import mysql.connector

print("Starting the script...")

try:
    print("Attempting to connect to the database...")
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="12345",  # Replace with your MySQL root password
        database="test_db",
        port=3306  # Explicitly specifying the port
    )
    print("Connection successful!")  # Only prints if connection is successful
    
    # Run a simple query to verify
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM test_table;")
    results = cursor.fetchall()
    print("Data from test_table:", results)
    
    cursor.close()
    connection.close()
    print("Connection closed.")
except mysql.connector.Error as err:
    print("MySQL Error:", err)  # Catches specific MySQL errors
except Exception as e:
    print("An unexpected error occurred:", e)  # Catches other types of errors
finally:
    print("Script has completed.")
