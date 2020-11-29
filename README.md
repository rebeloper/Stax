# 🥞 Stax

**Stax** is a lightweight library that leverages Auto Layout, UIStackViews and UIScrollViews to build out your UI programmatically with just a few lines of code.

## 💻 Installation
### 📦 Swift Package Manager
Using <a href="https://swift.org/package-manager/" rel="nofollow">Swift Package Manager</a>, add it as a Swift Package in Xcode 11.0 or later, `select File > Swift Packages > Add Package Dependency...` and add the repository URL:
```
https://github.com/rebeloper/Stax.git
```
### ✊ Manual Installation
Download and include the `Stax` folder and files in your codebase.

### 📲 Requirements
- iOS 11
- Swift 5

## 👑 Concept
`Stax` uses the idea of laying out your views entirely with **Stacks**. Under the hood it uses `UIStackView`s to create horizontal or vertical stacks. You may set any of these **Stacks** to be scrollable. **Stacks** are nestable and follow a declarative writing style. As a bonus you may also center a view inside another one.

## 🧳 Features
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

## 🛠 How To Use
### 👉 Import

Import `Stax` into your `ViewController`

```
import Stax
```

### 📚 A word about how `UIStackViews` work and `size` setting with `Stax`

`UIStackViews` are pull-in views: they take up the least amount of space from their parent view filling themselves with the least amount of space that their arranged subviews need. Thus it's crucial that all views added to the **Stack** have their own size. Some views do have an intrisic size (a size set automatically upon initialization): `UIButton`, `UILabel`. But not all views have an intrinsic size: `UIView`, `UIImageView`. So here are the ways we can set size in `Stax`

### 📏 Size

```
lazy var view0 = UIView(backgroundColor: .systemRed).width(self.view.frame.size.width)
let view1 = UIView(backgroundColor: .systemRed).width(600)
let view2 = UIView(backgroundColor: .systemRed).height(600)
let view3 = UIView(backgroundColor: .systemRed).square(100)
```

Note: if we want to get acces to `self` when we create these views they must be `lazy var`. Also take a look at the "cool" new way to initialize a `UIView` with a background color.

Here are the views that we are going to use in this tutorial:

```
lazy var view1 = UIView(backgroundColor: .systemYellow).width(self.view.frame.size.width)
lazy var view2 = UIView(backgroundColor: .systemTeal).size(width: self.view.frame.size.width, height: 600)
lazy var view3 = UIView(backgroundColor: .systemRed).width(self.view.frame.size.width)
let view4 = UIView(backgroundColor: .systemRed).height(600)
let view5 = UIView(backgroundColor: .systemYellow).square(100)
let view6 = UIView(backgroundColor: .systemTeal).square(100)
let view7 = UIView(backgroundColor: .systemGray).square(100)
let view8 = UIView(backgroundColor: .systemPink).height(150)
let view9 = UIView(backgroundColor: .systemGray2).square(150)
let view10 = UIView(backgroundColor: .systemGray5).square(150)
let view11 = UIView(backgroundColor: .systemGray5).height(50)
let view12 = UIView(backgroundColor: .systemGray4).height(50)
let view13 = UIView(backgroundColor: .systemGray3).height(50)
```

### 👈👉 Spacer

Since `UIStackView` is a pull-in view we will need a push-out view in order to use them more efficiently. This is where `Spacer` comes in. It is an empty `UIView` that can push views. Here's an example of a `Spacer` pushing `view2` to the top in this `VStack` layed out in the view controller's `view`. (Don't worry about understanding the stack or the layout. We'll talk about them soon enough.)

```
VStack(
    view2,
    Spacer()
).layout(in: view)
```

Spacers may also have `width` and/or  `height`:

```
VStack(
    Spacer(height: 400).backgroundColor(.systemOrange),
    Spacer()
).layout(in: view)
```

```
HStack(
    Spacer(width: 400).backgroundColor(.systemOrange),
    Spacer()
).layout(in: view)
```

### 🎨 Background color

When you build out views with `Stax` you may not properly evaluate where the stack's views are layed out exactly. To make our lives easier we can just simply add background colors.

```
// UIView
view1.backgroundColor(.systemOrange)
```

```
// UIStackView
VStack(
    view2,
    Spacer()
).background(color: .systemBlue)
```

