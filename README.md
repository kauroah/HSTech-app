### ENGLSIH VERSION


# 📱 MSTech App (Flutter)

This project is a simple Flutter application that demonstrates a **typical subscription flow** used in many mobile apps.  
It was built as part of a technical test assignment and focuses on **logic, clarity, and speed of implementation**, rather than complex UI or real billing integration.



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


<img width="1920" height="2560" alt="image" src="https://github.com/user-attachments/assets/4c3a68d2-ebfc-40a6-9514-472dfd5ee2e9" />


## 🏗 Project Structure

```
lib/
├── main.dart
├── app.dart
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



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


### RUSSIAN VERSION


# 📱 Приложение HSTech (Flutter)

Этот проект представляет собой простое приложение Flutter, которое демонстрирует ** типичный процесс подписки **, используемый во многих мобильных приложениях.  
Оно было разработано в рамках технического тестирования и ориентировано на логику, ясность и скорость внедрения, а не на сложный пользовательский интерфейс или реальную биллинговую интеграцию.



## 🚀 Идея приложения

Приложение имитирует работу реальных приложений, основанных на подписке:

1. Новые пользователи видят короткую ** Регистрацию** (1-2 экрана).
2. После регистрации пользователям отображается **Платный доступ **.
3. На платном доступе пользователи могут:
   - Выберите между тарифными планами подписки ** На месяц** и ** на год** (на годовой предоставляется скидка).
   - Запустите бесплатную пробную версию **.
4. После запуска бесплатной пробной версии или покупки подписки пользователи получают доступ к главному экрану **.
5. Приложение запоминает состояние доступа пользователя:
   - Если у пользователя активна подписка → открыть главный экран.
   - Если у пользователя активна бесплатная пробная версия → открыть главный экран.
   - Если доступа нет или срок действия бесплатной пробной версии истек → снова показать регистрацию.

Вся логика обрабатывается локально с помощью "SharedPreferences".  
Покупки ** имитируются ** (реальный счет не выставляется).


## ✨ Особенности

- Регистрация с просмотром страниц (1-2 экрана)
- Экран платного доступа с:
  - Ежемесячными и годовыми тарифными планами
  - Значок скидки для годового плана
  - Бесплатная пробная версия
- Имитация покупки подписки
- Логика бесплатной пробной версии с истечением срока действия (на основе времени)
- Постоянный доступ при перезапуске приложения
- Автоматическая навигация в зависимости от состояния доступа пользователя



## 🏗 Структура проекта

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

## ▶️ Как запустить приложение

### 1. Требования
- Установлен Flutter SDK
- Эмулятор Android, симулятор iOS или физическое устройство

### 2. Установите зависимости
```bash
flutter pub get
```

### 3. Запустите приложение
```bash
flutter run
```

### 4. Возможные улучшения
- Интеграция реальных покупок в приложении (StoreKit / Google Billing)
- Отображение оставшихся бесплатных пробных дней в пользовательском интерфейсе
- Добавление надлежащего управления состоянием (Block / Riverpod)
- Улучшение пользовательского интерфейса и анимации
- Добавление тестов модулей и виджетов
- Улучшение навигации с помощью решения для маршрутизации
