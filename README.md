Bynry Case Study Documentation
Backend
The main repository contains two folders:

Backend: Contains the backend code.
Frontend: Contains the frontend code.
Starting Backend:
Navigate to the backend folder: cd backend.

Inside the backend folder, locate the config folder which contains the middleware for the database connection.


Adjust the credentials in the config.js file according to your local MySQL database:
module.exports = {
  HOST: "localhost",
  USER: "root",
  PASSWORD: "root",
  DB: "Bynry", <--  add the name of the database where you want to sequalize the model
  dialect: "mysql", 
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};


Run the backend server by typing npm run server in the terminal.

The server should now be running. Node.js version used: v20.11.0.

Running Frontend:
Note: The frontend is written in Flutter.

Ensure you have Flutter installed, version details:

Flutter 3.16.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 46787ee49c (5 weeks ago) • 2024-01-09 14:36:07 -0800
Engine • revision 3f3e560236
Tools • Dart 3.2.3 • DevTools 2.28.4

Resolve all dependencies by running flutter pub get.

Connect a physical Android device with USB debugging enabled, or set up an Android emulator.

Navigate to the hamburger section in VS Code and go to Run -> Run without debugging, or type flutter run in the terminal.

Functionalities Added:


Backend:
Complete MVC structured backend.
Utilizes MySQL database.
Middleware layer for database connectivity.
User registration and login based on random OTP.
GET API to fetch user data and display it on the frontend homepage.
Sequelize and Express are used for ensuring database integrity.



Frontend:
State management using GetX.
Utilizes both stateless and stateful widgets.
Implements Firebase Analytics for insights into the app's usage.
Initial plan to display Firebase Analytics specific to the user, but direct API access isn't available.
Uses the https package for making requests.
Implements a common color palette file for centralized theming.
Implements common Snackbar and TextStyle files for consistency.
Implements a robust drawer on the landing page, along with tab navigation for the homepage (may have minor layout issues to resolve).