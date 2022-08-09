### Day 1

1. Go to https://flow-view-source.com/testnet/. Where it says "Account", paste in the Flow address you generated and click "Go". On the left hand side, you should see your NFT contract.  Isn't it so cool to see it live on Testnet? Then, send the URL to the page.

```sh
flow keys generate --network=testnet
```

Created an address on testnet using the [testnet-faucet](https://testnet-faucet.onflow.org/)

Copied over all my contracts, transactions, and scripts from [Chapter 5.0 Day 3](../../chapter5/day3/cadence)
to [Chapter 6.0 Day 1](cadence) and edited the import lines and name of the contract.

Verified that everything works still on the local emulator, then pushed to the testnet.

```sh
flow project deploy --network=testnet
```

Output:
```text
Deploying 1 contracts for accounts: testnet-account

EmeraldNFTExample -> 0x71925bc318416be3 (6eaa8c62f31a474395eac17dd929c2db54078288384fcc7d0a36c990583ddd3c)


✨ All contracts deployed successfully
```

URL for my account on testnet: [https://flow-view-source.com/testnet/account/0x71925bc318416be3](https://flow-view-source.com/testnet/account/0x71925bc318416be3)
