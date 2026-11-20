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


### Posts Screen

<img width="1600" height="900" alt="WhatsApp Image 2026-11-20 at 10 06 23 PM" src="https://github.com/user-attachments/assets/ce1de404-8b33-49d2-9570-cd7c7371aac7" />

### Favorites Screen
<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/59670164-e843-43a2-8199-d840c7c324fa" />


### Favorite Added
<img width="1600" height="900" alt="WhatsApp Image 2026-11-20 at 10 06 56 PM" src="https://github.com/user-attachments/assets/7558b57e-722c-41f3-b294-bd0cb0bbaa16" />


### Empty Favorites
<img width="1600" height="900" alt="WhatsApp Image 2026-11-20 at 10 06 39 PM" src="https://github.com/user-attachments/assets/24978a0b-78e3-4a90-8416-507fc52dbc6b" />


### Offline Mode
<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/b2863df5-9a63-4a9d-9f85-5c738186e0fc" />


## Offline Testing

1. Open the application while connected to the internet.
2. Wait for the posts to load.
3. Add some posts to Favorites.
4. Close the application.
5. Disconnect from the internet or enable Airplane Mode.
6. Reopen the application and verify that locally saved data and favorites are still available.

## Author

Flutter Hive Assignment — Section 5
