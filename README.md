# KISnackBar
  This is an easy to use alternative of Android snackbar for iOS.

## Demo
![KISnackBar Demo](https://github.com/KI-labs/ki-snackbar-dev/blob/master/KISnackBar.gif "KISnackBar Demo")


## Installation


### CocoaPods

For *KISnackBar*, use the following entry in your **Podfile**:

```rb
pod 'KISnackBar'
```

Then run `pod install` in your project directory.

Do not forget to import the framework with `import KISnackBar` in any file you'd like to use *KISnackBar*.

### Carthage

For *KISnackBar*, use the following entry in your **Cartfile**:

```
github "KI-labs/KISnackBar"
```

Run `carthage update` to build the framework and drag the built **KISnackBar.framework** into your Xcode project.

Do not forget to import the framework with `import KISnackBar` in any file you'd like to use *KISnackBar*.

### Manually

Add KISnackBar.swift to your project 🎉.


## Usage

```swift
KISnackBar.shared.show(title: "Transaction has been completed.", duration: .short)
``` 

```swift
KISnackBar.shared.show(title: "We need your permission.", buttonTitle: "Open Settings", 
			duration: .short) {			
    // Open Settings
}
``` 

```swift
KISnackBar.shared.show(backgroundColor: .black, title: "We need your permission.", titleColor: .white, 
			buttonTitle: "Open Settings", buttonTitleColor: .white, duration: .long) {
    // Open Settings
}
``` 

There is also an *Example* project in the repo which you can try *KISnackBar*


## License

KISnackbar is released under an MIT license. See [LICENSE](https://github.com/KI-labs/ki-snackbar-dev/blob/master/LICENSE) for more information.
