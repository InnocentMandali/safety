
# Task Manager App Blueprint

## Overview

This document outlines the plan for creating a task manager application. The app will allow users to create, view, and manage their tasks.

## Features

*   Add new tasks with a title and description.
*   View a list of all tasks.
*   Mark tasks as complete.
*   Delete tasks.
*   A modern and visually appealing user interface.
*   Light and dark theme support.

## Project Structure

*   `lib/main.dart`: The main entry point of the application.
*   `lib/providers/task_provider.dart`: State management for tasks.
*   `lib/models/task.dart`: The data model for a task.
*   `lib/screens/task_screen.dart`: The main screen that displays the list of tasks.
*   `lib/widgets/add_task_dialog.dart`: A dialog for adding new tasks.
*   `lib/theme/theme.dart`: The application's theme.

## Current Plan

1.  **Create `blueprint.md` file:** Document the project's purpose, features, and design.
2.  **Add dependencies:** Add `provider` and `google_fonts` to `pubspec.yaml`.
3.  **Create the main app structure:** Set up `main.dart` with a `ThemeProvider` and a basic `MaterialApp`.
4.  **Create `Task` model:** Define the `Task` class.
5.  **Create `TaskProvider`:** Implement the state management for tasks.
6.  **Create the UI:** Build the `TaskScreen` and `AddTaskDialog`.
7.  **Implement UI logic:** Connect the UI to the `TaskProvider`.
8.  **Apply styling:** Implement a modern theme.
