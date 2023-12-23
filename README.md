# Flutter Starter Project with Repository Pattern

## Project Overview

This Flutter project serves as a starter template for building mobile applications with a repository pattern. It focuses on currency exchange, allowing users to exchange money to other currencies at their own terms.

## Features

- **State Management**: Utilizes the `get` package for efficient state management.
- **Dependency Injection**: Implements dependency injection for better code organization.
- **Routing**: Uses the `get` package for smooth and easy navigation within the app.
- **Firebase Services**: Integrates Firebase Core, Authentication, and Messaging for backend services.
- **Local Storage**: Utilizes the `get_storage` package for efficient local data storage.
- **HTTP Requests**: Handles HTTP requests using the `dio` package for network operations.
- **JSON Parsing**: Incorporates the `json_annotation` and `freezed_annotation` packages for JSON parsing.
- **Splash Screen**: Implements a splash screen using the `flutter_native_splash` package.
- **App Package Name & Icon**: Utilizes `change_app_package_name` and `flutter_launcher_icons` packages for customizing the app package name and icon.
- **Model Generation**: Uses the `freezed` and `json_serializable` packages for generating models.

## Getting Started

Follow these steps to set up and run the project:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/ETdvlpr/flutter-starter.git
    ```

2. **Change into the project directory:**

    ```bash
    cd flutter-starter
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## Additional Commands

- **Change App Package Name:**

    ```bash
    flutter pub run change_app_package_name:main com.flutter_app.app
    ```

- **Change App Icon:**

    ```bash
    flutter pub run flutter_launcher_icons
    ```

- **Generate Models:**

    ```bash
    dart run build_runner build
    ```

## Contributing

This project is mainly for personal use, but if 
Feel free to contribute to this project by opening issues or creating pull requests. Your feedback and contributions are highly appreciated.
