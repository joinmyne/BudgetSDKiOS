# BudgetSDK

A comprehensive iOS SDK for building financial applications with modular budget management components.

## Features

### Core Modules
- **SpendingModule**: Transaction analysis, categorization, and spending insights
- **CashFlowModule**: Income/expense tracking and cash flow visualization
- **SavingGoalsModule**: Goal creation, progress tracking, and achievement monitoring
- **SpendingLimitsModule**: Budget limits, spending controls, and limit management

### Key Capabilities
- 🎨 **Dynamic Theming**: Customizable appearance system with color and typography management
- 🌍 **Multi-Language Support**: Built-in localization with runtime language switching
- 📱 **SwiftUI & UIKit**: Native integration for both frameworks
- 🔒 **Module Access Control**: Granular permission system for feature access
- 📊 **Rich UI Components**: Pre-built financial widgets and visualization components

## Installation

### Swift Package Manager

Add BudgetSDK to your project using Xcode:

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/joinmyne/BudgetSDK-iOS.git`
3. Select the version and add to your target

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/joinmyne/BudgetSDK-iOS.git", from: "1.0.0")
]
```

## Quick Start

### 1. Configure the SDK

```swift
import BudgetSDK

// Configure in your AppDelegate or App struct
Budget.shared.configure(with: BudgetSDKConfiguration(
    apiKey: "your-api-key",
    environment: .sandbox,
    enableLogging: true,
    localizationTableName: "CustomLocalizable", // Optional
    locale: Locale(identifier: "en") // Optional
))
```

### 2. Customize Appearance (Optional)

```swift
// Customize colors
Budget.appearance.colors.setColor(\.brand, .init(light: UIColor.systemBlue))

// Apply custom fonts
Budget.appearance.typography.applyCustomFont("SF Pro Display")
```

### 3. Use Modules in SwiftUI

```swift
import SwiftUI
import BudgetSDK

struct ContentView: View {
    var body: some View {
        VStack {
            // Spending Dashboard
            if let spendingModule = Budget.shared.spendingModule {
                spendingModule.dashboardView()
            }
            
            // Cash Flow Widget
            if let cashFlowModule = Budget.shared.cashFlowModule {
                cashFlowModule.dashboardView()
            }
        }
    }
}
```

### 4. Use Modules in UIKit

```swift
import UIKit
import BudgetSDK

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Spending Module
        if let spendingModule = Budget.shared.spendingModule {
            let spendingView = spendingModule.dashboardView()
            let hostingController = UIHostingController(rootView: spendingView)
            
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.didMove(toParent: self)
            
            // Set up constraints
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
}
```

## Module Access Control

Modules are only accessible if granted through configuration. Each module returns `nil` if access is not permitted:

```swift
// Check module availability
if let spendingModule = Budget.shared.spendingModule {
    // Module is available and accessible
    let dashboardView = spendingModule.dashboardView()
} else {
    // Module access not granted or unavailable
    print("Spending module not accessible")
}
```

## Localization

### Runtime Language Switching

```swift
// Change language dynamically
Budget.shared.setLanguage("ar") // Arabic
Budget.shared.setLanguage("en") // English
```

### Custom Localization Tables

```swift
// Use your own localization files
Budget.shared.configure(with: BudgetSDKConfiguration(
    apiKey: "your-key",
    localizationTableName: "MyCustomLocalizable"
))
```

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+

## Support

For technical support and documentation, please refer to your SDK provider or contact support through the appropriate channels.

## License

This SDK is proprietary software. All rights reserved.