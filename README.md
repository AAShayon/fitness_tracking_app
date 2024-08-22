# Fitness Tracking App

This Flutter-based fitness tracking app is designed to help users monitor and track their fitness activities with a clean and intuitive UI. The app supports multiple themes, language localization, and includes API integration using Dio, local storage with shared preferences, and much more.

## Features

- **Theme Mode**: Light and Dark themes, synchronized with the device's system theme.
- **Language Localization**: Supports both English and Bengali.
- **User Authentication**: Login and registration screens for user authentication.
- **Fitness Activity Tracker**: Track daily activities with detailed views of each activity.
- **Statistics**: View comprehensive statistics related to your fitness progress.
- **Custom Widgets**: Includes custom buttons, animations, and navigation.
## Screenshot

![Fitness Tracker](./fitness%20tracker.png)


## Dependencies

- `dio`: For API integration.
- `provider`: State management.
- `easy_localization`: For handling multiple languages.
- `flutter_screenutil`: For responsive design.
- `icons_plus`, `font_awesome_flutter`: Icons for UI components.
- `carousel_slider`, `dots_indicator`: For dynamic UI elements.
- `fl_chart`: For charting and statistics display.

## Directory Structure
            fitness_tracking_app/
            ├── android/
            ├── ios/
            ├── assets/                           # Contains app icons, fonts, and images
            ├── lib/
            │   ├── model/
            │   │   ├── service/
            │   │   │   ├── helper/               # Helper functions for theme and token management
            │   │   │   ├── local/                # Local storage services
            │   │   │   ├── localization/         # Language JSON files (bn.json, en.json)
            │   │   │   └── remote/               # API-related services and response handling
            │   ├── modules/
            │   │   ├── activity/
            │   │   ├── auth/
            │   │   ├── home/
            │   │   ├── profile/
            │   │   └── statistics/               # Statistics and detailed activity tracking
            │   ├── utils/
            │   │   ├── constant/                 # Constant values for colors, buttons, etc.
            │   │   └── theme/                    # Theme-related settings and customizations
            │   └── view/
            │       ├── widgets/                  # Custom widgets like buttons, navigation bars, etc.
            │       └── viewModel/                # ViewModels for managing the state of the app
            ├── test/                             # Unit and widget tests
            ├── pubspec.yaml                      # Flutter configuration file
            └── README.md                         # Project README


## Known Issues

- **Back Button**: The `WillPopScope` functionality for back button handling needs refinement.
- **API Integration**: The API setup is in place but not fully implemented.

## Future Improvements

- Complete API integration and local database functionality.
- Refine theme mode integration with the UI.
- Fix back button behavior using `WillPopScope`.

