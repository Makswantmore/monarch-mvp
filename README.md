# Monarch MVP — Personal Finance Tracker

A cross-platform personal finance MVP built in a few hours with Flutter.

This project is inspired by modern finance dashboards such as Monarch Money: clean UI, dark/light themes, budgets, transactions, accounts, net worth overview, and multi-language support.

> **Note:** This is an MVP, not a full production banking app. It currently uses local/sample data and does not include real bank synchronization, cloud sync, investment feeds, or secure multi-user accounts.

---

## What Was Built in a Few Hours

Despite the short development time, the MVP already includes a solid foundation for a personal finance application.

### Core Product Features

- **Dashboard**
  - Net worth overview
  - Current month income
  - Current month expenses
  - Savings rate
  - Accounts summary
  - Recent transactions

- **Transactions**
  - Transaction list
  - Filter by type: All / Income / Expense
  - Add new transaction
  - Delete transaction
  - Swipe-to-delete support
  - Category and account selection
  - Date picker

- **Budgets**
  - Monthly budget cards by category
  - Spent vs limit progress bar
  - Over-budget indication
  - Editable budget limits

- **Settings**
  - Theme switching:
    - Light
    - Dark
    - System
  - Language switching
  - About section
  - Version information

---

## Design and User Experience

The UI is built with Flutter Material 3 and focuses on a clean, modern financial dashboard feel.

### Design Highlights

- Dark theme and light theme
- Adaptive layout:
  - Bottom navigation on narrow screens
  - Side navigation rail on wide desktop screens
- Rounded cards and soft surfaces
- Gradient net-worth card
- Clear income/expense visual separation
- Responsive spacing and typography
- Simple but polished component system

### Theme System

The app supports:

- Light mode
- Dark mode
- System theme

Theme preference is stored locally using `shared_preferences`.

---

## Localization

The MVP includes four languages:

- English — primary language
- Russian
- Chinese
- Japanese

Localization is implemented using Flutter’s official localization system:

- `flutter_localizations`
- `GlobalMaterialLocalizations`
- `GlobalWidgetsLocalizations`
- `GlobalCupertinoLocalizations`

The app interface switches language instantly from Settings.

---

## Technical Stack

### Framework

- Flutter
- Dart

### Official Dependencies

- `flutter`
- `flutter_localizations`
- `shared_preferences`
- `intl`

No unofficial UI frameworks were used. The interface is built directly with Flutter widgets and Material 3.

---

## Platform Support

The project is configured for:

- Windows desktop
- Android
- Web

### Current Focus

The fastest and most stable experience right now is:

- Windows desktop app
- Android app
- Web app through GitHub Pages

### macOS / Linux

The project can also support macOS and Linux if those platforms are added to the Flutter project.

---

## Project Structure

```text
monarch_mvp/
├── android/
├── web/
├── windows/
├── assets/
│   └── icons/
│       ├── dashboard/
│       ├── transactions/
│       ├── budgets/
│       ├── settings/
│       ├── accounts/
│       ├── categories/
│       ├── brands/
│       ├── actions/
│       ├── status/
│       └── misc/
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── .github/
│   └── workflows/
│       ├── deploy-web.yml
│       └── build-native.yml
├── pubspec.yaml
├── README.md
└── .gitignore
```

### Asset Icon Folders

The following icon folders are prepared for future custom assets:

```text
assets/icons/dashboard/
assets/icons/transactions/
assets/icons/budgets/
assets/icons/settings/
assets/icons/accounts/
assets/icons/categories/
assets/icons/brands/
assets/icons/actions/
assets/icons/status/
assets/icons/misc/
```

The current MVP uses built-in Material Icons, so the app runs even before custom PNG/SVG icons are added.

---

## Getting Started

### Requirements

- Flutter SDK
- Dart SDK
- Git
- Visual Studio 2022 with “Desktop development with C++” for Windows builds
- Android Studio and JDK 17/21 for Android builds
- Chrome or another browser for web development

