# openIMIS Voucher Enquire app

Voucher Enquire app allows Inspectors to verify vouchers assigned to a specific Worker

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter toolchain [link](https://docs.flutter.dev/get-started/install)
- Android toolchain
  - Recommended way of installing Android SDK and toolset is to use Android Studio [link](https://developer.android.com/studio/install)

To check if you environment is set up for development make sure flutter binary is available from PATH
and run:

```bash
flutter doctor -v
```

The required components for the development and deployment of this app are 
- "Flutter"
- "Android toolchain"
- "Network Resources"

### Installation

To run this app in Android Studio:
- Clone this repository
- Ensure Dart and Flutter plugins are enabled
- Use the Import Project feature in Android Studio
- Choose create project from existing sources
- (optional) Set Flutter SDK path
- Open `voucher_enquire.pubspec.yaml` file
- Select `Pub get` option
- Run main.dart using Android Emulator or a real device

To run this app using command line tools:
- Clone this repository
- navigate to `voucher_enquire` module
- run `flutter pub get` to fetch the dependencies
- run `flutter devices` to show available devices (the second column is device_id)
- run `flutter run -d <device_id>` to run the app on a device

To create an apk file:
- Clone this repository
- navigate to `voucher_enquire` module
- run `flutter pub get` to fetch the dependencies
- run `flutter build apk --debug` or `flutter build apk --release` to build an apk
- navigate to `build/app/outputs/flutter-apk` to find the apk