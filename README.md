# Web-Based Room and Machine Management System

This repository contains a Java project for managing rooms and machines using a web-based interface created with JavaServer Pages (JSP). The project focuses on providing an efficient way to manage rooms and machines within an organization. This README provides an overview of the project and instructions for running it.

## Overview

The main goal of this project is to allow users to manage rooms and machines easily. It offers the following features:

- Create, read, update, and delete (CRUD) rooms and machines.
- Search for available machines in each room.

## Project Structure

The project is structured as follows:

1. **RoomMachineManagement**: This is the main project directory that contains the web application.
   - `src/main/java`: Java source files and packages.
   - `src/main/webapp`: JSP files and web resources.
   - `src/main/resources`: Configuration files, including Hibernate configuration.

## Prerequisites

Before running the project, make sure you have the following prerequisites:

- Java SE Development Kit (JDK)
- GlassFish Server
- MySQL database
- MySQL Connector/J (JDBC Driver) for database connectivity

## Running the Project

Follow these steps to run the project:

1. Clone this repository to your local machine.

2. Configure your MySQL database with the appropriate settings, and ensure the configuration matches what's defined in the Hibernate configuration file (`src/main/resources/hibernate.cfg.xml`).

3. Start the GlassFish server.

4. Access the application by opening a web browser and navigating to `http://localhost:8080/GMachine/machines.jsp`

5. You can now interact with the web-based interface to manage rooms and machines.

## Contributing

Contributions are welcome! If you'd like to improve or extend this project, feel free to create a pull request or open an issue.

## Author

- Mohamed Fezzazi

For questions or assistance, please contact me at fezzazimohamed22@gmail.com.

## Screenshots
<img width="960" alt="image" src="https://github.com/MaskedFezz/TpJSPServlet/assets/130797834/8691ce27-d936-4317-88ce-8771f9f717e9">
<img width="960" alt="image" src="https://github.com/MaskedFezz/TpJSPServlet/assets/130797834/1ab088ee-94a1-48dc-905c-169aa8521cd3">
<img width="960" alt="image" src="https://github.com/MaskedFezz/TpJSPServlet/assets/130797834/7eff0310-3424-4535-913e-5a2bcc185818">





