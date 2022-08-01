### Day 1

1. In words, list 3 reasons why structs are different from resources.

- Resources cannot be copied (there can only be one copy at a
  time) and structs can be copied and have more than one copy in
  existance at a time.
- Resources cannot be accidentally deleted or lost and structs
  can be deleted much more easily.
- Resources can only be created within a contract and structs can
  be created in contracts, scripts, and transactions.

2. Describe a situation where a resource might be better to use than a struct.

If you have a piece of data that is very valuable, such as an
expensive NFT, and you want to make sure that you don't lose it
or duplicate it, you may want to use a resource instead of a
struct to store it.

3. What is the keyword to make a new resource?

create

4. Can a resource be created in a script or transaction (assuming there isn't a public function to create one)?

No.  A resource can only be created inside a contract.  You can
call a function defined in a contract that creates a resource, if
you need to create a resource from a transaction or script, so
long as that function is public.

5. What is the type of the resource below?

```cadence
pub resource Jacob {

}
```

That resource is of type `Jacob`.

6. Let's play the "I Spy" game from when we were kids. I Spy 4 things wrong with this code. Please fix them.

```cadence
pub contract Test {

    // Hint: There's nothing wrong here ;)
    pub resource Jacob {
        pub let rocks: Bool
        init() {
            self.rocks = true
        }
    }

    pub fun createJacob(): Jacob { // there is 1 here
        let myJacob = Jacob() // there are 2 here
        return myJacob // there is 1 here
    }
}
```

Corrected code:

```cadence
pub contract Test {

    // Hint: There's nothing wrong here ;)
    pub resource Jacob {
        pub let rocks: Bool
        init() {
            self.rocks = true
        }
    }

    pub fun createJacob(): @Jacob { // added @ symbol
        let myJacob <- create Jacob() // replaced = with <- and added keyword create
        return <- myJacob // added <-
    }
}
```
