### Day 2

1. Explain why standards can be beneficial to the Flow ecosystem.

When there is a standard, then someone who is interacting with a
lot of similar contracts does not have to have custom code for
each contract, but can know that each of the contracts has a
specific set of functions and resources with specific parameters.

Standards also make it easy to verify that a contract fulfills
the requirements that are expected of it.

2. What is YOUR favourite food?

When I was young, I really liked lasagna.  When a youth, I
decided that I actually liked chicken à la king more than
lasagna.  Currently, my favorite meal is a baked sweet potato
with butter, steamed cabbage with butter and black pepper, and
homemade ginger ale.

3. Please fix this code (Hint: There are two things wrong):

The contract interface:
```cadence
pub contract interface ITest {
  pub var number: Int
  
  pub fun updateNumber(newNumber: Int) {
    pre {
      newNumber >= 0: "We don't like negative numbers for some reason. We're mean."
    }
    post {
      self.number == newNumber: "Didn't update the number to be the new number."
    }
  }

  pub resource interface IStuff {
    pub var favouriteActivity: String
  }

  // If this contract interface has defined a resource interface,
  // it may be an oversight that it has not been included as a
  // requirement for this resource to adhere to.  The name of the
  // interface should be added after the name of the resource.
  // Our line should be:
  // pub resource Stuff: IStuff {
  pub resource Stuff {
    pub var favouriteActivity: String
  }
}
```

The implementing contract:
```cadence
pub contract Test {
  pub var number: Int
  
  pub fun updateNumber(newNumber: Int) {
    self.number = 5
    // The interface requires that we set self.number to the
    // value passed in as newNumber, and instead we are setting
    // self.number to 5.  The post condition on this function
    // in the ITest interface will abort the contract.
    // Our line should be:
    // self.number = newNumber
  }

  pub resource interface IStuff {
    pub var favouriteActivity: String
  }

  pub resource Stuff: IStuff {
    // If the IStuff interface defined an interface for this
    // resource to use, we would have to use that interface
    // (ITest.IStuff), though we could also use the one we
    // created in the contract.
    // Our line should be:
    // pub resource Stuff: ITest.IStuff {
    // or:
    // pub resource Stuff: ITest.IStuff, IStuff {
    pub var favouriteActivity: String

    init() {
      self.favouriteActivity = "Playing League of Legends."
    }
  }

  init() {
    self.number = 0
  }
}
```
