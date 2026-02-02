[![Figma Design](screenshots/figma_thumbnail.png)](https://www.figma.com/community/file/1164103907030501213/social-mate-a-social-media-application-design)

---

## ✨ Badges

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS-blue.svg?style=for-the-badge)
![State Management: Bloc](https://img.shields.io/badge/State%20Management-Bloc-purple.svg?style=for-the-badge)
![Architecture: Clean](https://img.shields.io/badge/Architecture-Clean%20Architecture-orange.svg?style=for-the-badge)

[![GitHub Stars](https://img.shields.io/github/stars/AmrSalahDev/Social-Mate-Flutter-App?style=social)](https://github.com/AmrSalahDev/Social-Mate-Flutter-App/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/AmrSalahDev/Social-Mate-Flutter-App?style=social)](https://github.com/AmrSalahDev/Social-Mate-Flutter-App/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/AmrSalahDev/Social-Mate-Flutter-App?style=social)](https://github.com/AmrSalahDev/Social-Mate-Flutter-App/issues)

---

# 📱 Social Mate

**A modern, feature-rich social media application** built with **Flutter 🚀**, **Bloc 🧩**, **Clean Architecture 🏗️**, and **Supabase ☁️**.

Designed to connect people with a seamless and beautiful user experience. Featuring secure authentication, dynamic social feeds, and a polished UI. ✨

---

## 📑 Table of Contents
- [🎯 Key Features](#-key-features)
- [✨ Badges](#-badges)
- [🚀 Getting Started](#-getting-started)
- [📦 Dependencies Used](#-dependencies-used)
- [📸 Screenshots](#-screenshots)
- [🛠️ Contributions](#️-contributions)
- [📜 License](#-license)

---

## 🎯 Key Features

### 🔐 Authentication & Security
- **Secure Sign Up & Sign In** - Robust authentication flow using Email/Password 📧.
- **Social Login Support** - UI integration for Google and Microsoft authentication 🌐.
- **Supabase Integration** - Backend authentication powered by Supabase ⚡.
- **Form Validation** - Real-time validation for user inputs with localized feedback ✅.

### 🏠 Social Interaction
- **Dynamic Home Feed** - Scroll through posts and updates 📰.
- **Post Creation** - "What's on your mind?" widget with options for Text, Images, Videos, and Attachments 📸.
- **Bottom Navigation** - Easy access to Home, Add Content, Marketplace (Bag), and Groups 🧭.

### 🎨 User Experience & Design
- **Modern UI** - Clean, minimalist design with a focus on usability 💎.
- **Responsive Layout** - Optimized for all screen sizes using `flutter_screenutil` 📱.
- **Custom Components** - Tailored widgets for buttons, text fields, and dividers 🛠️.
- **Toast Notifications** - Beautiful, animated in-app notifications using `toastification` 🔔.

### 🏗️ Architecture & Best Practices
- **Clean Architecture** - Organized folder structure (Data, Domain, Presentation) 📂.
- **BLoC Pattern** - Predictable state management using `flutter_bloc` and `cubit` 🔄.
- **Dependency Injection** - Scalable service locator using `get_it` and `injectable` 💉.
- **Routing** - Declarative navigation with `go_router` 🛣️.
- **Localization** - Full multi-language support setup 🌍.

---

## 🏗️ Project Architecture

This project follows **Clean Architecture** principles to ensure a highly scalable, maintainable, and testable codebase. The separation of concerns is strictly maintained across three primary layers:

### 1. 📂 Presentation Layer
*   **Widgets & Pages**: Pure UI components built with Flutter.
*   **BLoC / Cubit**: Handles state management and interacts with Domain usecases.
*   **Routing**: Managed via `go_router` for declarative navigation.

### 2. 🧠 Domain Layer (Pure Dart)
*   **Entities**: Simple Dart classes representing the core data models.
*   **Use Cases**: Contains specific business logic and coordinates data flow.
*   **Repositories (Interfaces)**: Defines contracts for data operations, ensuring the domain layer is independent of external dependencies.

### 3. 💾 Data Layer
*   **Repositories (Implementations)**: Implements the contracts defined in the Domain layer.
*   **Data Sources**: Handles direct communication with local storage or remote APIs (e.g., Supabase).
*   **Models**: DTOs (Data Transfer Objects) that handle JSON serialization/deserialization.

### 🧩 Folder Structure
```text
lib/
├── core/                  # Shared utilities, themes, DI, and routes
├── features/              # Modular features (e.g., auth, home)
│   └── [feature_name]/
│       ├── data/          # Repositories & Data Sources
│       ├── domain/        # Entities & Use Cases
│       └── presentation/  # UI (Pages & Widgets) & State Management
├── global/                # App-wide BLoCs and Global State
└── main.dart              # Entry point
```

---

## 🚀 Getting Started

To run this app locally:

```bash
git clone https://github.com/AmrSalahDev/Social-Mate-Flutter-App.git
cd Social-Mate-Flutter-App
flutter pub get
flutter run
```

### ✅ Prerequisites
- 🐦 Flutter SDK 3.9.0 or higher
- 🎯 Dart 3.9.0 or higher
- 🏢 Android Studio / Xcode (for iOS development)
- 📱 Android/iOS device or emulator

### 📋 Steps
1. 📥 **Clone the repository**
2. 📚 **Install dependencies**: `flutter pub get`
3. ⚙️ **Generate code**: `flutter pub run build_runner build --delete-conflicting-outputs`
4. 🔐 **Setup Environment**: Create a `.env` file with your `SUPABASE_URL` and `SUPABASE_ANON_KEY`.
5. ▶️ **Run the app**: `flutter run`

---

## 📦 Dependencies Used

Below is a list of key packages used in this Flutter project:

### 🏗️ Architecture & State Management
- `flutter_bloc: ^9.1.1` - State management library 🧩.
- `bloc: ^9.2.0` - Core business logic component ⚙️.
- `bloc_concurrency: ^0.3.0` - Concurrency transformers for Bloc events ⚡.
- `get_it: ^9.2.0` - Service locator for dependency injection 💉.
- `injectable: ^2.7.1` - Code generation for GetIt 🏗️.
- `go_router: ^17.0.1` - Declarative routing package 🛣️.

### ☁️ Backend & Data
- `supabase_flutter: ^2.12.0` - Supabase client for Auth and Database ⚡.
- `flutter_dotenv: ^6.0.0` - Load environment variables from `.env` 🔐.
- `equatable: ^2.0.5` - Simplify object equality comparisons ⚖️.

### 🎨 UI & Assets
- `flutter_screenutil: ^5.9.3` - Screen adaptation tool 📱.
- `flutter_svg: ^2.2.3` - SVG rendering support 🖼️.
- `toastification: ^3.0.3` - Customizable toast notifications 🔔.
- `flutter_dash: ^1.0.0` - Dashed line widgets ➖.
- `flutter_decorated_container: ^1.0.0` - Advanced container styling 🎨.
- `cupertino_icons: ^1.0.8` - iOS style icons 🍎.
- `smooth_page_indicator: ^2.0.1` - Page indicators for onboarding 📑.

### 🛠️ Utilities & Dev Tools
- `talker_bloc_logger: ^5.1.10` - Logging tool for Bloc state changes 📝.
- `my_flutter_toolkit` - Custom utility package 🧰.
- `build_runner: ^2.10.5` - Build system for code generation 🏗️.
- `flutter_gen_runner: ^5.12.0` - Asset generator 📂.

---

## 📸 Screenshots

<p float="left">
  <img src="screenshots/home_page.png" width="22%"/>
  <img src="screenshots/onboarding_page.png" width="22%"/>
  <img src="screenshots/sign_in_page.png" width="22%"/>
  <img src="screenshots/comments_page.png" width="22%"/>
  <img src="screenshots/profile_page.png" width="22%"/>
</p>

---

## 🎨 Figma Design

✨ Check out the app UI design in Figma:

[![Figma Design](screenshots/figma_thumbnail.png)](https://www.figma.com/community/file/1164103907030501213/social-mate-a-social-media-application-design)

📌 Click the image to view the live Figma prototype.

---

## 🛠️ Contributions

🤝 Feel free to fork the repo, open issues, or submit PRs to improve the app!

### 📝 To Contribute:
1. 🍴 Fork the repository
2. 🌿 Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. 💾 Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push to the branch (`git push origin feature/AmazingFeature`)
5. 🔀 Open a Pull Request

---

## 📜 License

⚖️ This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📧 Support & Contact

💬 For questions or support, feel free to open an issue on GitHub or contact the development team.

<p align="center">
  <strong>Built with ❤️ using Flutter</strong>
</p>