# Emergency Alert App Blueprint

## Overview

This document outlines the plan, features, and design for a Flutter-based emergency alert application. The app will allow users to manage emergency contacts, trigger alerts via a panic button or shake detection, and send SMS notifications with GPS location to those contacts. All alert events will be logged to Firestore. An admin dashboard will provide capabilities for viewing, managing, and exporting these alert logs.

## Current Plan

The current development focuses on building the following features:

1.  **Firebase Authentication**: Implement user sign-up and login with email and password. User profiles will include name, phone number, and a role (user/admin).
2.  **Emergency Contact Management**: Allow authenticated users to perform CRUD (Create, Read, Update, Delete) operations on their list of emergency contacts.
3.  **Shake Detection & SMS Alerts**: Integrate phone shake detection to automatically trigger an SOS alert. This will fetch the user's emergency contacts, get the current GPS location, and compose an SMS message with a map link.
4.  **GPS & Location Services**: Capture latitude, longitude, and timestamp for each alert.
5.  **Firebase Logging**: Store detailed records of every triggered alert in a dedicated Firestore collection (`/alerts/`).
6.  **Admin Dashboard**: Create a section of the app, accessible only to admins, for viewing, filtering, and managing all emergency alerts.
7.  **Panic Button**: Add a manual trigger on the home screen for immediate SOS activation.

## Design and Style

*   **Color Palette**: A clear, accessible color scheme will be used, prioritizing high contrast for emergency functions.
*   **Typography**: The 'Inter' font from Google Fonts will be used for its modern and neutral appearance.
*   **Iconography**: Material Design icons will be used for clarity and recognizability.
*   **Layout**: The layout will be clean and intuitive, with a focus on ease of use, especially for emergency-related actions.
*   **Animation**: Subtle animations will be incorporated to provide feedback for actions like sending alerts or updating data.

