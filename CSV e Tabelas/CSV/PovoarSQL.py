import csv
import mysql.connector

def create_connection():
    # Replace with your actual database connection details
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='<password>',
        database='LTR'
    )
    return connection

# Function to insert data into the 'Funcionário' table
def insert_funcionarios(connection):
    with open('Funcionários.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        cursor = connection.cursor()

        for row in reader:
            id = int(row['ID'])
            nome = row['Nome']
            data_nascimento = row['DataNascimento']
            genero = row['Género']
            area_residencia = row['ÁreaResidência']
            funcao = row['Função']
            email = row['Email']
            password = row['Password']
            supervisor = int(row['Supervisor']) if row['Supervisor'] else 'NULL'

            query = f"INSERT INTO `Funcionário` (`ID`, `Nome`, `DataNascimento`, `Género`, `ÁreaResidência`, `Função`, `Email`, `Password`, `Supervisor`) VALUES ({id}, '{nome}', '{data_nascimento}', '{genero}', '{area_residencia}', '{funcao}', '{email}', '{password}', {supervisor})"

            cursor.execute(query)

        connection.commit()
        print("Data inserted into 'Funcionário' table successfully.")

# Function to insert data into the 'Local' table
def insert_locais(connection):
    # Read the CSV file with semicolon delimiter
    with open('Locais.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Iterate over the rows of the CSV file
        for row in reader:
            id = int(row['ID'])
            nome = row['Local']
            valor_med_m2 = float(row['PM2'])
            valor_med_arrendar = float(row['PAM2'])

            # SQL query to insert data into the table
            query = f"INSERT INTO `Local` (`ID`, `Nome`, `ValorMedM2`, `ValorMedArrendar`) VALUES ({id}, '{nome}', {valor_med_m2}, {valor_med_arrendar})"

            # Execute the query
            cursor.execute(query)

        # Commit the changes to the database
        connection.commit()
        print("Data inserted into 'Local' table successfully.")

# Function to insert data into the 'Propriedade' table
def insert_propriedades(connection):
    # Read the CSV file with semicolon delimiter
    with open('Imóveis.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Iterate over the rows of the CSV file
        for row in reader:
            id = int(row['ID'])
            local = int(row['Local'])
            valor = float(row['Valor'])
            area = int(row['Area'])
            utilizacao = row['Utilizacao']

            # SQL query to insert data into the table
            query = f"INSERT INTO `Propriedade` (`ID`, `Local`, `Valor`, `Área`, `Utilização`) VALUES ({id}, {local}, {valor}, {area}, '{utilizacao}')"

            # Execute the query
            cursor.execute(query)

        # Commit the changes to the database
        connection.commit()
        print("Data inserted into 'Propriedade' table successfully.")

# Function to insert data into the 'Arrendatário' table
def insert_arrendatarios(connection):
    # Read the CSV file with semicolon delimiter
    with open('Arrendatários.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Iterate over the rows of the CSV file
        for row in reader:
            id = int(row['ID'])
            nome = row['Nome']
            data_nascimento = row['DataNascimento']
            genero = row['Género']
            area_residencia = row['ÁreaResidência']
            profissao = row['Profissão']

            # SQL query to insert data into the table
            query = f"INSERT INTO `Arrendatário` (`ID`, `Nome`, `DataNascimento`, `Género`, `ÁreaResidência`, `Profissão`) VALUES ({id}, '{nome}', '{data_nascimento}', '{genero}', '{area_residencia}', '{profissao}')"

            # Execute the query
            cursor.execute(query)

        # Commit the changes to the database
        connection.commit()
        print("Data inserted into 'Arrendatário' table successfully.")

# Function to insert data into the 'Proprietário' table
def insert_proprietarios(connection):
    # Read the CSV file with semicolon delimiter
    with open('Proprietários.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Iterate over the rows of the CSV file
        for row in reader:
            id = int(row['ID'])
            nome = row['Nome']
            data_nascimento = row['DataNascimento']
            genero = row['Género']
            area_residencia = row['ÁreaResidência']
            profissao = row['Profissão']

            # SQL query to insert data into the table
            query = f"INSERT INTO `Proprietário` (`ID`, `Nome`, `DataNascimento`, `Género`, `ÁreaResidência`, `Profissão`) VALUES ({id}, '{nome}', '{data_nascimento}', '{genero}', '{area_residencia}', '{profissao}')"

            # Execute the query
            cursor.execute(query)

        # Commit the changes to the database
        connection.commit()
        print("Data inserted into 'Proprietário' table successfully.")

# Function to insert data into the 'GerePropriedade' table
def insert_gere_propriedades(connection):
    # Read the CSV file with semicolon delimiter
    with open('GerePropriedades.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Iterate over the rows of the CSV file
        for row in reader:
            funcionario = int(row['Funcionário'])
            propriedade = int(row['Propriedade'])

            # SQL query to insert data into the table
            query = f"INSERT INTO `GerePropriedade` (`Funcionário`, `Propriedade`) VALUES ({funcionario}, {propriedade})"

            # Execute the query
            cursor.execute(query)

        # Commit the changes to the database
        connection.commit()
        print("Data inserted into 'GerePropriedade' table successfully.")

# Function to insert data into the 'Compra' table
def insert_compras(connection):
    # Read the CSV file with semicolon delimiter
    with open('Compras.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Iterate over the rows of the CSV file
        for row in reader:
            id = int(row['ID'])
            propriedade = int(row['Propriedade'])
            antigo_proprietario = int(row['AntigoProprietário'])
            novo_proprietario = int(row['NovoProprietario'])
            valor_aquisicao = float(row['ValorAquisicao'])
            data_aquisicao = row['DataAquisicao']

            # SQL query to insert data into the table
            query = f"INSERT INTO `Compra` (`ID`, `Propriedade`, `AntigoProprietário`, `NovoProprietário`, `ValorAquisição`, `DataAquisição`) VALUES ({id}, {propriedade}, {antigo_proprietario}, {novo_proprietario}, {valor_aquisicao}, '{data_aquisicao}')"

            # Execute the query
            cursor.execute(query)

        # Commit the changes to the database
        connection.commit()
        print("Data inserted into 'Compra' table successfully.")

# Function to insert data into the 'Arrendamento' table
def insert_arrendamentos(connection):
    # Read the CSV file with semicolon delimiter
    with open('Arrendamentos.csv', 'r') as file:
        reader = csv.DictReader(file, delimiter=';')
        
        # Create a cursor to execute SQL queries
        cursor = connection.cursor()

        # Iterate over the rows of the CSV file
        for row in reader:
            id = int(row['ID'])
            propriedade = int(row['Propriedade'])
            arrendatario = int(row['Arrendatário'])
            data_assinatura = row['DataAssinatura']
            duracao = int(row['Duração'])
            valor_mensal = float(row['ValorMensal'])

            # SQL query to insert data into the table
            query = f"INSERT INTO `Arrendamento` (`ID`, `Propriedade`, `Arrendatário`, `DataAssinatura`, `Duração`, `ValorMensal`) VALUES ({id}, {propriedade}, {arrendatario}, '{data_assinatura}', {duracao}, {valor_mensal})"

            # Execute the query
            cursor.execute(query)

        # Commit the changes to the database
        connection.commit()
        print("Data inserted into 'Arrendamento' table successfully.")

def insert_data():
    # Create a database connection
    connection = create_connection()

    # Insert data into each table
    insert_funcionarios(connection)
    insert_locais(connection)
    insert_propriedades(connection)
    insert_arrendatarios(connection)
    insert_proprietarios(connection)
    insert_gere_propriedades(connection)
    insert_compras(connection)
    insert_arrendamentos(connection)

    # Close the database connection
    connection.close()

# Execute the function to insert data
insert_data()

