# Flutter Reels Application -> Complete app with Drift Database and settings page. 
- Drift db used to save user wishlist and liked content
- Added settings page to access wishlist and liked content list.

## Overview
This Flutter application fetches and displays video data from an API, mimicking the reels experience with smooth scrolling and pagination. The app is designed with clean architecture, separating UI and business logic, and includes features like lazy loading, error handling, and more.

### Key Features:
- **API Integration**: Fetches data from an API using http package.
- **Lazy Loading & Pagination**: Loads more videos as the user scrolls, with pagination implemented in both the reels menu and the reels playing screens.
- **Error Handling**: Handles errors gracefully during API requests and JSON parsing.
- **State Management**: Utilizes the BLoC pattern for managing states efficiently.
- **Dependency Injection**: Uses `get_it` for managing dependencies.
- **Clean Architecture**: Follows modular architecture for better code organization and separation of concerns.

---

## Installing Code

1. **Clone the repository**:
   ```bash
   git clone git@github.com:PradipDhanraj/flutter-social-media-ui.git

1. **Simply Run**:
   Now Simply Run the application in application by running comand or the defualt running tool for you IDE.
   Run the application from VSCODE RUN AND DEBUG option, launch.json will have all the neccessary secret environmental variables.

   OR

   ```bash
   flutter run --dart-define isMock=false --dart-define url=https://api.ulearna.com
---

## Generating Build

Generated Build is attached in the release section of this repository, under the **Debug-Build** **v1.0** , You can check the right side of the repo.

**NOTE:** This is the debug build thats why you may see large build size

---

## Sample Video

 [Sample Video](https://streamable.com/4qfayr)

---

## Tech Stack

- **Flutter**: Framework for cross-platform mobile development.
- **http**: For making HTTP requests, offering clean code with rich annotations.
- **get_it**: Dependency injection for managing dependencies.
- **BLoC**: Business Logic Component for state management.
- **Dart JSON Decoding**: For parsing JSON data retrieved from the API.

---

## Screens

### 1. **Reels Menu Screen**
   - Displays a list of videos.
   - Implements pagination and lazy loading.

### 2. **Reels Playing Screen**
   - Full-screen video playing experience.
   - Pagination is applied to load more videos as the user scrolls down.

---

## Folder Structure

The project uses a **modular architecture** for better scalability and code management

## Generate app icon
   Add icon image in assets folder
      assets/icon/<ADD-YOUR_ICON>
   also update path in pubspec.yaml   
  ```bash
   flutter pub run flutter_launcher_icons  