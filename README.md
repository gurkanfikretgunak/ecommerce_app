
## ShopApp - Flutter E-Commerce Application

## Overview

ShopApp is an e-commerce application that allows users to browse products, view details, add items to cart, and complete purchases. The project consists of a core UI kit with reusable widgets and a complete shopping application built using Flutter and Supabase.

## Design

The application follows a clean, modern design inspired by a template from Figma Community. The UI design prioritizes user experience with an intuitive layout and pleasant aesthetics.

https://www.figma.com/community/file/1305009210349128805

## Technologies Used
- **Framework:** Flutter - an open-source mobile application development framework developed by Google
- **Language:** Dart
- **SDK:** Flutter SDK version 3.5.3+
- **State Management:** flutter_bloc (Cubit pattern)
- **Backend & Authentication:** Supabase, Firebase for authentication and notifications
- **API Integration:** Retrofit, Dio for network requests
- **Configuration:** flutter_flavor, flutter_dotenv
- **Local Storage:** shared_preferences, Hive for local database
- **Notifications:** Firebase Messaging, OneSignal
- **Routing:** auto_route for navigation
- **UI Elements:** Custom widgets from ShopApp UI Kit, with support for Google Maps integration

## Features

- User registration and login system
- Product browsing and filtering
- Product detail view with color and size selection
- Shopping cart functionality
- Wishlist for saving favorite products
- Order creation and checkout process
- Payment method management
- Order history and tracking
- User profile and settings
- Product ratings and reviews
- Multiple language support


## Project Structure

### File Structure
```
📦lib
 ┣ 📂src
 ┃ ┣ 📂constants
 ┃ ┣ 📂extensions
 ┃ ┗ 📂widgets
 ┃   ┣ 📂animation
 ┃   ┣ 📂appbar
 ┃   ┣ 📂banners
 ┃   ┣ 📂buttons
 ┃   ┣ 📂headers
 ┃   ┣ 📂inputs
 ┃   ┣ 📂labels
 ┃   ┣ 📂layout
 ┃   ┣ 📂modals
 ┃   ┣ 📂sliders
 ┃   ┗ 📂texts
 ┗ 📜shoapp_ui_kit.dart
```

"constants" folder contains the application constants such as colors, text styles, and dimensions.
"extensions" folder contains extension methods used throughout the application.
"widgets" folder contains reusable UI components organized by their purpose.
- The "animation" subfolder contains loading and ripple animations.
- The "appbar" subfolder contains custom app bars for different screens.
- The "banners" subfolder contains banner components for promotions.
- The "buttons" subfolder contains various button styles.
- The "headers" subfolder contains header components for screens.
- The "inputs" subfolder contains input fields, selectors, and form elements.
- The "labels" subfolder contains text labels and display components.
- The "layout" subfolder contains layout structures (rows, columns, grids).
- The "modals" subfolder contains modal dialogs and bottom sheets.
- The "sliders" subfolder contains carousel and page sliders.
- The "texts" subfolder contains text styles and components.
"shoapp_ui_kit.dart" is the main export file that makes all components available to the main application.

### Main Application Structure
```
📦lib
 ┣ 📂app
 ┃ ┣ 📂l10n
 ┃ ┣ 📂route
 ┃ ┗ 📂views
 ┃   ┣ 📂account
 ┃   ┣ 📂addresses
 ┃   ┣ 📂auth
 ┃   ┃ ┣ 📂signin
 ┃   ┃ ┗ 📂signup
 ┃   ┣ 📂cart
 ┃   ┣ 📂categories
 ┃   ┣ 📂categorie_products
 ┃   ┣ 📂checkout
 ┃   ┣ 📂filter
 ┃   ┣ 📂home
 ┃   ┣ 📂language
 ┃   ┣ 📂mainpage
 ┃   ┣ 📂notification
 ┃   ┣ 📂onboarding
 ┃   ┣ 📂order
 ┃   ┣ 📂payment
 ┃   ┣ 📂product
 ┃   ┣ 📂profile
 ┃   ┣ 📂search
 ┃   ┣ 📂splash
 ┃   ┗ 📂wishlist
 ┣ 📂core
 ┃ ┣ 📂cubits
 ┃ ┃ ┣ 📂auth
 ┃ ┃ ┣ 📂cart
 ┃ ┃ ┣ 📂categories
 ┃ ┃ ┣ 📂home
 ┃ ┃ ┣ 📂notification
 ┃ ┃ ┣ 📂product
 ┃ ┃ ┣ 📂wishlist
 ┃ ┃ ┗ 📜multi_bloc.dart
 ┃ ┣ 📂gen
 ┃ ┗ 📂network
 ┃   ┣ 📂models
 ┃   ┣ 📂repository
 ┃   ┗ 📂services
 ┃     ┣ 📂api
 ┃     ┣ 📂auth
 ┃     ┗ 📂deeplink
 ┣ 📂flavors
 ┃ ┣ 📜main_dev.dart
 ┃ ┣ 📜main_prod.dart
 ┃ ┗ 📜main_qa.dart
 ┣ 📂gen
 ┗ 📜main.dart
```

