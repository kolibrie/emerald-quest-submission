### Day 4

1. Explain, in your own words, the 2 things resource interfaces can be used for (we went over both in today's content)

Resources interfaces can be used to:
- Make sure that a Resource provides specific variables or
  functions.
- Limit which variables or functions are available through the
  interface (hiding the others defined in the Resource).

2. Define your own contract. Make your own resource interface and a resource that implements the interface. Create 2 functions. In the 1st function, show an example of not restricting the type of the resource and accessing its content. In the 2nd function, show an example of restricting the type of the resource and NOT being able to access its content.

See [cadence/Ordinals.cdc](cadence/Ordinals.cdc)

I verified that the contract runs (if we comment out the
`setLanguageViaInterface` function that tries to access the
resource function `setLanguage` that is not exposed
via the interface) with
[cadence/ReadOrdinal.cdc](cadence/ReadOrdinal.cdc) and
[cadence/SetLanguage.cdc](cadence/SetLanguage.cdc).

```sh
flow project deploy --network=emulator
flow scripts execute ./cadence/ReadOrdinal.cdc 1
flow scripts execute ./cadence/ReadOrdinal.cdc 4
flow transactions send ./cadence/SetLanguage.cdc French --network=emulator --signer=emulator-account
flow scripts execute ./cadence/ReadOrdinal.cdc 1
flow scripts execute ./cadence/ReadOrdinal.cdc 4
```

The output is:

```
Result: "1st"
Result: "4th"
Result: "1er"
Result: "4e"
```

3. How would we fix this code? 

```cadence
pub contract Stuff {

    pub struct interface ITest {
      pub var greeting: String
      pub var favouriteFruit: String
    }

    // ERROR:
    // `structure Stuff.Test does not conform 
    // to structure interface Stuff.ITest`
    pub struct Test: ITest {
      pub var greeting: String

      pub fun changeGreeting(newGreeting: String): String {
        self.greeting = newGreeting
        return self.greeting // returns the new greeting
      }

      init() {
        self.greeting = "Hello!"
      }
    }

    pub fun fixThis() {
      let test: Test{ITest} = Test()
      let newGreeting = test.changeGreeting(newGreeting: "Bonjour!") // ERROR HERE: `member of restricted type is not accessible: changeGreeting`
      log(newGreeting)
    }
}
```

Corrected version:

```cadence
pub contract Stuff {

    pub struct interface ITest {
      pub var greeting: String
      pub var favouriteFruit: String
      pub fun changeGreeting(newGreeting: String): String  // Added this function stub so the function will be accessible through the interface
    }

    pub struct Test: ITest {
      pub var greeting: String
      pub var favouriteFruit: String  // Added this variable so the struct matches the interface

      pub fun changeGreeting(newGreeting: String): String {
        self.greeting = newGreeting
        return self.greeting // returns the new greeting
      }

      init() {
        self.greeting = "Hello!"
      }
    }

    pub fun fixThis() {
      let test: Test{ITest} = Test()
      let newGreeting = test.changeGreeting(newGreeting: "Bonjour!")
      log(newGreeting)
    }
}
```
