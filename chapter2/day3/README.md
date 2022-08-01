### Day 3

1. In a script, initialize an array (that has length == 3) of your favourite people, represented as `String`s, and `log` it.

See [cadence/array.cdc](cadence/array.cdc)

```sh
flow scripts execute ./cadence/array.cdc
```

2. In a script, initialize a dictionary that maps the `String`s Facebook, Instagram, Twitter, YouTube, Reddit, and LinkedIn to a `UInt64` that represents the order in which you use them from most to least. For example, YouTube --> 1, Reddit --> 2, etc. If you've never used one before, map it to 0!

See [cadence/dictionary.cdc](cadence/dictionary.cdc)

```sh
flow scripts execute ./cadence/dictionary.cdc
```

3. Explain what the force unwrap operator `!` does, with an example different from the one I showed you (you can just change the type).

The force unwrap operator `!` causes a value to no longer be
allowed to be an undefined value.  For instance, if the value
must be either a String or nil, and you apply the force unwrap
operator, then the value must be a String and cannot be nil, or
else it will throw an error.

```cadence
let undefinedThing: String? = nil
let definedThing: String? = "Hello World!"

var stringThing: String = definedThing!
var blowsUp: String = undefinedThing!
```

4. 4. Using this picture below, explain...
    - What the error message means
    - Why we're getting this error
    - How to fix it

<img src="https://github.com/emerald-dao/beginner-cadence-course/raw/main/chapter2.0/images/wrongcode.png" alt="drawing" size="400" />

The error message means that the function expected to return a
String, but instead is returning a value that could be either a
String or nil (type 'String?' instead of type 'String').

We are getting this error because Dictionaries return Optionals
types, which are allowed to either hold a value or nil, and we
are returning that value without unwrapping the Optional type.

We can fix the error either by changing the signature of the
function so that it expects to return a value of type 'String?'
instead of type 'String', or by unwrapping the return value by
appending an exclamation point `!`.

In other words, change the signature from:

```cadence
pub fun main(): String {}
```

to

```cadence
pub fun main(): String? {}
```

or change the return value from:

```cadence
return thing[0x03]
```

to

```cadence
return thing[0x03]!
```
