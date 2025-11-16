# EmergenSync Blueprint

## Overview

EmergenSync is a Flutter-based mobile application designed to enhance personal safety by providing a quick and easy way to send emergency alerts to pre-selected contacts. The app allows users to trigger an alert by either pressing a panic button or shaking their device. When an alert is triggered, the app sends an SMS message containing a customizable message and the user's current location to their emergency contacts.

## Features

- **Panic Button:** A prominent on-screen button to manually trigger an emergency alert.
- **Shake to Alert:**  Users can shake their phone to send an alert without needing to unlock the device or open the app.
- **Location Sharing:** The emergency SMS automatically includes a link to the user's current location on Google Maps.
- **Customizable Emergency Message:** Users can define a custom message to be sent in the emergency SMS.
- **Emergency Contact Management:** Users can add, view, and delete emergency contacts from their phone's contact list.
- **User Authentication:** Secure user sign-up and login functionality using Firebase Authentication.
- **Cloud Data Storage:** Emergency contacts and alert logs are securely stored in Cloud Firestore.
- **Admin Dashboard:** A dedicated screen for administrators to view a log of all alerts sent by users.

## Design and Styling

- **Theme:** The app uses a modern Material 3 design with a custom color scheme based on a deep purple seed color. It supports both light and dark modes.
- **Typography:** The `google_fonts` package is used to implement a consistent and visually appealing typography scheme with the Oswald, Roboto, and Open Sans fonts.
- **Layout:** The UI is designed to be clean, intuitive, and easy to navigate, with a focus on user experience.

## Current Task: Fix Simultaneous Permission Requests

**Plan:**

1.  **Analyze the Issue:** The user has reported an error message, "Can request only one set of permissions at a time," which indicates that multiple permission requests are being triggered simultaneously. This is likely due to the `location` and `flutter_contacts` packages requesting permissions at the same time.

2.  **Isolate the Conflicting Code:** The conflict arises because the `location` package requests permission in the `initState` of the `HomeScreen`, while the `flutter_contacts` package requests permission when the user tries to add an emergency contact.

3.  **Refactor Permission Requests:** To resolve this, I will move the location permission request from the `initState` of the `HomeScreen` to the `_sendAlert` function. This will ensure that the location permission is only requested when it is actually needed, preventing the simultaneous permission request conflict.

4.  **Verify the Fix:** After refactoring the code, I will review both the `home_screen.dart` and `emergency_contacts_screen.dart` files to ensure that the permission requests are now handled correctly and that the app's functionality is not compromised.