# StoryView Challenge with gradient Animation

iOS app challengeBuild an Instagram-like story bubbles with the following scenarios:
1. A circular ring with gradient color.
2. An image in the bubble
3. A progress animation when the bubble is clicked
4. The ring should change to a single color after the animation finishes.
5. Multiple bubbles

## 

![Platform](https://img.shields.io/badge/Platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/Language-Swift-orange.svg)

## Installation
- open LifeTap.xcworkproj. 
 - Select the iphone simulator & run it.


## Requirements

- iOS 14.0
- Xcode 12
- Swift 5

## Features
###  A circular ring with gradient color.

### An image in the bubble

### A progress animation when the bubble is clicked

- XCTestCase for UITesting.


## Design Pattern: Model-View-ViewModel (MVVM)
is a structural design pattern that separates objects into three distinct groups:
- #### Models 
  - hold application data. They’re usually structs or simple classes.
- #### Views 
  - display visual elements and controls on the screen. They’re typically subclasses of UIView.
- #### View models
  - transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.
  
  
  ## Improvements / Need to be done
- Due to time constraints, Didn't get a chance to complete Unitests & UITests.
- Images can be fetch from remote server.
- ImageCache Implementation can be for better perforamnce.


## Technology/Tools
- UIKit
- CAShapeLayer
- Collectionview
- Programmaticlly UI
- MVVM
- XCTestCase for unit tests and UI Tests.
- Xcode Instruments for memory leaks and allocations.

## Demo
![](lifetap.gif)
![](life.png)