Recommended Java version for Android builds:

```text
JDK 17 or JDK 21
```

JDK 27 is not currently compatible with the Gradle versions used by Flutter Android builds.

---

### Install Dependencies

```bash
flutter pub get
```

---

### Run on Windows

```bash
flutter run -d windows
```

---

### Run on Web

```bash
flutter run -d chrome
```

---

### Run on Android

Connect an Android device with USB debugging enabled, or start an emulator.

```bash
flutter devices
flutter run -d android
```

---

## Building Release Versions

### Build Web

```bash
flutter build web --release
```

Output:

```text
build/web
```

---

### Build Windows

```bash
flutter build windows --release
```

Output is usually located in:

```text
build/windows/x64/runner/Release/
```

---

### Build Android APK

Debug APK:

```bash
flutter build apk --debug
```

Output:

```text
build/app/outputs/flutter-apk/app-debug.apk
```

Release APK:

```bash
flutter build apk --release
```

Output:

```text
build/app/outputs/flutter-apk/app-release.apk
```

> For public distribution on Google Play, a signed Android App Bundle is recommended:
>
> ```bash
> flutter build appbundle --release
> ```

---

## CI/CD with GitHub Actions

The repository includes GitHub Actions workflows for automated builds.

### Web Deployment

Workflow:

```text
.github/workflows/deploy-web.yml
```

This workflow:

- checks out the repository
- installs Flutter SDK
- enables web support
- builds the release web bundle
- deploys it to GitHub Pages

After a successful run, the web app is available at:

```text
https://<username>.github.io/<repository-name>/
```

---

### Native Builds

Workflow:

```text
.github/workflows/build-native.yml
```

This workflow builds:

- Android debug APK
- Windows release ZIP

It can be triggered by:

- pushing a version tag, for example:

```bash
git tag v0.1.0
git push origin v0.1.0
```

- or manually from the GitHub Actions tab.

---

## Java and Gradle Compatibility

Android builds depend on Java and Gradle compatibility.

The project is configured to use Java 21 in CI.

Java 21 is compatible with modern Gradle versions used by Flutter.

Java 27 is not recommended because current Gradle versions do not fully support it.

If Flutter shows a Java warning locally, point Flutter to your JDK 21 folder:

```bash
flutter config --jdk-dir="C:\path\to\jdk-21"
```

Example:

```bash
flutter config --jdk-dir="C:\Program Files\Eclipse Adoptium\jdk-21.0.5.11-hotspot"
```

The path should point to the JDK root folder, not the `bin` folder.

---

## Privacy and Secrets

This repository intentionally excludes confidential files using `.gitignore`.

Do not commit:

- API keys
- tokens
- passwords
- private signing keys
- keystore files
- `.env` files
- service account JSON files
- local SDK paths
- personal certificates

If a secret was ever pushed to GitHub, rotate it immediately. Removing the file in a new commit does not erase it from Git history.

---

## Current Limitations

This is an MVP. The following features are not implemented yet:

- real bank synchronization
- secure cloud authentication
- multi-device sync
- investment portfolio tracking
- recurring transactions
- CSV/OFX import
- notifications
- advanced charts
- custom categories
- tags
- search
- export to PDF/CSV
- production Android signing
- iOS release build

---

## Next Steps

Possible improvements for the next iteration:

1. Persist transactions locally using SQLite or Hive.
2. Add real budget editing and category management.
3. Add charts for cash flow and category spending.
4. Add recurring transactions.
5. Add CSV import/export.
6. Add secure authentication and cloud sync.
7. Add iOS support with proper Apple Developer configuration.
8. Replace sample icons with branded assets.
9. Add unit and widget tests.
10. Prepare signed release builds for Android and Windows.

---

## License

This project is provided as an MVP example. Add a license file if you want to define usage terms publicly.