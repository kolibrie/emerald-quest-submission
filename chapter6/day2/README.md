### Day 2

```sh
flow scripts execute cadence/scripts/read_total_supply.cdc --network=testnet
```

Output:
```text
Result: 0
```

```sh
flow transactions send cadence/transactions/setup_collection.cdc --network=testnet --signer=testnet-account
```

Output:
```text
Transaction ID: 8b28a77ec6eaa80a8fa475edf4361f171aaf6cf21d347de54d18917bd9586dc0

Status          ✅ SEALED
ID              8b28a77ec6eaa80a8fa475edf4361f171aaf6cf21d347de54d18917bd9586dc0
Payer           71925bc318416be3
Authorizers     [71925bc318416be3]

Proposal Key:
    Address     71925bc318416be3
    Index       0
    Sequence    1

No Payload Signatures

Envelope Signature 0: 71925bc318416be3
Signatures (minimized, use --include signatures)

Events:
    Index       0
    Type        A.7e60df042a9c0868.FlowToken.TokensWithdrawn
    Tx ID       8b28a77ec6eaa80a8fa475edf4361f171aaf6cf21d347de54d18917bd9586dc0
    Values
                - amount (UFix64): 0.00000294
                - from (Address?): 0x71925bc318416be3

    Index       1
    Type        A.7e60df042a9c0868.FlowToken.TokensDeposited
    Tx ID       8b28a77ec6eaa80a8fa475edf4361f171aaf6cf21d347de54d18917bd9586dc0
    Values
                - amount (UFix64): 0.00000294
                - to (Address?): 0x912d5440f7e3769e

    Index       2
    Type        A.912d5440f7e3769e.FlowFees.FeesDeducted
    Tx ID       8b28a77ec6eaa80a8fa475edf4361f171aaf6cf21d347de54d18917bd9586dc0
    Values
                - amount (UFix64): 0.00000294
                - inclusionEffort (UFix64): 1.00000000
                - executionEffort (UFix64): 0.00000039
```

1. Figure out how to mint an NFT to yourself by sending a transaction using the Flow CLI, like we did today when we set up our collection. You will also likely have to pass an argument as well.

See the transaction in [cadence/transactions/mint_nft.cdc](cadence/transactions/mint_nft.cdc)

```sh
flow transactions send cadence/transactions/mint_nft.cdc 0x71925bc318416be3 "MyName" "MyFood" 14 --network=testnet --signer=testnet-account
```

Output:
```text
Transaction ID: e47eb9f0f4fc7d864ee4172d4af20e48b000717612db13d304e5c65b216e70b2

Status          ✅ SEALED
ID              e47eb9f0f4fc7d864ee4172d4af20e48b000717612db13d304e5c65b216e70b2
Payer           71925bc318416be3
Authorizers     [71925bc318416be3]

Proposal Key:
    Address     71925bc318416be3
    Index       0
    Sequence    7

No Payload Signatures

Envelope Signature 0: 71925bc318416be3
Signatures (minimized, use --include signatures)

Events:
    Index       0
    Type        A.71925bc318416be3.EmeraldNFTExample.Deposit
    Tx ID       e47eb9f0f4fc7d864ee4172d4af20e48b000717612db13d304e5c65b216e70b2
    Values
                - id (UInt64): 102987969
                - to (Address?): 0x71925bc318416be3

    Index       1
    Type        A.7e60df042a9c0868.FlowToken.TokensWithdrawn
    Tx ID       e47eb9f0f4fc7d864ee4172d4af20e48b000717612db13d304e5c65b216e70b2
    Values
                - amount (UFix64): 0.00000309
                - from (Address?): 0x71925bc318416be3

    Index       2
    Type        A.7e60df042a9c0868.FlowToken.TokensDeposited
    Tx ID       e47eb9f0f4fc7d864ee4172d4af20e48b000717612db13d304e5c65b216e70b2
    Values
                - amount (UFix64): 0.00000309
                - to (Address?): 0x912d5440f7e3769e

    Index       3
    Type        A.912d5440f7e3769e.FlowFees.FeesDeducted
    Tx ID       e47eb9f0f4fc7d864ee4172d4af20e48b000717612db13d304e5c65b216e70b2
    Values
                - amount (UFix64): 0.00000309
                - inclusionEffort (UFix64): 1.00000000
                - executionEffort (UFix64): 0.00000042
```

