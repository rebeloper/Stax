# Stax

**Stax** is a lightweight library that leverages Auto Layout, UIStackViews and UIScrollViews to build out your UI programmatically with just a few lines of code.

## Installation
### Swift Package Manager
Using <a href="https://swift.org/package-manager/" rel="nofollow">Swift Package Manager</a>, add it as a Swift Package in Xcode 11.0 or later, `select File > Swift Packages > Add Package Dependency...` and add the repository URL:
```
https://github.com/rebeloper/Stax.git
```
### Manual Installation
Download and include the `Stax` folder and files in your codebase.

### Requirements
- iOS 11
- Swift 5

## Concept
`Stax` uses the idea of laying out your views entirely with **Stacks**. Under the hood it uses `UIStackView`s to create horizontal or vertical stacks. You may set any of these **Stacks** to be scrollable. **Stacks** are nestable and follow a declarative writing style. As a bonus you may also center a view inside another one.

## Features
- [X] Pure Swift 5 sweetness.
- [X] Everything you can do with Auto Layout, but shorter.
- [X] Constraints are active by default.
- [X] 100% compatible with other Auto Layout code.
- [X] No need to set `translatesAutoresizingMaskIntoConstraints` because `Stax` does it for you.
- [X] Leverages the power of `UIScrollView` and `UIStackView`.
- [X] Lay out views with Stacks **only**. 
- [X] Write UI code in a declarative way (much like in `SwiftUI`).
- [X] Easy-to-understand usage.
- [X] No external dependencies.
- [X] 100% Documented.

## How To Use
### Import

Import `Stax` into your `ViewController`

```
import Stax
```

### 
