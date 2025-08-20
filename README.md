<!-- LOGO -->

<p align="center">
  <img src="assets/logo/secunit-logo.png" alt="SecUnit Logo" width="128"/>
</p>

<h1 align="center">SecUnit: Campus Safety App</h1>

<p align="center">
  A comprehensive Flutter mobile app that enhances personal safety for students on university campuses.
</p>

<p align="center">
  <a href="#getting-started">Getting Started</a> •
  <a href="#features">Features</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#configuration--permissions">Configuration & Permissions</a> •
  <a href="#contributing">Contributing</a>
</p>

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-%3E%3D3.0-blue"/>
  <img alt="Platforms" src="https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-success"/>
  <img alt="License" src="https://img.shields.io/badge/License-MIT-lightgrey"/>
</p>

---

## Overview

**SecUnit** is a Flutter-based campus safety companion. It combines essential security tools with a clean, modern UI (supporting light and dark themes) to help students stay safe, informed, and connected during routine and urgent situations.

---

## Features

* 🤖 **AI Safety Chatbot**: Instantly answers safety-related questions. Recognizes keywords such as `SOS`, `escort`, `report`, `unsafe`, and more to provide guidance.
* 👤 **User Profiles**: Store your name, student ID, profile picture, and an emergency contact number.
* 🆘 **Emergency Contacts**: Maintain a quick-dial list for urgent situations.
* 📚 **Safety Resources**: Curated campus resources—security, health services, counseling, and key phone numbers.
* 🎨 **Professional UI + Dark Mode**: Clean, modern interface with light/dark themes.

> **Planned (Roadmap)**
>
> * 🔔 Push notifications for campus alerts
> * 🗺️ Campus map with safe routes & escorts
> * 📍 Optional live location share to trusted contacts
> * 🧠 On-device intent detection for offline guidance
> * 🧪 In-app incident reporting with photo attachments

---

## Screenshots

> *Add screenshots or screen recordings once available.*

```
assets/
└── screenshots/
    ├── home_light.png
    ├── home_dark.png
    ├── chatbot.png
    └── contacts.png
```

---

## Tech Stack & Key Packages

* **Flutter** (>= 3.x)
* **State Management**: `provider` – theme toggling and simple app state
* **Local Storage**: `shared_preferences` – profile data, settings, emergency contacts
* **Media**: `image_picker` – profile photos from gallery/camera
* **Dev Tooling**: `flutter_launcher_icons` – generate platform launcher icons

<details>
  <summary><strong>Example pubspec.yaml excerpt</strong></summary>

```yaml
dependencies:
  flutter: { sdk: flutter }
  provider: ^6.0.0
  shared_preferences: ^2.2.0
  image_picker: ^1.0.0

dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_icons:
```
