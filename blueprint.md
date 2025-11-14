# EmergenSync Blueprint

## Overview

EmergenSync is a personal safety application that allows users to send emergency alerts with their location to predefined contacts. The app also includes an admin dashboard to monitor all alerts and manage users in real time.

## Features

-   **User Authentication:** Users can sign up and sign in using their email and password.
-   **Panic Button:** A prominent panic button on the home screen allows users to send an emergency SMS with their current location to their saved contacts.
-   **Shake to Alert:** Users can also trigger an alert by shaking their phone.
-   **Emergency Contact Management:** Users can select emergency contacts directly from their phone's contact list. These contacts are stored securely and used for sending alerts.
-   **Admin Dashboard:** A real-time, tabbed dashboard for administrators to:
    -   Monitor all incoming alerts with user ID, timestamp, and a link to the location on a map.
    -   View a list of all registered users.
    -   Delete users from the system (including a confirmation dialog).
-   **Settings:** A settings screen where users can change the app's theme and log out.
-   **Customizable Emergency Message:** Users can customize the message sent to their emergency contacts. The message supports a `[location]` placeholder that is replaced with the user's current location.

## Style and Design

-   **Theme:** The app uses a modern, Material 3 design with a custom color scheme based on a deep purple seed color. It supports both light and dark modes.
-   **Typography:** The app uses the Oswald, Roboto, and Open Sans fonts from Google Fonts to create a clear and readable text hierarchy.
-   **UI Components:** The app uses a variety of Material components, including buttons, app bars, tab bars, and list tiles, all styled to match the app's theme.
-   **Layout:** The layout is clean and intuitive, with a focus on ease of use, especially in emergency situations.

## Recent Updates (v1.2)

-   **Customizable Emergency Message:**
    -   Added a new section in the settings screen to allow users to customize their emergency message.
    -   The app now uses the custom message when sending alerts, replacing `[location]` with the user's coordinates.
-   **Admin Portal Enhancement:**
    -   Implemented a tabbed interface to separate "Alerts" and "Users".
    -   Added a "Users" tab that displays a list of all registered users.
    -   Implemented functionality for administrators to delete users from the system.
-   **Emergency Contact Integration:**
    -   Integrated the `flutter_contacts` package to allow users to pick emergency contacts from their phone's native contact list.
    -   Integrated the `telephony` package to send SMS alerts directly to all saved emergency contacts when the panic button is pressed or the phone is shaken.

## Future Enhancements

-   **Real-Time Alert Tracking:** Implement a feature for admins to see the live location of a user after an alert has been triggered.
-   **Admin Notifications:** Add in-app or push notifications for administrators when a new emergency alert is created.
-   **User Profile:** Create a user profile screen where users can view and update their information.
-   **Enhanced Security for Admin Actions:** Move sensitive admin operations, like user deletion, to a secure backend Cloud Function instead of performing them on the client side.
