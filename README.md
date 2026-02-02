# Social Mate 📱

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Bloc](https://img.shields.io/badge/pro-bloc-40C4FF.svg?style=for-the-badge&logo=flutter&logoColor=black)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)

**Social Mate** is a modern, feature-rich social media application built with **Flutter**. It leverages the power of **Clean Architecture** and **Supabase** to provide a scalable, secure, and responsive user experience. Connect with friends, share your moments, and discover new content in a beautifully designed interface.

---

## 📑 Table of Contents
- [✨ Key Features](#-key-features)
- [🏗️ Architecture & Tech Stack](#️-architecture--tech-stack)
- [📦 Packages Used](#-packages-used)
- [🚀 Getting Started](#-getting-started)
- [📂 Project Structure](#-project-structure)
- [📸 Screenshots](#-screenshots)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## ✨ Key Features

### 🔐 Authentication & Security
- **Secure Sign Up & Sign In**: Robust authentication flow using Email/Password.
- **Social Login**: Integration placeholders for Google and Microsoft authentication.
- **Form Validation**: Real-time validation for emails, passwords, and phone numbers.
- **Supabase Integration**: Backend powered by Supabase Auth.

### 🏠 Social Interaction
- **Dynamic Home Feed**: Scroll through posts and updates from your network.
- **Rich Content Sharing**: Create posts with **Text**, **Images**, and **Videos**.
- **Interactive UI**: "What's on your mind?" quick post creation widget.
- **Bottom Navigation**: Easy access to Home, Add Content, Bag (Marketplace), and Groups.

### 🎨 UI/UX Design
- **Modern Aesthetic**: Clean, minimalist design with a focus on usability.
- **Responsive Layouts**: Fully responsive UI adapted for different screen sizes using `flutter_screenutil`.
- **Custom Components**: Bespoke buttons, text fields, and dividers for a unique brand identity.
- **Feedback Systems**: Integrated Toast notifications for user actions (Success, Error, Info).

---

## 🏗️ Architecture & Tech Stack

This project follows **Clean Architecture** principles to ensure separation of concerns, testability, and maintainability.

- **Presentation Layer**: Widgets, Pages, BLoCs (State Management).
- **Domain Layer**: Entities, Usecases, Repository Interfaces (Pure Dart).
- **Data Layer**: Repository Implementations, Data Sources, Models (API calls, DB interactions).

### Core Technologies
- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **Backend**: [Supabase](https://supabase.com/)
- **State Management**: [BLoC / Cubit](https://bloclibrary.dev/)

---

## 📦 Packages Used

A curated list of dependencies that power Social Mate:

### Core & Architecture
- `flutter_bloc`: State management.
- `get_it` & `injectable`: Dependency injection service locator.
- `go_router`: Declarative routing handling.
- `bloc_concurrency`: Advanced event processing for BLoC.
- `equatable`: Value equality comparisons.

### Networking & Backend
- `supabase_flutter`: Supabase client integration.
- `flutter_dotenv`: Environment variable management.

### UI & Styling
- `flutter_screenutil`: Screen adaptation and responsiveness.
- `flutter_svg`: SVG asset rendering.
- `toastification`: Beautiful toast notifications.
- `flutter_decorated_container`: Enhanced container styling.
- `flutter_dash`: Dashed line widgets.

### Utilities & Dev Tools
- `talker_bloc_logger`: Advanced logging for BLoC transitions.
- `build_runner`: Code generation runner.
- `flutter_gen_runner`: Asset generator.

---

## 🚀 Getting Started

Follow these steps to run the project locally.

### Prerequisites
- Flutter SDK installed (v3.0.0+)
- Dart SDK installed
- Supabase project set up

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/social_mate_app.git
   cd social_mate_app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Environment Variables**
   Create a `.env` file in the root directory and add your Supabase credentials:
   ```env
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Generate Code (DI & Assets)**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the App**
   ```bash
   flutter run
   ```

---

## 📂 Project Structure

```
lib/
├── core/                  # Core utilities, theme, routes, generic widgets
│   ├── assets_gen/        # Generated assets
│   ├── di/                # Dependency Injection setup
│   ├── error/             # Error handling (Failures, Exceptions)
│   ├── l10n/              # Localization (ARB files)
│   ├── routes/            # App Router configuration
│   └── services/          # Third-party services (services wrappers)
├── features/              # Feature-based modules
│   ├── auth/              # Authentication Feature
│   │   ├── data/          # Data sources & Repositories
│   │   ├── domain/        # Entities & Usecases
│   │   └── presentation/  # Pages, Tabs, BLoCs
│   ├── home/              # Home Feed Feature
│   └── onboarding/        # Onboarding Feature
├── global/                # Application-wide BLoCs (e.g., AppFlow)
└── main.dart              # Application Entry Point
```

---

## 📸 Screenshots

| Onboarding | Sign In | Sign Up | Home Feed |
|:---:|:---:|:---:|:---:|
| <img src="docs/screenshots/onboarding.png" width="200" /> | <img src="docs/screenshots/signin.png" width="200" /> | <img src="docs/screenshots/signup.png" width="200" /> | <img src="docs/screenshots/home.png" width="200" /> |

*(Screenshots to be added)*

---

## 🤝 Contributing

Contributions are welcome! If you'd like to improve Social Mate, please follow these steps:

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Built with ❤️ using Flutter
</p>
