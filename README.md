# TicTacToe with AI Agent

![Tic Tac TOE with AI Agent](https://github.com/user-attachments/assets/e3bd870a-62f6-4da0-8b95-8e1d6c4d2475)

A Flutter-based Tic-Tac-Toe game enhanced with an AI opponent was built using GetX for state management and adhering to clean architecture principles.

---

## 🔍 About

TicTacTe is a classic Tic-Tac-Toe game built in Flutter that features a single/multi-player mode against an AI agent. The application leverages the GetX package for robust state management, routing, and dependency injection. The project follows a clean architecture to ensure maintainability, testability, and scalability.

---

## 🛠 Technologies

* **Flutter** – UI toolkit for building cross-platform applications
* **Dart** – Programming language
* **GetX** – State management, routing, dependency injection
* **AI Agent** – Minimax algorithm with heuristic scoring

---

## 🏗 Architecture

The project is structured according to clean architecture principles:

1. **Presentation Layer**: Widgets and GetX controllers handle user interaction and UI state.
2. **Domain Layer**: Defines entities (e.g., `Board`, `Player`) and use cases (e.g., `MakeMove`, `CheckWin`).
3. **Data Layer**: Implements repository interfaces and contains the AI agent logic (Minimax algorithm).

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -m 'Add some feature')
4. Push to the branch (`git push origin feature/new-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License.
