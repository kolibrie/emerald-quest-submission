### Day 4

- See [cadence/Items.cdc](cadence/Items.cdc)
- See [cadence/AddItem.cdc](cadence/AddItem.cdc)
- See [cadence/ReadItem.cdc](cadence/ReadItem.cdc)

```sh
flow project deploy --network=emulator
flow transactions send ./cadence/AddItem.cdc "bag of lemons" "600g" 4 1 --network=emulator --signer=emulator-account
flow scripts execute ./cadence/ReadItem.cdc 1
```

```
Result: A.f8d6e0586b0a20c7.Items.Item(description: "bag of lemons", size: "600g", price: 4, id: 1)
```
