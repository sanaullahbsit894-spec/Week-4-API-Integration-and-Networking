# ConnectHub — Flutter API Integration App

A Flutter application demonstrating RESTful API integration, JSON parsing, and clean UI design.

## Features
- Fetches users and posts from JSONPlaceholder API
- User profile screen with posts feed
- Loading indicators and robust error handling with retry
- Custom dark theme using a navy/blue/cream palette

## Tech Stack
- Flutter 3.x
- `http` package for API requests
- `cached_network_image` for avatar loading
- JSONPlaceholder as the mock API

## Setup
```bash
git clone <your-repo-url>
cd <project-folder>
flutter pub get
flutter run
```

## Architecture

lib/
├── models/ # Data classes with fromJson factories
├── services/ # API calls isolated in ApiService
├── screens/ # UI screens
├── widgets/ # Reusable components
└── theme/ # Colors and ThemeData

## API Endpoints Used

| Endpoint                | Purpose             |
| ----------------------- | ------------------- |
| `GET /users`            | All users list      |
| `GET /users/:id`        | Single user profile |
| `GET /posts`            | All posts           |
| `GET /posts?userId=:id` | Posts by user       |