```
// UIScrollView
VStack(
    Spacer()
).scrolls(.vertical)
.background(color: .systemGreen)
```

### 🍩 Centering

The second most important part in laying out UI in `Stax` besides stacking is centering a view inside a parent view. Centering has to be done outside of the main stack. See the example view controller below.

```
// center a view inside a view
view7.center(in: view4, offset: CGPoint(x: -50, y: -50))
```

```
// center a Stack inside a view
HStack(view5, view6).center(inside: view, offset: CGPoint.right(50))
```

```
// center a Scrolling Stac (Scroll View) inside a view
// this time we need to set the size of the scroll view's container view
HStack(view5, view6).scrolls(.horizontal).center(inside: view, size: CGSize(width: 100, height: 100))
```

### 🍔 Stacks

There are two type of Stacks in `Stax`: `VStack` and `HStack` (Vertical Stack and Horizontal Stack).
The way we add a stack onto any view is laying it with `layout(in:)`. Usually this is done only once with the main Stack layed out in the view controller's view. You may also lay out with taking the safe area into acount.

```
VStack(
    view2,
    view4,
    Spacer()
).layout(in: view)
```

```
HStack(
    view2,
    Spacer(),
    view1
).layout(in: view, withSafeArea: true)
```

Note: `view2` has a `size` set. The `Spacer` in the `HStack` is pushing the two views out to the sides of the screen.

You can have stacks within stacks.

```
VStack(
    HStack(view1, view2, view3)
    VStack(view11, view12, view13),
    Spacer(height: 4).backgroundColor(.systemOrange)
).layout(in: view)
```

### 📜 Scrolling

You can enable scrolling with one line.

```
VStack(
    HStack(view1, view2, view3)
    VStack(view11, view12, view13),
    Spacer(height: 400).backgroundColor(.systemOrange)
).scrolls(.vertical).layout(in: view)

VStack(
    HStack(view1, view2, view3)
    VStack(view11, view12, view13),
    Spacer(height: 400).backgroundColor(.systemOrange)
).scrolls().layout(in: view) // the default value of scrolls is .vertical
```

```
HStack(
    view2,
    Spacer(width: 400).backgroundColor(.systemOrange),
    view1
).scrolls(.horizontal).layout(in: view)
```

### 👉👈 Spacing

Spacing between the stack elements is also simple.

```
// sets a default spacing of 8
VStack(view11, view12, view13).spacing()
```

```
// sets a spacing of 25
VStack(view11, view12, view13).spacing(25)
```

### 🌅 Padding

Padding can be added to any `Stack` or `ScrollView`.

```
// sets a default padding of 8 to all sides of the Stack
VStack(
    view2,
    Spacer()
)/*.scrolls()*/.padding()
```

```
// sets a padding of 12 to all sides of the Stack
VStack(
    view2,
    Spacer()
)/*.scrolls()*/.padding(by: 12)
```

```
// sets a padding with an UIEdgeInsets
VStack(
    view2,
    Spacer()
)/*.scrolls()*/.padding(UIEdgeInsets(top: 12, left: 24, bottom: 0, right: 24))
```

```
// sets a default top padding of 8; options are available for all sides of the Stack
VStack(
    view2,
    Spacer()
)/*.scrolls()*/.padding(.top)
```

```
// sets a bottom padding of 24; options are available for all sides of the Stack
VStack(
    view2,
    Spacer()
)/*.scrolls()*/.padding(.bottom, 24)
```

### ⚙️ Scrolling Options

We can set basic options on the `ScrollView`:

```
// paging; make sure all view widths have the screen width
HStack(view1, view2, view3).scrolls(.horizontal).pages()

// hide the scroll indicator
HStack(view1, view2, view3).scrolls(.horizontal).hidesScrollIndicator()

// show the scroll indicator
HStack(view1, view2, view3).scrolls(.horizontal).showsScrollIndicator()

// bounces
HStack(view1, view2, view3).scrolls(.horizontal).bounces(false)
```

### 🦾 Auto-scrolling

We can also automatically scroll to a specific view. You might want to delay the scroll by `0.05` when you are scrolling upon initializing the view controller. Default `delay` is `0`. Default `animated` is `true`. You must specifiy the `axis` of the scroll.

