# Dogs We love 
##### Konfio interview

Make sure to have the latest version of Flutter installed on your machine. 3.29.0. Or just use fvm to manage the version of flutter, the project is already configured to use fvm.

## Installation

1. Clone the repository
2. Install the dependencies:
```bash
flutter pub get
```
3. Generate the routes:
```bash
flutter pub run build_runner build
```
4. Run the app:
```bash
flutter run
```

## Architecture

The architecture used in this project is the Clean Architecture, which is divided into three layers: Domain, Data, and Presentation.

### Domain

This layer contains the business logic of the application. It is the innermost layer and does not depend on any other layer. It contains the entities, use cases, and repositories interfaces.

### Data

This layer contains the implementation of the repositories interfaces defined in the Domain layer. It is the middle layer and depends on the Domain layer. It contains the data sources, repositories, and models.

### Presentation

This layer contains the UI of the application. It is the outermost layer and depends on the Domain and Data layers. It contains the pages, widgets, and blocs.