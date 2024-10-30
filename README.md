# Flutter Reels Application

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
   

2. **Add .env in the root directory**:   
      Add .env in the root directory, and and the same **reelsApiBaseUrl=example_base_url.com** , also mentioned in the .env.example you will find in the root directory.

1. **Simply Run**:
   Now Simply Run the application in application by running comand or the defualt running tool for you IDE
   ```bash
   flutter run    


---

## Generating Build


Generated Build is attached in the release section of this repository, under the **Debug-Build** **v1.0** , You can check the right side of the repo.

**NOTE:** This is the debug build thats why you may see large build size



---

## Sample Video

 [Sample Video]()

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
