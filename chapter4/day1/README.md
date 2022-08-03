### Day 1

1. Explain what lives inside of an account.

An account can store contracts and data.  The data lives in an
area called '/storage', and that data can be made accessible at the
paths '/private' and '/public'.

2. What is the difference between the `/storage/`, `/public/`, and `/private/` paths?

All of the data goes in the `/storage` path, and data can be
placed in either the `/public` or `/private` paths (like a
symlink) to specify who should be able to access it.

Only the account owner can access data using the `/storage` path
(or transactions which are being run on behalf of the account
owner after receiving permission from the account owner).

Anyone can access data using the `/public` path.  Only the
account owner can access data using the '/private` path, or
people which have been granted access by the account owner.

3. What does `.save()` do? What does `.load()` do? What does `.borrow()` do?

`.save()` stores data into the account `/storage` path.

`.load()` retrieves data from the account `/storage` path (if it
is a resource, it is removed from the storage location).

`.borrow()` retrieves a reference to the data from the account
`/storage` path (the data continues to live in `/storage`).

4. Explain why we couldn't save something to our account storage inside of a script.

We are only able to access the AuthAccount in the `prepare()`
block of a transaction.  This means a script does not have access
to the AuthAccount.  Also, a script can only read data, and
cannot write data.

5. Explain why I couldn't save something to your account.

Only the account owner can store data in their account.

6. Define a contract that returns a resource that has at least 1 field in it. Then, write 2 transactions:

    1) A transaction that first saves the resource to account storage, then loads it out of account storage, logs a field inside the resource, and destroys it.

    2) A transaction that first saves the resource to account storage, then borrows a reference to it, and logs a field inside the resource.

- See the contract [cadence/Circles.cdc](cadence/Circles.cdc)
- See the transaction accessing the resource directly [cadence/AccessCircleDirectly.cdc](cadence/AccessCircleDirectly.cdc)
- See the transaction accessing the resource via a reference [cadence/AccessCircleViaReference.cdc](cadence/AccessCircleViaReference.cdc)

```sh
flow project deploy --network=emulator
flow transactions send ./cadence/AccessCircleDirectly.cdc 14 --network=emulator --signer=emulator-account
flow transactions send ./cadence/AccessCircleViaReference.cdc 15 --network=emulator --signer=emulator-account
```
