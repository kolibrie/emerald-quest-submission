### Day 1

Start up flow emulator in its own terminal.

```sh
flow emulator start -v
```

Deploy the contracts and run a script to make sure they work.

See [cadence/ReadJacobTucker.cdc](cadence/ReadJacobTucker.cdc)

```sh
cd chapter2/day1
flow project deploy --network=emulator
flow scripts execute ./cadence/ReadHelloWorld.cdc
flow scripts execute ./cadence/ReadJacobTucker.cdc
```
