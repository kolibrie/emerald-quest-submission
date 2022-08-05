### Day 1

1. Describe what an event is, and why it might be useful to a client.

An event allows information to be broadcast to the outside world
when some action is performed in Cadence code.  This might be
useful when some action outside the blockchain should occur when
something on the blockchain happens, so that the outside resource
does not have to keep checking the blockchain for updates.

2. Deploy a contract with an event in it, and emit the event somewhere else in the contract indicating that it happened.

- See the `CircleCreated` event in the contract [cadence/Circles.cdc](cadence/Circles.cdc)

3. Using the contract in step 2), add some pre conditions and post conditions to your contract to get used to writing them out.

- See the `pre` and `post` conditions in the contract for step 2.

4. For each of the functions below (numberOne, numberTwo, numberThree), follow the instructions.

```cadence
pub contract Test {

  // TODO
  // Tell me whether or not this function will log the name.
  // name: 'Jacob'

  // Answer: If supplied with the value "Jacob" for the name, the pre condition
  // will be met because "Jacob" is 5 characters long, and the name will be logged.
  pub fun numberOne(name: String) {
    pre {
      name.length == 5: "This name is not cool enough."
    }
    log(name)
  }

  // TODO
  // Tell me whether or not this function will return a value.
  // name: 'Jacob'

  // Answer: If supplied with the value "Jacob" for the name, both the pre and post
  // conditions will be met and the function will return a value "Jacob Tucker".
  // If given any other value for the name, the post condition will not be met and
  // the contract will be aborted.
  pub fun numberTwo(name: String): String {
    pre {
      name.length >= 0: "You must input a valid name."
    }
    post {
      result == "Jacob Tucker"
    }
    return name.concat(" Tucker")
  }

  pub resource TestResource {
    pub var number: Int

    // TODO
    // Tell me whether or not this function will log the updated number.
    // Also, tell me the value of `self.number` after it's run.

    // Answer: The function will fail on the post condition.  The result
    // would be the previous value (0) plus 1 which equals 1.  The post
    // condition verifies that the previous value (0) equals the result (1)
    // plus 1 which equals 2, so the post condition will fail.
    // The value of `self.number` will stay at the previous value (0) and
    // the contract will be aborted without writing to the blockchain.
    pub fun numberThree(): Int {
      post {
        before(self.number) == result + 1
      }
      self.number = self.number + 1
      return self.number
    }

    init() {
      self.number = 0
    }

  }

}
```
