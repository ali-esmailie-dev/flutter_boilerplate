
Flutter clean architecture structure

This project is a starting point for a Flutter application.
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

===============================

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

Fix all lint warnings for the entire project
> dart fix --apply

===============================

Mockito package is used to generate mock classes for testing

See for more information:
[online documentation](https://pub.dev/packages/mockito)

===============================

Animation package contains pre-canned animations for commonly-desired effects.

See for more information:
[online documentation](https://pub.dev/packages/animations)

===============================