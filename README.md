Here's the corrected README file with proper formatting and structure:

```markdown
# 📱 HSTech App (Flutter)

This project is a simple Flutter application that demonstrates a **typical subscription flow** used in many mobile apps.  
It was built as part of a technical test assignment and focuses on **logic, clarity, and speed of implementation**, rather than complex UI or real billing integration.

---

## 🚀 Application Idea

The application simulates how real subscription-based apps work:

1. New users see a short **Onboarding** (1–2 screens).
2. After onboarding, users are shown a **Paywall**.
3. On the Paywall, users can:
   - Choose between **Monthly** and **Yearly** subscription plans (yearly has a discount).
   - Start a **Free Trial**.
4. After starting a free trial or buying a subscription, users gain access to the **Main Screen**.
5. The application remembers the user's access state:
   - If the user has an active subscription → open Main Screen.
   - If the user has an active free trial → open Main Screen.
   - If there is no access or the free trial has expired → show onboarding again.

All logic is handled locally using `SharedPreferences`.  
Purchases are **simulated** (no real billing is used).

---

## ✨ Features

- Onboarding with PageView (1–2 screens)
- Paywall screen with:
  - Monthly and Yearly plans
  - Discount badge for yearly plan
  - Free trial option
- Simulated subscription purchase
- Free trial logic with expiration (time-based)
- Persistent access state across app restarts
- Automatic navigation based on user access state

---

## 🏗 Project Structure

```
lib/
├── main.dart
├── app_bootstrap.dart
├── core/
│   └── storage/
│       └── subscription_storage.dart
└── features/
    ├── onboarding/
    │   └── onboarding_page.dart
    ├── paywall/
    │   ├── paywall_page.dart
    │   └── widgets/
    │       └── plan_card.dart
    └── home/
        └── home_page.dart
```

---

## ▶️ How to Run the Application

### 1. Requirements
- Flutter SDK installed
- Android Emulator, iOS Simulator, or physical device

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run the application
```bash
flutter run
```

### 4. Possible Improvements
- Integrate real in-app purchases (StoreKit / Google Billing)
- Display remaining free trial days in the UI
- Add proper state management (Bloc / Riverpod)
- Improve UI/UX and animations
- Add unit and widget tests
- Improve navigation with a routing solution
```
