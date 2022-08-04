### Day 2

1. What does `.link()` do?

`.link()` allows a reference to be made available at either the
`/public` or `/private` storage path.  The resource still lives
in `/storage` and a reference is available at the other path.

2. In your own words (no code), explain how we can use resource interfaces to only expose certain things to the `/public/` path.

When you call `.link()`, you can specify an interface to a
resource, which will only make the interface available at the
`/public` (or `/private`) path you specify, instead of making a
reference to the actual resource available.  Then when people
read from the `/public` path, they are accessing the interface,
and cannot access variables or functions which are not exposed
via the interface.

3. Deploy a contract that contains a resource that implements a resource interface. Then, do the following:

    1) In a transaction, save the resource to storage and link it to the public with the restrictive interface.

    2) Run a script that tries to access a non-exposed field in the resource interface, and see the error pop up.

    3) Run the script and access something you CAN read from. Return it from the script.

- See the contract at [cadence/Circles.cdc](cadence/Circles.cdc)
- See the transaction which creates the resource at [cadence/CreateCircle.cdc](cadence/CreateCircle.cdc)
- See the script reading a non-exposed field at [cadence/ReadNonExposedField.cdc](cadence/ReadNonExposedField.cdc)
- See the script reading an exposed field at [cadence/ReadExposedField.cdc](cadence/ReadExposedField.cdc)

```sh
flow project deploy --network=emulator
flow transactions send ./cadence/CreateCircle.cdc 17 --network=emulator --signer=emulator-account
flow scripts execute ./cadence/ReadNonExposedField.cdc
flow scripts execute ./cadence/ReadExposedField.cdc
```
