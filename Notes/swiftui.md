# swift ui
## view?
What does these codes do?
```swift
struct ContentView: View {
    var body: some View {
        return Text("Hello, World!")
    }
}
```
it's basically saying to the compiler 
"go look in my code right here, figure out what it's returning, make sure that it behaves like a view, and then use that as the type of the body."

**what does "return Foreach(iteratablething, content:{})" say?**
+ it's going to iterate over this iteratable thing, and for each of the thing, it will build one of these views.

## MVVM Model-View-ViewModel
+ A "code organizing" architectural design paradigm.
+ Works in concert with the concept of "reactive" user-interfaces.
+ Must be **ahered to for swiftUI** to work.

MODEL
    UI independent
    Data + Logic --> "The truth"
    
↓            ↑
↓            ↑  notice changes in the model
↓ ViewModel  ↑  Binds View to Model, interpret 
↓            ↑  publish "something changed"  @ObservableObject, @Published
↓            ↑                               objectWillChange.send()
                                             .environmentObject()
                Process intent
                modify the model

VIEW (auto, observes, publications, pulls data and rebuilds)
    subscribes to the notification
    Reflects the Model
    stateless
    Declared (time independent)
    Reactive (reacting to changes in model)
    calls Intent function
```swift
@ObservedObject
@Binding
.onReceive
@EnvironmentObject
```
    
    //Old style ---> command mode (time dependent e.g. function calls)
    
## language

### struct
+ value type
+ copied when passed or assigned
+ copy on write
+ functional programming
+ "free" init initializes ALL vars
+ mutability must be explicitly stated
+ Your "goto" structure
+ everything so far is a struct (except View is a protocal)


### class
+ reference type
+ passed around via pointers
+ automatically reference counted (==0 free)
+ oop
+ inheritance (single)
+ "free" initializes NO vars
+ always mutable
+ Used in specific circumstances
+ The ViewModel in MVVM is always a class (also, UIKit (old style ios) is class-based)
private(set) self can modify, but anyone can see

### Generics
Example of a user of a "don't care" type: array
```swift
struct Array<Element> {
    ...
    func append(_ element: Element) {...}
}
var a = Array<int>() 
a.append(5);a.append(22)
// can have mutiple "don't cares"(type parameter), like <Element, Foo>
```

