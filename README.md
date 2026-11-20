# Hive Posts App

A Flutter application that displays posts from the JSONPlaceholder API and uses **Hive**, a local NoSQL database, to store posts and favorites on the device.

## Features

- Fetch and display posts from the JSONPlaceholder API.
- Cache posts locally using Hive.
- Display previously saved posts when the device is offline.
- Add and remove posts from Favorites.
- Store favorites in a separate Hive box (`favoritesBox`).
- Display all saved favorites on a dedicated Favorites screen.
- Keep favorites saved after closing and reopening the app.
- Show a friendly empty state when there are no favorite posts.

## Technologies Used

- Flutter
- Dart
- Hive
- hive_flutter
- HTTP
- JSONPlaceholder API

## Project Structure

```text
lib/
├── main.dart
├── models/
│   ├── post_model.dart
│   └── post_model.g.dart
├── screens/
│   ├── posts_screen.dart
│   └── favorites_screen.dart
└── services/
    ├── post_service.dart
    └── favorites_service.dart
```

## Getting Started

### Requirements

- Flutter SDK
- Dart SDK
- Chrome or an Android device/emulator

### Installation

1. Clone the repository:

```bash
git clone https://github.com/aliisaaidd55-netizen/hive_posts.git
```

2. Open the project folder:

```bash
cd hive_posts
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run -d chrome
```

## Hive Storage

The application uses two separate Hive boxes:

- `postsBox`: stores posts retrieved from the API.
- `favoritesBox`: stores the user's favorite posts locally.

Favorites are stored using the post ID as the key, allowing the app to check, add, and remove favorites efficiently.

## Screenshots

Add your application screenshots in the `screenshots/` folder and include them below.

### Posts Screen
<!-- Add screenshot here -->

### Favorites Screen
<!-- Add screenshot here -->

### Favorite Added
<!-- Add screenshot here -->

### Empty Favorites
<!-- Add screenshot here -->

### Offline Mode
<!-- Add screenshot here -->

## Offline Testing

1. Open the application while connected to the internet.
2. Wait for the posts to load.
3. Add some posts to Favorites.
4. Close the application.
5. Disconnect from the internet or enable Airplane Mode.
6. Reopen the application and verify that locally saved data and favorites are still available.

## Author

Flutter Hive Assignment — Fall 2026, Section 5
