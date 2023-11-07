


# Flutter clean architecture structure with BLOC and Get_It Package

This repository contains a clean architecture structure using Flutter, following the Clean Architecture principles and utilizing BLOC pattern along with Get_It packages.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/aliesmailie/flutter_boilerplate.git
   ```

2. Change to the project directory:

   ```bash
   cd news_app_clean_architecture
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Structure

The app follows the Clean Architecture principles, with the following structure:

- `lib/`
    - `core/`: Contains Core Utilities that used entire application
    - `features/`:
        - `app`: Initializes the app and sets up the dependency injection.
        - `{features_a}`:
            - `data/`: Contains the data layer responsible for handling data fetching and caching.
            - `domain/`: Defines the core business logic and entities of the app.
            - `presentation/`: Contains the UI layer of the app, including BLOCs, views, and widgets.
    - `main.dart`: Entry point of the application.


## Some useful descriptions

BrickHub is a platform where developers can discover, install, and publish reusable templates called bricks.

See for more information:
[online documentation](https://docs.brickhub.dev/) 

To auto create clean architecture directories use mason:
> mason make clean_architecture_folders --name home -o ~/AndroidStudioProjects/flutter_boilerplate/lib/features

[online documentation](https://brickhub.dev/bricks/feature_brick/0.6.2)
A brick to create a feature and tests using best practices and your state management of choice:
> mason make feature_brick

===============================

The multilingual structure of the app is implemented by slang package.

See for more information:
[online documentation](https://pub.dev/packages/slang) 

To use command-line tool run this command:
> dart run slang

===============================

flutter_launcher_icons package is a command-line tool which simplifies updating launcher icons.

See for more information:
[online documentation](https://pub.dev/packages/flutter_launcher_icons) 

To use command-line tool run these commands:
> flutter pub get
> flutter pub run flutter_launcher_icons -f flutter_launcher_icons.yaml

===============================

Formz package is a unified form representation in Dart. 
Formz aims to simplify form representation and validation in a generic way.

See for more information:
[online documentation](https://pub.dev/packages/formz)
[online documentation](https://brickhub.dev/bricks/formz_input/0.2.0) 

To use command-line tool run this command:
> mason make formz_input -o  ~/AndroidStudioProjects/flutter_boilerplate/lib/features --input_name PhoneNumber --input_type String --initial_value "''" --validate_empty_string true

===============================

Sized_context package allow to easily access the MediaQuery sizing info directly on the context
hint: package codes with some changes have been used in the project instead of package

See for more information:
[online documentation](https://pub.dev/packages/sized_context)

===============================


Mockito package is used to generate mock classes for testing

See for more information:
[online documentation](https://pub.dev/packages/mockito)

===============================

Animation package contains pre-canned animations for commonly-desired effects.

See for more information:
[online documentation](https://pub.dev/packages/animations)

===============================