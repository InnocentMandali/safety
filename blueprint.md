# Emergency Alert App Blueprint

## Overview

This document outlines the plan, features, and design for a Flutter-based emergency alert application. The app allows users to manage emergency contacts, trigger alerts via shake detection, and send SMS notifications with GPS location to those contacts. All alert events are logged to Firestore, and an admin dashboard provides capabilities for viewing these alert logs.

## Implemented Features

*   **Firebase Authentication**: User sign-up and login with email and password.
*   **Emergency Contact Management**: Authenticated users can add, view, and delete their emergency contacts. Contact information is stored and retrieved from Firestore.
*   **Shake Detection & SMS Alerts**: The app detects phone shakes to automatically trigger an SOS alert. It retrieves the device's current GPS location and opens the default SMS application with a pre-filled message containing a Google Maps link to the user's location.
*   **Firebase Logging**: Every triggered alert is logged as a new document in a dedicated Firestore collection (`/alerts/`). Each log includes the user's ID, a timestamp, and the geographic location (latitude and longitude) of the alert.
*   **Admin Dashboard**: A dedicated screen, accessible to administrators, displays a real-time list of all emergency alerts from Firestore. It shows the user ID and timestamp for each alert and includes a button to open the location directly in Google Maps.
*   **Navigation**: A button on the home screen provides easy access to the emergency contacts management screen.

## Design and Style

*   **Color Palette**: A clear, accessible color scheme is used, prioritizing high contrast for emergency functions.
*   **Typography**: The app uses the default system fonts for a native look and feel.
*   **Iconography**: Material Design icons are used for clarity and recognizability (e.g., logout, theme toggle, delete, location).
*   **Layout**: The layout is clean and intuitive, with a focus on ease of use, especially for emergency-related actions.
*   **Themeing**: The app supports both light and dark modes, with a theme toggle button in the app bar.