2. Run a script to read the new `totalSupply` using the Flow CLI

See the script in [cadence/scripts/read_total_supply.cdc](cadence/scripts/read_total_supply.cdc)

```sh
flow scripts execute cadence/scripts/read_total_supply.cdc --network=testnet
```

Output:
```text
Result: 1
```

3. Run a script to read the ids of NFTs in someone's collection using the Flow CLI

See the script in [cadence/scripts/read_nft_ids.cdc](cadence/scripts/read_nft_ids.cdc)

```sh
flow scripts execute cadence/scripts/read_nft_ids.cdc 0x71925bc318416be3 --network=testnet
```

Output:
```text
Result: [102987969, 102962537]
```

4. Run a script to read a specific NFT's metadata from someone's collection using the Flow CLI

See the script in [cadence/scripts/read_nft_metadata.cdc](cadence/scripts/read_nft_metadata.cdc)

```sh
flow scripts execute cadence/scripts/read_nft_metadata.cdc 0x71925bc318416be3 102962537 --network=testnet
```

Output:
```text
Result: A.71925bc318416be3.EmeraldNFTExample.NFT(uuid: 102962537, id: 102962537, name: "MyName", favouriteFood: "MyFood", luckyNumber: 14)
```

5. Run a script to read the GoatedGoats `totalSupply` on **Flow Mainnet**. Their contract lives here: https://flow-view-source.com/mainnet/account/0x2068315349bdfce5/contract/GoatedGoats

See the script in [cadence/scripts/read_goats_total_supply.cdc](cadence/scripts/read_goats_total_supply.cdc)

```sh
flow scripts execute cadence/scripts/read_goats_total_supply.cdc --network=mainnet
```

Output:
```text
Result: 18398
```

6. Figure out how to read someone's GoatedGoats NFTs from their collection and run a script using the Flow CLI to do it.

I was not able to figure out how to identify accounts that hold
GoatedGoat NFTs.  However, I was able to read metadata about
FLOATs held in an account (since I know people who have those).

See the FLOAT contract at [https://flow-view-source.com/mainnet/account/0x2d4c3caffbeab845/contract/FLOAT](https://flow-view-source.com/mainnet/account/0x2d4c3caffbeab845/contract/FLOAT)

See the script in [cadence/scripts/read_float_ids.cdc](cadence/scripts/read_float_ids.cdc)

```sh
flow scripts execute cadence/scripts/read_float_ids.cdc 0x47e6f33743d42ad8 --network=mainnet
```

Output:
```text
Result: [423878840]
```

See the script in [cadence/scripts/read_float_metadata.cdc](cadence/scripts/read_float_metadata.cdc)

```sh
flow scripts execute cadence/scripts/read_float_metada.cdc 0x47e6f33743d42ad8 423878840 --network=mainnet
```

Output:
```text
Result: A.2d4c3caffbeab845.FLOAT.NFT(uuid: 423878840, id: 423878840, dateReceived: 1660064892.00000000, eventDescription: "This represents a certificate of completion for the Beginner Cadence Bootcamp hosted by Emerald Academy. \n\nThe holder of this FLOAT has gone through our Beginner Cadence Bootcamp and submitted the required quests, confirming their introductory understanding of the Cadence language.", eventHost: 0x99bd48c8036e2876, eventId: 241503135, eventImage: "QmR4tP7YQCgKu9RbJLVYZ96FCcH4szzuNnxNG7VtKLETG6", eventName: "Beginner Cadence Bootcamp", originalRecipient: 0x47e6f33743d42ad8, serial: 61, eventsCap: Capability<&A.2d4c3caffbeab845.FLOAT.FLOATEvents{A.2d4c3caffbeab845.FLOAT.FLOATEventsPublic,A.1d7e57aa55817448.MetadataViews.ResolverCollection}>(address: 0x99bd48c8036e2876, path: /public/FLOATEventsPublicPath))
```
