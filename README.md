# 🌿 Fayzigul

**Fayzigul** is a mobile application designed to help users discover, buy, and care for home plants. Whether you're a beginner or a plant expert, Fayzigul provides detailed information on how to take care of each plant and helps you build a greener, healthier indoor space.

---

## 📱 Preview

> Add your app screenshots or a demo GIF here.

![Fayzigul App Preview](screenshots/preview1.png)

---

## 🌱 Features

- 🌸 Browse a wide variety of indoor and outdoor plants  
- 📖 Get detailed care instructions for each plant  
- 🛒 Buy plants and related accessories directly from the app  
- 🧠 Learn about watering, sunlight, soil, and repotting  
- 🔍 Smart search for plant species or symptoms  

---

## 🚀 Getting Started

### 📦 Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (3.x.x)  
- Dart SDK  
- Android Studio / VS Code  
- Firebase Project (for Auth, Firestore, etc.)  

### 🧪 Installation

```bash
git clone https://github.com/yourusername/fayzigul.git
cd fayzigul
flutter pub get
```

### ▶️ Running the App

```bash
flutter run

# Or with a specific device:
flutter run -d emulator-5554
```

---

## 🔧 Project Structure

```text
lib/
├── core/
│   ├── common/          # shared widgets, styles, utils, etc.
│   ├── error/           # failure classes, exceptions
│   ├── services/        # global services (e.g., connectivity, analytics)
│   └── usecases/        # abstract base use cases (optional)
│
├── features/
│   ├── auth/            # Feature: Authentication
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/ or cubit/
│   │       └── screens/
│   │
│   ├── home/
│   │   └── same as above...
│
└── main.dart

```

---

## 🧰 Built With

- **Flutter** – Cross-platform UI toolkit
- **Firebase** – Auth, Firestore, Storage
- **BLoC** – State management
- **Dio** – Networking
- **Hive / SharedPreferences** – Local storage

---

## 🔒 Permissions

The app requires the following permissions:

- Internet access

> Make sure to add them in `AndroidManifest.xml` and `Info.plist`.

---

## 🧪 Testing

```bash
flutter test
```

Write unit, widget, or integration tests inside the `test/` folder.

---

## 📦 Deployment

### Android

```bash
flutter build apk --release
# or
flutter build appbundle
```

### iOS

```bash
flutter build ios --release
```

---

## 🤝 Contributing

1. Fork the repo  
2. Create your feature branch: `git checkout -b feature/awesome-feature`  
3. Commit your changes: `git commit -m 'Add awesome feature'`  
4. Push to the branch: `git push origin feature/awesome-feature`  
5. Open a pull request  

---

## 📧 Contact

**Abdusalom Gayratov**  
📧 [abdusalomgayratov7@gmail.com](mailto:abdusalomgayratov7@gmail.com)  
📱 Telegram: [@yourtelegramhandle](https://t.me/Abdusalom999_16)  

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

> 🌿 Fayzigul – Make your home greener, one plant at a time.
