# flutter_seed 🌱

> ⚡ **FR version below / English version after** ⚡

---

## 🇫🇷 Sommaire
- [Présentation](#présentation)
- [✨ Fonctionnalités](#-fonctionnalités)
- [📂 Structure du projet](#-structure-du-projet)
- [🚀 Démarrage rapide](#-démarrage-rapide)
- [🔄 Renommer le projet](#-renommer-le-projet)
- [🔧 Packages principaux](#-packages-principaux)
- [🌐 Localisation](#-localisation)
- [⚠️ Fichiers Firebase](#️-fichiers-firebase)
- [📜 Licence](#-licence)

---

## Présentation
**flutter_seed** est une application Flutter **starter** légère, conçue pour servir de base à vos projets.  
Elle inclut déjà la navigation, la gestion du thème, de la langue, l’analytics, et une architecture claire.

---

## ✨ Fonctionnalités
- 📱 **Responsive UI** avec flutter_sizer
- 🧭 **Navigation** avec GoRouter
- 🌐 **Localisation** avec easy_localization (multi-langues : EN, FR, ES incluses)
- 🎨 **Thèmes** (couleurs, typographie, espacements centralisés)
- 📊 **Firebase Analytics**
- 📝 **Logger** pour un débogage propre
- 🗂️ **Architecture scalable** prête à cloner

---

## 📂 Structure du projet
```text
lib/
├── pages/        # Écrans (Home, Settings, Placeholder...)
├── widgets/      # Composants réutilisables
├── models/       # Modèles de données
├── services/     # Intégrations (analytics, API, etc.)
├── utils/        # Helpers, constantes, thème
└── main.dart     # Point d’entrée
```

---

## 🚀 Démarrage rapide

### Prérequis
- Flutter SDK installé
- Dart SDK (inclus avec Flutter)
- XCode / Android Studio configurés

### Installation & lancement
```bash
git clone https://github.com/LouisMinguet/flutter_seed.git
cd flutter_seed
flutter pub get
flutter run
```

---

## 🔄 Renommer le projet

Si vous clonez ce dépôt, vous devez le personnaliser.

### 1. Renommer le dossier
```bash
mv flutter_seed my_new_app
cd my_new_app
```

### 2. Modifier pubspec.yaml
```yaml
name: my_new_app
description: My awesome Flutter project
```

### 3. Modifier l’identifiant Android/iOS
```bash
flutter pub global activate rename
rename setAppName --targets ios,android "App Name"
rename setBundleId --targets android,ios com.mycompany.mynewapp
```

---

## 🔧 Packages principaux
- `go_router`
- `flutter_sizer`
- `logger`
- `easy_localization`
- `firebase_core`, `firebase_analytics`

---

## 🌐 Localisation
Les traductions sont gérées via **easy_localization**.  
Exemple d’utilisation :
```dart
Text('settings.title'.tr())
```

---

## ⚠️ Fichiers Firebase
⚠️ **Ne commitez jamais vos fichiers Firebase réels**.  
Ajoutez ces fichiers au `.gitignore` :

```gitignore
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
lib/firebase_options.dart
```

---

## 📜 Licence
MIT — libre d’utilisation, modification et distribution.

---

---

# 🇬🇧 English version

---

## Table of Contents
- [Overview](#overview)
- [✨ Features](#-features)
- [📂 Project structure](#-project-structure)
- [🚀 Getting started](#-getting-started)
- [🔄 Rename the project](#-rename-the-project)
- [🔧 Core packages](#-core-packages)
- [🌐 Localization](#-localization)
- [⚠️ Firebase files](#️-firebase-files)
- [📜 License](#-license)

---

## Overview
**flutter_seed** is a lightweight Flutter **starter app**, designed to serve as a base for your projects.  
It already includes navigation, theming, localization, analytics, and a clear architecture.

---

## ✨ Features
- 📱 **Responsive UI** with flutter_sizer
- 🧭 **Navigation** with GoRouter
- 🌐 **Localization** with easy_localization (multi-language: EN, FR, ES included)
- 🎨 **Theming** (colors, typography, spacing centralized)
- 📊 **Firebase Analytics**
- 📝 **Logger** for clean debugging
- 🗂️ **Scalable architecture** ready to clone

---

## 📂 Project structure
```text
lib/
├── pages/        # Screens (Home, Settings, Placeholder...)
├── widgets/      # Reusable components
├── models/       # Data models
├── services/     # Integrations (analytics, API, etc.)
├── utils/        # Helpers, constants, theme
└── main.dart     # Entry point
```

---

## 🚀 Getting started

### Prerequisites
- Flutter SDK installed
- Dart SDK (bundled with Flutter)
- XCode / Android Studio configured

### Install & run
```bash
git clone https://github.com/LouisMinguet/flutter_seed.git
cd flutter_seed
flutter pub get
flutter run
```

---

## 🔄 Rename the project

If you clone this repository, you need to customize it.

### 1. Rename the folder
```bash
mv flutter_seed my_new_app
cd my_new_app
```

### 2. Edit pubspec.yaml
```yaml
name: my_new_app
description: My awesome Flutter project
```

### 3. Update Android/iOS identifiers
```bash
flutter pub global activate rename
rename setAppName --targets ios,android "App Name"
rename setBundleId --targets android,ios com.mycompany.mynewapp
```

---

## 🔧 Core packages
- `go_router`
- `flutter_sizer`
- `logger`
- `easy_localization`
- `firebase_core`, `firebase_analytics`

---

## 🌐 Localization
Translations are handled with **easy_localization**.  
Example usage:
```dart
Text('settings.title'.tr())
```

---

## ⚠️ Firebase files
⚠️ **Never commit your real Firebase config files**.  
Add these files to `.gitignore`:

```gitignore
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
lib/firebase_options.dart
```

---

## 📜 License
MIT — free to use, modify and distribute.  
