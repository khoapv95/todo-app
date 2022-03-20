# Todo App using Clean Architecture and MVVM

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network) + Persistence Storage
* **Presentation Layer (MVVM)** = ViewModels + Views

### Dependency Direction
![Alt text](https://raw.githubusercontent.com/kudoleh/iOS-Clean-Architecture-MVVM/master/README_FILES/CleanArchitectureDependencies.png)

## Includes
* MVVM
* DIContainer
* FlowCoordinator
* Programmatic UI without using XIB and Storyboard
* Data binding using Observable without third-party libraries

## References
* Clean Architecture https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
* Clean Architecture and MVVM on iOS https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3
* Advanced iOS App Architecture https://www.raywenderlich.com/8477-introducing-advanced-ios-app-architecture

## Requirements
* Xcode Version 13.0.0+  Swift 5.0+

## iOS version support
* iOS 13.0+
