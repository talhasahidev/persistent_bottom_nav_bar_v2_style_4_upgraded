<h1 align="center">
  <img src="https://img.shields.io/badge/📱-Style_4_Upgraded_Bottom_Nav_Bar-2962FF?style=for-the-badge" alt="Package Title" />
</h1>

<div align="center">
  
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen?style=flat-square)](https://pub.dev/packages/persistent_bottom_nav_bar_v2_style_4_upgraded)
[![Version](https://img.shields.io/badge/version-1.0.0-blue?style=flat-square)](https://pub.dev/packages/persistent_bottom_nav_bar_v2_style_4_upgraded)
[![Flutter](https://img.shields.io/badge/Flutter-Ready-02569B?style=flat-square&logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/license-GUI-purple?style=flat-square)](LICENSE)

### An Enhanced Style 4 Bottom Navigation Bar with Center Widget Support
*Based on persistent_bottom_nav_bar_v2 with exclusive focus on Style 4*

[Getting Started](#getting-started) •
[Documentation](#documentation) •
[Examples](#examples) •
[Features](#features)

</div>

---

<p align="center">
  <img src="https://raw.githubusercontent.com/jb3rndt/PersistentBottomNavBarV2/master/gifs/style4.gif" alt="Preview" width="300"/>
</p>
<p align="center">
<img src="https://github.com/user-attachments/assets/eeb88342-3310-41f2-9c07-000ab3b73f76" alt="Preview" width="300"/>
</p>
<p align="center">
<img src="https://github.com/user-attachments/assets/151b20ed-d3d3-4a73-89d7-a2481839d54b" alt="Preview" width="300"/>
</p>

## ✨ What's New in Style 4 Upgraded

- 🎯 **Center Widget Support** - Add a floating action button or custom widget in the center
- 🎨 **Direct Styling** - Pass styling properties directly to the navigation bar
- 🔄 **Animated Border Radius** - Customize the border animation
- 🎭 **Enhanced Foreground Colors** - Direct control over active and inactive colors
- 📝 **Improved Text Styling** - Direct text style customization

## 🚀 Quick Start

### 1. Add Dependency

```yaml
dependencies:
  persistent_bottom_nav_bar_v2_style_4_upgraded: ^1.0.0
```

### 2. Import Package

```dart
import 'package:persistent_bottom_nav_bar_v2_style_4_upgraded/persistent_bottom_nav_bar_v2_style_4_upgraded.dart';
```

### 3. Basic Implementation

```dart
PersistentTabView(
  tabs: [
    PersistentTabConfig(
      screen: HomeScreen(),
      item: ItemConfig(
        icon: Icon(Icons.home),
        title: "Home",
      ),
    ),
    PersistentTabConfig(
      screen: ProfileScreen(),
      item: ItemConfig(
        icon: Icon(Icons.person),
        title: "Profile",
      ),
    ),
  ],
  centerWidget: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  navBarBuilder: (navBarConfig) => Style4BottomNavBar(
    navBarConfig: navBarConfig,
    animatedBorderRadius: BorderRadius.circular(20),
    activeForegroundColor: Colors.blue,
    inactiveForegroundColor: Colors.grey,
    textStyle: TextStyle(fontSize: 12),
  ),
)
```

## 🎨 Style 4 Customization

```dart
Style4BottomNavBar(
  navBarConfig: navBarConfig,
  // Center Widget Options
  centerWidget: YourCustomWidget(),
  
  // Styling
  animatedBorderRadius: BorderRadius.circular(20),
  activeForegroundColor: Colors.blue,
  inactiveForegroundColor: Colors.grey,
  textStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),
  
  // Navigation Bar Decoration
  navBarDecoration: NavBarDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
      ),
    ],
  ),
)
```

## 💡 Pro Tips

1. **Center Widget**:
   ```dart
   // Adjust center widget position
   centerWidget: CustomWidget(), // Moves widget up
   ```

2. **Animated Border Control**:
   ```dart
   // Custom border animation
   animatedBorderRadius: BorderRadius.circular(30),
   ```

3. **Direct Styling**:
   ```dart
   // Pass styles directly to nav bar
   activeForegroundColor: Colors.blue,
   inactiveForegroundColor: Colors.grey,
   textStyle: TextStyle(fontSize: 14),
   ```

## 🔄 Migration from persistent_bottom_nav_bar_v2

If you're migrating from the original package, the main differences are:

1. Change import statement to use the new package
2. Update package name in pubspec.yaml
3. Add center widget support in Style4BottomNavBar
4. Use direct styling properties instead of ItemConfig

```dart
// Old way
ItemConfig(
  activeForegroundColor: Colors.blue,
  inactiveForegroundColor: Colors.grey,
)

// New way
Style4BottomNavBar(
  activeForegroundColor: Colors.blue,
  inactiveForegroundColor: Colors.grey,
)
```

## 🤝 Support

<div align="center">

[![Buy Me A Coffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/talhasahi)
[![Hire on Upwork](https://img.shields.io/badge/Hire_on_Upwork-6FDA44?style=for-the-badge&logo=upwork&logoColor=white)](https://www.upwork.com/freelancers/~01c846f88ea4efa042)

**Made with ❤️ by [talhasahidev](https://github.com/talhasahidev)**

</div>

## 📄 License

<<<<<<< HEAD
This project is licensed under the GUI License.
=======
This project is licensed under the GUI License.
>>>>>>> 93833694eebde36c3896e424aa8d6ba86ca0c981