"app" folder contains the UI layer of the application.
- The "l10n" subfolder contains localization files that enable the application to be used in different languages.
- The "route" subfolder contains route definitions for navigation between screens.
- The "views" subfolder contains screen implementations, with each screen in its own subfolder.

"core" folder contains the business logic and data layers.
- The "cubits" subfolder contains state management components using the Cubit pattern.
- The "gen" subfolder contains generated code.
- The "network" subfolder contains data access components including models, repositories, and services.

"flavors" folder provides configurations for running the application in different environments.
- The "main_dev.dart", "main_prod.dart", and "main_qa.dart" files contain environment-specific configurations.

"gen" folder contains generated code for assets and other resources.

"main.dart" is the application's entry point.

## Installation & Setup

### Prerequisites
- Flutter SDK version 3.5.3 or higher
- Dart SDK
- Android Studio or VS Code with Flutter extension

### Getting Started

1. Clone the repository:

```bash
git clone https://github.com/gurkanfikretgunak/shopapp_widgets.git
```

2. Navigate to the project directory and install dependencies:

```bash
cd shopapp_widgets
flutter pub get
```

3. Run the application:

```bash
flutter run
```

### Supported Platforms

This project currently supports:
- Android
- Web

## Screenshots

![image](https://github.com/user-attachments/assets/5cd1b72f-b358-46a3-98e8-49767168aedb)
![image](https://github.com/user-attachments/assets/269eeb14-8d39-4a72-91d1-f063851f0583)
![image](https://github.com/user-attachments/assets/bbc716d9-a56c-4eec-9d73-15776d6315eb)
![image](https://github.com/user-attachments/assets/c9730c31-5fe6-4b77-b15e-a8f0bb0b66b5)
![image](https://github.com/user-attachments/assets/9e870927-dd91-4cdd-bb1f-ed47c3ca1bb6)
![image](https://github.com/user-attachments/assets/091c68ca-b6d8-4509-9447-8553ca0bf9fc)
![image](https://github.com/user-attachments/assets/63a1a9e0-6770-4eed-9c7b-07bc5c713c24)
![image](https://github.com/user-attachments/assets/4154935e-8341-4761-bc03-770235a341f6)



The application features a clean, modern design with an intuitive user interface. Key screens include:

### Authentication
- **Sign In/Sign Up**: Clean and user-friendly authentication screens with social login options
- **Onboarding**: Stylish introduction screens showcasing the app's features

### Main Screens
- **Home**: Featured products, categories, and promotions with elegant carousel sliders
- **Product Details**: Detailed product views with color/size selection and product information
- **Categories**: Browse products by various categories with filterable options

### Shopping Experience
- **Shopping Cart**: Easy-to-use cart with quantity adjustment and checkout options
- **Wishlist**: Save favorite items for later with simple toggling
- **Search**: Intuitive search functionality with filters and suggestions
- **Checkout**: Streamlined checkout process with address and payment management

### User Account
- **Profile**: User information management and settings
- **Orders**: Track current and past orders
- **Notifications**: Stay updated with promotions and order status

*Screenshots can be added to this section to showcase the app's UI.*

## Packages Used
| **Package**                          | **Description**                                                                                         |
|--------------------------------------|---------------------------------------------------------------------------------------------------------|
| `google_fonts: ^4.3.1`               | For using Google Fonts in the application                                                               |
| `smooth_page_indicator: ^1.2.0+3`    | For page indicators in onboarding screens                                                               |
| `simple_ripple_animation: ^0.1.0`    | For ripple animation effects                                                                            |
| `loading_animation_widget: ^1.3.0`   | For loading animations                                                                                  |
| `font_awesome_flutter: ^10.6.0`      | For Font Awesome icons                                                                                  |
| `flutter_svg: ^2.0.10`               | For SVG support                                                                                         |
| `flutter_typeahead: ^4.0.0`          | For typeahead/autocomplete functionality                                                                |
| `flutter_dotenv: ^5.0.2`             | For environment variable management                                                                     |
| `u_credit_card`                      | For credit card UI components                                                                           |
| `lottie: ^1.0.5`                     | For Lottie animations                                                                                   |
| `equatable: ^2.0.7`                  | For equality comparisons                                                                                |
| `toastification: ^0.0.2`             | For toast notifications                                                                                 |
| `intl_phone_number_input: ^0.7.4`    | For international phone number input                                                                    |
| `image_picker: ^1.1.2`               | For selecting images from gallery or camera                                                             |
| `cached_network_image: ^3.4.1`       | A Flutter library for displaying images from the internet with caching functionality                     |
| `cupertino_icons: ^1.0.8`            | A Flutter package that includes icons from Apple's design language                                      |
| `auto_route: ^9.3.0+1`               | A routing package for Flutter that simplifies navigation and supports deep linking                      |
| `firebase_core: ^15.2.1`             | Required to initialize Firebase in your Flutter application                                             |
| `firebase_messaging: ^15.2.1`        | A Flutter plugin for Firebase Cloud Messaging for push notifications                                    |
| `onesignal_flutter: ^5.1.2`          | Flutter plugin for OneSignal, an easy-to-use push notification service                                  |
| `firebase_auth: ^5.6.2`              | Flutter plugin for Firebase Authentication                                                              |
| `google_sign_in: ^5.2.1`             | A Flutter plugin for Google Sign-In authentication                                                      |
| `flutter_bloc: ^9.1.0`               | State management library based on the BLoC (Business Logic Component) pattern                           |
| `supabase_flutter: ^2.8.2`           | Flutter package for Supabase, providing database, authentication, and storage                           |
| `dio: ^5.0.0`                        | A powerful HTTP client for Flutter, supporting interceptors, form data, and request cancellation        |
| `retrofit: ^4.4.2`                   | A type-safe HTTP client for Flutter that simplifies working with REST APIs using annotations            |
| `json_annotation: ^4.9.0`            | Provides annotations to generate code for JSON serialization and deserialization                        |
| `json_serializable: ^6.0.0`          | For JSON serialization                                                                                 |
| `intl: ^0.19.0`                      | Package for internationalization and localization support                                               |
| `shared_preferences: ^2.5.2`         | A Flutter plugin for persistent storage of simple data, such as preferences and settings                |
| `riverpod: ^2.2.3`                   | For state management                                                                                    |
| `riverpod_flutter: ^1.1.0`           | Flutter hooks for Riverpod                                                                              |
| `hive: ^2.2.3` / `hive_flutter`       | A lightweight and fast key-value database for Flutter, storing data locally in a NoSQL format          |
| `app_links: ^3.4.3`                  | A Flutter package for handling deep links and universal links                                           |

## Architecture

The application follows a clean architecture approach with a clear separation of concerns:

### Presentation Layer
- **Views**: UI components located in the `app/views` directory
- **Cubit/State**: State management using Flutter Bloc/Cubit pattern in the `core/cubits` directory
- **UI Kit**: Reusable UI components from the `shopapp_widgets` package

### Domain Layer
- **Models**: Data models representing the application entities in `core/network/models`
- **Repositories**: Interface definitions for data operations

### Data Layer
- **Repositories Implementations**: Actual implementation of repositories
- **Services**: API services using Retrofit and Dio for remote data
- **Local Storage**: Using Hive and SharedPreferences for local data

This architecture promotes:
- **Separation of concerns**: Each layer has a specific responsibility
- **Testability**: Business logic can be tested independently
- **Maintainability**: Changes in one layer don't affect others
- **Scalability**: Easy to add new features or modify existing ones

## State Management

The application uses the BLoC pattern (through Cubit implementation) for state management:

1. **Cubits**: Handle business logic and maintain state
2. **States**: Represent different UI states (loading, success, error)
3. **Events**: Triggered by user interactions

This approach provides reactive UI updates and predictable state changes throughout the application.

## Localization

The app supports multiple languages using the `intl` package and `slang`. Translation files are located in the `app/l10n` directory.

## Backend Integration

Supabase serves as the primary backend solution providing:
- **Authentication**: User management and access control
- **Database**: PostgreSQL database for storing application data
- **Storage**: File storage for product images and other assets

Firebase is used for push notifications to keep users updated about their orders and other activities.

## Contributors

- Gürkan Fikret Günak ([@gurkanfikretgunak](https://github.com/gurkanfikretgunak)) 
- Selim Kütük ([@SelimKutuk](https://github.com/SelimKutuk))
- Kaan Çerkez ([@KaanCL](https://github.com/KaanCL))

## Acknowledgements

- Thanks to the Flutter team for the amazing framework
- Supabase for the backend solutions
- [NILAH - E-commerce Mobile App UI Kit](https://www.figma.com/community/file/1305009210349128805) for the design inspiration
- All the package authors that made this project possible
- Everyone who has contributed ideas, feedback, and suggestions
