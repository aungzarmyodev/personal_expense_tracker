# 💰 Personal Expense Tracker

A simple and clean Flutter application for tracking daily personal expenses with category-based organization, search functionality, and local storage-ready architecture.

---

## ✨ Features

- ➕ Add daily expenses
- 📂 Category-based expense tracking
- 🔍 Search expenses by category or note
- 📅 Date selection for each expense
- 📊 Clean UI with empty, loading, and error states
- 🧠 State management using Bloc
- 🧩 Scalable clean architecture
- 💾 Ready for local database integration (SQLite)

---

## 🧱 Tech Stack

- Flutter (UI framework)
- Bloc (State management)
- Dart
- sqflite (for local database - planned/optional)
- path (for file path handling)

---

## 📁 Project Structure

```
lib/
│
├── bloc/                 # Business Logic (Bloc)
├── data/
│   ├── models/           # Expense model
│   └── db/               # Local database (SQLite ready)
├── utils/                # Helpers (date formatter, colors)
├── view/
│   ├── home/            # Home screen & widgets
│   └── add_expense/     # Bottom sheet UI
```

---

## 🧠 Architecture

This project follows a **Clean Architecture inspired structure**:

```
UI → Bloc → (Repository) → Data Source
```

- UI handles user interaction
- Bloc manages business logic and state
- Data layer can be swapped (in-memory → SQLite → API)

---

## 🚀 Getting Started

### 1. Clone the project

```bash
git clone https://github.com/aungzarmyodev/personal_expense_tracker.git
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 💡 State Management Flow

- Add Expense → Bloc Event → State Updated
- Search Expense → Filtered Bloc State
- UI reacts automatically using BlocBuilder

---

## 🧪 Current Features Status

| Feature                 | Status         |
| ----------------------- | -------------- |
| Add Expense             | ✅             |
| Search Expense          | ✅             |
| Category Selection      | ✅             |
| Local Database (SQLite) | 🚧 In progress |
| Edit/Delete Expense     | 🚧 Planned     |

---
