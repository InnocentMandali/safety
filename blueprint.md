
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

*   **Authentication:** Secure user authentication is handled via Firebase, managed by an `AuthRepository` and a BLoC pattern (`AuthBloc`). The login and signup screens are fully implemented with error handling and loading states.
*   **Role-Based Access Control:** The UI dynamically adapts to the user's role (e.g., a regular user vs. an 'admin'), displaying certain features like the "Admin Dashboard" conditionally.
*   **Emergency Contacts:** Users can add, view, and manage a list of trusted emergency contacts. This feature is integrated with a local `sqflite` database for offline availability.
*   **Safety Tasks & Drills:** A dedicated section for users to engage with and complete safety-related tasks and drills.
*   **SOS Messaging:** Users can send a pre-defined SOS message, including their current GPS location, to all registered emergency contacts with a single tap.
*   **Central Dashboard:** The main `HomeScreen` acts as a central hub, offering clear navigation to all primary features of the application, including a prominent floating action button for the SOS feature.

## Current Task: Fix Authentication Flow

This task focused on fixing the authentication flow, including the login and signup screens.

### Plan and Steps Completed

1.  **Dependency Management:** Added the `firebase_auth` package to `pubspec.yaml`.
2.  **AuthRepository Correction:** Implemented the `signUpWithEmailAndPassword` method in the `AuthRepository`.
3.  **Signup Screen Correction:**
    *   Replaced direct calls to the data layer with BLoC event dispatches.
    *   Added error handling to display messages to the user on failed signup attempts.
    *   Added a loading indicator to provide visual feedback during the signup process.
4.  **Login Screen Correction:**
    *   Replaced direct calls to the data layer with BLoC event dispatches.
    *   Added error handling to display messages to the user on failed login attempts.
    *   Added a loading indicator to provide visual feedback during the login process.
5.  **BLoC Updates:**
    *   Updated `AuthState` to better handle authentication states (initial, loading, authenticated, unauthenticated).
    *   Updated `AuthBloc` to handle the new `signUpWithEmailAndPassword` method and the updated `AuthState` definitions.
    *   Updated `AuthEvent` to include the `signUpRequested` event.
6.  **Code Generation:** Ran `build_runner` to generate the necessary `freezed` files.
7.  **File Cleanup:** Deleted unused `user_bloc` files (`user_bloc.dart`, `users_bloc.freezed.dart`, `users_event.dart`, `users_state.dart`).
