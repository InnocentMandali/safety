
# Project Blueprint: Safety Companion App

## Overview

The Safety Companion is a Flutter application designed to enhance personal safety by providing a suite of easy-to-access tools for emergency situations.

## Features

### Core Features:
- **Emergency Contacts:** Manage a list of contacts to be notified in case of an emergency.
- **SOS Messaging:** Send a predefined SOS message, including the user's current location, to emergency contacts.
- **Fake Call:** Simulate an incoming call to discreetly exit uncomfortable situations.
- **Emergency Siren:** Activate a loud siren to attract attention and deter potential threats.
- **Flashlight:** Quickly access the device's flashlight.

### Technical Implementation Plan:

- **State Management:** Use `provider` for state management.
- **Navigation:** Use `go_router` for declarative navigation.
- **Local Storage:** Use `sqflite` for persisting emergency contacts.
- **Permissions:** Use `permission_handler` to request necessary permissions (SMS, Location, Contacts).
- **Location:** Use the `location` package to get the user's current location.
- **SOS:** Use `flutter_sms` to send SMS messages.
- **Siren:** Use `audioplayers` to play the siren sound.
- **Flashlight:** Use `torch_light` to control the flashlight.

## Current Task: Initial Setup

- Create the basic project structure.
- Implement the main screen with a dashboard layout.
- Add necessary dependencies to `pubspec.yaml`.
- Create the `Emergency Contacts` feature, including the model, service, provider, and screens for adding and listing contacts.
