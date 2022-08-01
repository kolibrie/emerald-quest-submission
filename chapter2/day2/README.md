### Day 2

1. Explain why we wouldn't call `changeGreeting` in a script.

Scripts are just used to read data from the blockchain.  Since
changeGreeting is used for writing data to the blockchain, it
must go in a transaction.

2. What does the `AuthAccount` mean in the `prepare` phase of the transaction?

The `AuthAccount` in the prepare phase of the transaction means
that we are making the account information from the user
available for use in the transaction (after the user approves it).

3. What is the difference between the `prepare` phase and the `execute` phase in the transaction?

The prepare phase is for gathering all the information we need
from the account.  The execute phase is for updating information
on the blockchain.

4. 

- See [cadence/HelloWorld.cdc](cadence/HelloWorld.cdc) for the addition of myNumber. 
- See [cadence/ReadHelloWorldNumber.cdc](cadence/ReadHelloWorldNumber.cdc) for reading the value of myNumber.
- See [cadence/WriteHelloWorldNumber.cdc](cadence/WriteHelloWorldNumber.cdc) for updating the value of myNumber.

```sh
cd chapter2/day2
flow project deploy --network=emulator
flow scripts execute ./cadence/ReadHelloWorldNumber.cdc
flow transactions send ./cadence/WriteHelloWorldNumber.cdc 2 --network=emulator --signer=emulator-account
flow scripts execute ./cadence/ReadHelloWorldNumber.cdc
```