```
HStack(view5, view6)
    .scrolls(.horizontal)
    .scroll(to: view6, axis: .horizontal, delay: 2)
```

We can set the scroll to a type. On an `HStack` we may use `.toLeft` and `.toRight`. On a `VStack` we may use `toTop` and `toBottom`.

```
HStack(view5, view6)
    .scrolls(.horizontal)
    .scroll(.toLeft, delay: 3)
```

This how we get rid of the scroll animation and jump straigth to where we want to.

```
HStack(view5, view6)
    .scrolls(.horizontal)
    .scroll(.toLeft, delay: 3, animated: false)
```

### ⚙️ Stack Options

Stacks are configure for easy layout and it is not advised to chage thes options only when you know what you're doing.

```
VStack(
    ...
)
.axis(.vertical) // optionally set stack axis; default is: .vertical
.alignment(.fill) // optionally set stack alignment; default is: .fill
.distribution(.fill) // optionally set stack distribution; default is: .fill
```

### 🤖 Access the main stack

You might want to access the main stack later on in the lifecycle of the app. Till now we added our main stack in the `viewDidLoad()` but you may also declare it as a `lazy var`. So now you can acces it in the whoe view controller.

```
lazy var ui =
    VStack(
        ...
    ).layout(in: view, withSafeArea: true)
    
...

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    ui.scroll(to: view6, axis: .vertical, offset: 20, delay: 0.5)
}
```

### 📱 Example

Here is an in depth example view controller detailing all of the features of `Stax`

```
import UIKit
import Stax

class ViewController: UIViewController {
    
    lazy var view1 = UIView(backgroundColor: .systemYellow).width(self.view.frame.size.width)
    lazy var view2 = UIView(backgroundColor: .systemTeal).size(width: self.view.frame.size.width, height: 600)
    lazy var view3 = UIView(backgroundColor: .systemRed).width(self.view.frame.size.width)
    let view4 = UIView(backgroundColor: .systemRed).height(600)
    let view5 = UIView(backgroundColor: .systemYellow).square(100)
    let view6 = UIView(backgroundColor: .systemTeal).square(100)
    let view7 = UIView(backgroundColor: .systemGray).square(100)
    let view8 = UIView(backgroundColor: .systemPink).height(150)
    let view9 = UIView(backgroundColor: .systemGray2).square(150)
    let view10 = UIView(backgroundColor: .systemGray5).square(150)
    let view11 = UIView(backgroundColor: .systemGray5).height(50)
    let view12 = UIView(backgroundColor: .systemGray4).height(50)
    let view13 = UIView(backgroundColor: .systemGray3).height(50)
    
    lazy var ui =
        VStack(
            HStack(view1, view2, view3).scrolls(.horizontal).padding(.horizontal, 100).pages(),
            VStack(view4).background(color: .systemBlue).padding(.vertical, 200),
            HStack(view9, Spacer(), view10),
            view8,
            VStack(view11, view12, view13).spacing(),
            Spacer(height: 400).backgroundColor(.systemOrange)
        ).spacing(12)
        //        .axis(.vertical)
        //        .alignment(.fill)
        //        .distribution(.fill)
        .scrolls(.vertical)
        .background(color: .systemGreen)
        .padding(.bottom, 50)
        .layout(in: view, withSafeArea: true)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        HStack(view5, view6)
            .background(color: .systemGray)
            .scrolls(.horizontal)
            .hidesScrollIndicator()
            .scroll(to: view6, axis: .horizontal, delay: 2)
            .scroll(.toLeft, delay: 3)
            .center(inside: view4, size: CGSize(width: 100, height: 100), offset: CGPoint.right(100))

        view7.center(in: view4, offset: CGPoint(x: -50, y: -50))

        ui.scroll(to: view6, axis: .vertical, offset: 20, delay: 0.5)
            .scroll(.toBottom, delay: 5)
            .scroll(.toTop, delay: 7, animated: false)
        
    }
}
```

## ✍️ Contact

<a href="http://rebeloper.com/">rebeloper.com</a> / 
<a href="http://www.youtube.com/rebeloper/">YouTube</a> / 
<a href="http://store.rebeloper.com/">Shop</a> / 
<a href="http://rebeloper.com/mentoring">Mentoring</a>

## 📃 License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
