# Bike-Rental-System
First year projecct combilned by me later on , a project that is done separately from branches . Now merged by me

Prerequisites
    1. JDK 22: Ensure you have Java 22 installed on your system.
    2. Apache Tomcat 10.1.x: Download Tomcat 10.1 (Core zip/installer). This version is required for Jakarta EE 10 (Servlet 6.0).
    3. IntelliJ IDEA Ultimate: While possible in Community with plugins, Ultimate is highly recommended for built-in Jakarta EE and Tomcat support.

Step 1: Open the Project in IntelliJ
    1. Open IntelliJ IDEA.
    2. Select File > Open.
    3. Navigate to the project root directory: c:\Users\Janidu\Documents\GitHub\Bike-Rental-System MyOne.
    4. Select the pom.xml file and click Open.
    5. Choose Open as Project.

Step 2: Configure Project SDK
    1. Go to File > Project Structure (or press Ctrl+Alt+Shift+S).
    2. Under Project, set the SDK to 22.
    3. If not listed, click Add SDK > Download JDK and select version 22.
    4. Set the Project language level to 22 - Record patterns, etc.
    5. Click Apply.

Step 3: Add Apache Tomcat Server
    1. Go to the top right of the IDE and click Add Configuration... (or Edit Configurations...).
    2. Click the + (Add New Configuration) and search for Tomcat Server > Local.
    3. In the Server tab:
        1. Click Configure... next to the "Application server" dropdown.
        2. Select your Tomcat home directory (the folder where you extracted Tomcat 10.1).
        3. Click OK.

Step 4: Configure Deployment Artifact
    1. In the same Run/Debug Configurations window, switch to the Deployment tab.
    2. Click the + icon at the bottom and select Artifact...
    3. Select PGNO-55_Bike-Rental-System:war exploded.
    4. (Optional) Set the Application context to / or /bike-rental to simplify the URL.
    5. Click OK.

Step 5: Run the Project
    1. Click the Green Play button in the top right corner.
    2. IntelliJ will build the project using Maven and start Tomcat.
    3. Once started, your browser should automatically open to http://localhost:8080/.