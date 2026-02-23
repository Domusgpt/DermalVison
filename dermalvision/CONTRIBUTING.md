# Contributing to DermalVision

Thank you for your interest in contributing to DermalVision! We aim to build the world's most accessible and accurate skin health platform.

## Getting Started

1.  **Fork the Repository:** Create your own fork of the project.
2.  **Clone Locally:**
    ```bash
    git clone https://github.com/your-username/dermalvision.git
    cd dermalvision
    ```
3.  **Install Dependencies:**
    ```bash
    flutter pub get
    cd functions && npm install
    ```

## Development Workflow

1.  **Create a Branch:** Use a descriptive name (e.g., `feat/camera-focus-fix`, `fix/auth-crash`).
2.  **Make Changes:** Follow our coding standards (see below).
3.  **Run Tests:**
    ```bash
    flutter test
    flutter analyze
    ```
4.  **Commit:** Use [Conventional Commits](https://www.conventionalcommits.org/).
    - `feat: add new shader`
    - `fix: resolve login timeout`
    - `docs: update API.md`
5.  **Push & PR:** Push to your fork and open a Pull Request against our `main` branch.

## Coding Standards

### Dart / Flutter
- **Style:** Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).
- **Formatting:** Use `dart format .` before committing.
- **Linting:** Ensure `flutter analyze` passes with zero warnings.
- **Architecture:** We use Riverpod + GoRouter + Repository Pattern.
  - Logic belongs in Providers/Repositories, not UI Widgets.
  - Use `freezed` for data models.

### TypeScript (Cloud Functions)
- **Style:** Use ESLint with the provided config.
- **Types:** Strict typing is enforced. No `any`.

## Testing Requirements
- **Unit Tests:** Required for all business logic (Repositories, Providers, Parsers).
- **Widget Tests:** Required for complex UI components.
- **Integration Tests:** Required for new end-to-end flows.

## Code of Conduct
Please note that this project is released with a [Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms. Be respectful, inclusive, and professional.

## License
By contributing, you agree that your contributions will be licensed under the project's [LICENSE](LICENSE).
