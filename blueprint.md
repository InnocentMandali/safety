
# Blueprint: EmergenSync - A Personal Safety Companion

## Purpose and Capabilities

The EmergenSync application is a Flutter-based mobile app designed to enhance personal safety. It provides users with a suite of quick-access tools for emergency situations, robustly manages emergency contacts, and offers a clean, modern user interface that is easy to navigate under stress.

## Style, Design, and Features

This section outlines the implemented design principles and functional features of the application.

### Style & Design

*   **Material 3 Theming:** The app is built on the modern Material 3 design system (`useMaterial3: true`), ensuring up-to-date components and visual language.
*   **Dynamic Color Scheme:** A harmonious and accessible color palette is generated using `ColorScheme.fromSeed` with `Colors.deepPurple` as the primary seed color. This approach supports both light and dark modes automatically.
*   **Custom Typography:** The app uses the `google_fonts` package to create a distinct and readable typographic hierarchy:
    *   **Display Large:** `GoogleFonts.oswald` for prominent headlines.
    *   **Title Large:** `GoogleFonts.roboto` for section titles.
    *   **Body Medium:** `GoogleFonts.openSans` for general content.
*   **Consistent Component Styling:** Key UI components like `AppBar` and `ElevatedButton` have been themed centrally (`appBarTheme`, `elevatedButtonTheme`) to maintain a consistent look and feel across the entire application.
*   **Theme Management:** A `ThemeProvider`, built with the `provider` package, manages the application's theme state, allowing for seamless switching between light, dark, and system default modes.
*   **Interactive Theme Toggle:** The dashboard includes a user-facing control to instantly switch between light and dark themes, providing a personalized user experience.

### Core Features

*   **Authentication:** Secure user authentication is handled via Firebase, managed by an `AuthRepository` and a BLoC pattern (`AuthBloc`).
*   **Role-Based Access Control:** The UI dynamically adapts to the user's role (e.g., a regular user vs. an 'admin'), displaying certain features like the "Admin Dashboard" conditionally.
*   **Emergency Contacts:** Users can add, view, and manage a list of trusted emergency contacts. This feature is integrated with a local `sqflite` database for offline availability.
*   **Safety Tasks & Drills:** A dedicated section for users to engage with and complete safety-related tasks and drills.
*   **SOS Messaging:** Users can send a pre-defined SOS message, including their current GPS location, to all registered emergency contacts with a single tap.
*   **Central Dashboard:** The main `HomeScreen` acts as a central hub, offering clear navigation to all primary features of the application, including a prominent floating action button for the SOS feature.

## Current Task: Implement SOS Messaging Feature

This task focused on building the end-to-end SOS messaging functionality.

### Plan and Steps Completed

1.  **Dependency Management:** Added the `flutter_sms`, `permission_handler`, and `location` packages to `pubspec.yaml`.
2.  **SOS Screen Creation:**
    *   Developed the `SOSTriggerScreen` (`lib/src/features/sos/screens/sos_screen.dart`) which serves as the confirmation and activation page for the SOS alert.
    *   The UI includes a large, clear button to send the alert, and provides visual feedback (`CircularProgressIndicator`) during the sending process.
3.  **Permission Handling:** Implemented logic to request `Permission.sms` and `Permission.location` from the user before attempting to send the message. The flow handles cases where permissions are denied.
4.  **Location Fetching:** Integrated the `location` package to get the user's current latitude and longitude.
5.  **SMS Construction and Sending:**
    *   The SOS message is dynamically constructed to include a Google Maps link with the user's coordinates.
    *   It retrieves the list of recipients from the `EmergencyContactProvider`.
    *   The `flutter_sms` package is used to send the message directly.
6.  **Navigation and UI Integration:**
    *   Added a new route (`/sos`) in `app_router.dart` pointing to the `SOSTriggerScreen`.
    *   Added a `FloatingActionButton` on the `HomeScreen` for quick and prominent access to the SOS feature.
    *   Included a card in the main dashboard list for SOS as a secondary entry point.
7.  **User Feedback:** Implemented `SnackBar` notifications to inform the user about the status of the SOS message (sent successfully, failed, or permissions denied).

