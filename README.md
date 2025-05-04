# Flutter Application

## Project Overview

This Flutter application follows a clean architecture pattern with a well-organized folder structure. It includes features for authentication, data management, and UI components.

## Folder Structure

```
lib/
├── core/                  # Core functionality used across the app
│   ├── data/              # Data handling logic
│   │   ├── database/      # Local database implementations
│   │   ├── datasources/   # Data sources (remote and local)
│   │   ├── enums/         # Enumerations for data models
│   │   ├── memory/        # In-memory data storage
│   │   └── network/       # Network-related implementations
│   ├── di/                # Dependency injection
│   │   ├── core_di.dart   # Core dependency injection
│   │   ├── di_config.dart # Dependency injection configuration
│   │   └── mappers.dart   # Model mappers
│   ├── managers/          # Service managers
│   ├── platform/          # Platform-specific implementations
│   ├── presentation/      # Common UI components
│   └── utils/             # Utility functions and helpers
├── features/              # Feature modules
│   ├── auth/              # Authentication feature
│   │   ├── data/          # Auth data layer
│   │   ├── domain/        # Auth business logic
│   │   └── presentation/  # Auth UI components
│   └── other features...
│
├── main-production.dart   # Production entry point
├── main-staging.dart      # Staging entry point
```

## Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/Henrydykee/sample_project.git
   ```

2. Navigate to the project folder:
   ```
   cd yourrepository
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the application:
   ```
   # For development
   flutter run -t lib/main-staging.dart
   
   # For production
   flutter run -t lib/main-production.dart
   ```

## Project Architecture

This project follows a modified clean architecture approach with:

- **Features**: Separate modules for different app features
- **Core**: Shared functionality used across the app
- **Dependency Injection**: For managing dependencies throughout the app
- **Service Managers**: For handling external services and device capabilities

## Environment Configuration

The project uses a single `.env` file to manage environment variables. 
   ```
STAGING_BASE_URL = 
PROD_BASE_URL =  
   ```

Two entry points allow switching between environments:
- `main-staging.dart` for development
- `main-production.dart` for production

To run the app:
```
# For staging
flutter run -t lib/main-staging.dart

# For production
flutter run -t lib/main-production.dart
```


## Contributing

Please follow the project's coding standards and architecture patterns when contributing new features or fixes.
