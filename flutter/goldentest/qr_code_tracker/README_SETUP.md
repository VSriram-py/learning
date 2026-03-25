# QR Code Expiration Tracker - Setup Guide

A cross-platform mobile application built with React Native and Expo that allows users to generate personalized QR codes with expiration dates.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Environment Variables](#environment-variables)
- [Running the App](#running-the-app)
- [Testing](#testing)
- [Building for Production](#building-for-production)
- [GitHub Actions CI/CD](#github-actions-cicd)
- [Project Structure](#project-structure)

## Features

- **Login Screen**: Users can enter their name to initialize the app
- **QR Code Generation**: Automatic generation of personalized QR codes containing user information
- **Expiration Tracking**: Clear display of QR code expiration dates (30 days by default)
- **Profile Management**: View user information and logout functionality
- **Cross-Platform**: Works seamlessly on iOS, Android, and web platforms
- **Responsive Design**: Optimized for mobile portrait orientation

## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js**: Version 18.x or higher
- **pnpm**: Version 9.12.0 or higher
- **Expo CLI**: For mobile development
- **Git**: For version control

### For iOS Development (macOS only)
- **Xcode**: Version 14 or higher
- **CocoaPods**: Ruby gem for iOS dependency management
- **iOS SDK**: Included with Xcode

### For Android Development
- **Java Development Kit (JDK)**: Version 17 or higher
- **Android SDK**: API level 31 or higher
- **Android Studio**: Optional but recommended

## Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd qr_code_tracker
   ```

2. **Install dependencies**:
   ```bash
   pnpm install
   ```

3. **Set up environment variables** (see [Environment Variables](#environment-variables) section)

## Environment Variables

Create a `.env` file in the project root with the following variables:

```env
# App Configuration
APP_VERSION=1.0.0
ENVIRONMENT=development

# QR Code Configuration
QR_CODE_EXPIRATION_DAYS=30
QR_CODE_ERROR_CORRECTION_LEVEL=M

# Logging
LOG_LEVEL=info
```

### Environment Variable Descriptions

| Variable | Description | Default |
|----------|-------------|---------|
| `APP_VERSION` | Current version of the application | 1.0.0 |
| `ENVIRONMENT` | Deployment environment (development, staging, production) | development |
| `QR_CODE_EXPIRATION_DAYS` | Number of days before QR code expires | 30 |
| `QR_CODE_ERROR_CORRECTION_LEVEL` | QR code error correction level (L, M, Q, H) | M |
| `LOG_LEVEL` | Logging level (debug, info, warn, error) | info |

## Running the App

### Development Mode

**Start the development server**:
```bash
pnpm dev
```

This will start both the Metro bundler and the backend server.

**Run on specific platforms**:

```bash
# iOS (macOS only)
pnpm ios

# Android
pnpm android

# Web
pnpm dev:metro
```

### Using Expo Go

1. Install **Expo Go** on your iOS or Android device
2. Run `pnpm dev:metro` to start the Metro bundler
3. Scan the QR code displayed in the terminal with Expo Go
4. The app will load on your device

## Testing

### Running All Tests

```bash
pnpm test
```

### Running Specific Test Files

```bash
# Environment variables tests
pnpm test __tests__/env.test.ts

# QR utilities tests
pnpm test __tests__/qr-utils.test.ts

# App context tests
pnpm test __tests__/app-context.test.ts
```

### Test Coverage

The project includes comprehensive unit tests covering:

- **Environment Variables**: Validation of all required environment variables
- **QR Code Utilities**: Date calculations, QR code generation, expiration logic
- **App Context**: State management and user session handling

### Running Tests in Watch Mode

```bash
pnpm test --watch
```

### Code Quality Checks

```bash
# Run ESLint
pnpm lint

# Run TypeScript type checking
pnpm check

# Format code with Prettier
pnpm format
```

## Building for Production

### Android Build

```bash
# Generate APK
pnpm expo prebuild --platform android --clean
cd android
./gradlew assembleRelease
```

The APK will be generated at: `android/app/build/outputs/apk/release/`

### iOS Build

```bash
# Generate iOS project
pnpm expo prebuild --platform ios --clean
cd ios

# Build with Xcode
xcodebuild -workspace QRCodeTracker.xcworkspace \
  -scheme QRCodeTracker \
  -configuration Release \
  -derivedDataPath build
```

## GitHub Actions CI/CD

This project includes three GitHub Actions workflows:

### 1. Unit Tests Workflow (`test.yml`)

Runs on every push and pull request to `main` and `develop` branches.

**What it does**:
- Installs dependencies
- Runs ESLint for code linting
- Runs TypeScript type checking
- Executes all unit tests
- Uploads coverage reports

**Trigger**: Push or PR to `main`/`develop`

### 2. Code Quality Workflow (`code-quality.yml`)

Runs on every push and pull request.

**What it does**:
- Checks code formatting with Prettier
- Validates TypeScript types
- Runs ESLint

**Trigger**: Push or PR to `main`/`develop`

### 3. Build Workflow (`build.yml`)

Builds the application for iOS and Android.

**What it does**:
- Runs all tests first
- Builds Android APK
- Builds iOS app
- Uploads build artifacts

**Trigger**: Push to `main` or creation of version tags (`v*`)

### Setting Up GitHub Actions

1. Push your code to GitHub
2. GitHub Actions will automatically detect the workflow files in `.github/workflows/`
3. Workflows will run on the specified triggers
4. Check the "Actions" tab in your GitHub repository to view workflow runs

### Viewing Workflow Results

- Go to the "Actions" tab in your GitHub repository
- Click on a workflow run to see detailed logs
- Download artifacts (APK, build logs) from the workflow summary page

## Project Structure

```
qr_code_tracker/
├── app/                          # App screens and navigation
│   ├── _layout.tsx              # Root layout with providers
│   ├── login.tsx                # Login screen
│   └── (tabs)/
│       ├── _layout.tsx          # Tab navigation layout
│       ├── home.tsx             # Home screen with QR code
│       └── profile.tsx          # Profile screen
├── lib/                          # Utility functions and context
│   ├── app-context.tsx          # State management context
│   ├── qr-utils.ts              # QR code utilities
│   ├── types.ts                 # TypeScript type definitions
│   └── theme-provider.tsx       # Theme management
├── components/                   # Reusable components
│   ├── screen-container.tsx     # SafeArea wrapper
│   └── ui/
│       └── icon-symbol.tsx      # Icon mapping
├── __tests__/                    # Test files
│   ├── env.test.ts              # Environment variables tests
│   ├── qr-utils.test.ts         # QR utilities tests
│   └── app-context.test.ts      # App context tests
├── .github/
│   └── workflows/               # GitHub Actions workflows
│       ├── test.yml             # Unit tests workflow
│       ├── code-quality.yml     # Code quality workflow
│       └── build.yml            # Build workflow
├── app.config.ts                # Expo configuration
├── package.json                 # Project dependencies
├── tsconfig.json                # TypeScript configuration
├── vitest.config.ts             # Vitest configuration
└── README_SETUP.md              # This file
```

## Key Files

### Core Application Files

- **`app/_layout.tsx`**: Root layout that sets up providers and navigation
- **`lib/app-context.tsx`**: React Context for global state management
- **`lib/qr-utils.ts`**: Utility functions for QR code generation and date handling

### Screen Components

- **`app/login.tsx`**: User login with name input
- **`app/(tabs)/home.tsx`**: Main screen displaying QR code and expiration date
- **`app/(tabs)/profile.tsx`**: User profile and logout

### Testing

- **`vitest.config.ts`**: Vitest configuration for unit tests
- **`__tests__/`**: Directory containing all test files

## Troubleshooting

### Common Issues

**Issue**: Dependencies not installing
```bash
# Clear cache and reinstall
pnpm store prune
pnpm install
```

**Issue**: Metro bundler not starting
```bash
# Clear Metro cache
pnpm expo start --clear
```

**Issue**: iOS build failing
```bash
# Clear iOS build cache
cd ios && rm -rf Pods Podfile.lock build
cd ..
pnpm expo prebuild --platform ios --clean
```

**Issue**: Android build failing
```bash
# Clear Android build cache
cd android && ./gradlew clean
cd ..
pnpm expo prebuild --platform android --clean
```

## Contributing

1. Create a new branch for your feature: `git checkout -b feature/your-feature`
2. Make your changes and commit: `git commit -am 'Add your feature'`
3. Push to the branch: `git push origin feature/your-feature`
4. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For issues, questions, or suggestions, please open an issue on the GitHub repository.
