### Day 3

1. What does "force casting" with `as!` do? Why is it useful in our Collection?

Force casting allows us to make something more specific than the
interface requires, while still meeting the requirements of the
interface.

In our collection, we only want to store CryptoPoops NFTs, but
the interface states that as long as the resource is an NFT, it
can be deposited.  We implement the interface, but then force cast
the resource to also adhere to the CryptoPoops NFT resource,
meaning that the collection will only accept genuine CryptoPoops
NFTs.

2. What does `auth` do? When do we use it?

In order to "force cast" a reference, it must be an authorized
reference.  That means when we are creating our reference, we add
the keyword `auth` before the reference type.  After that we can
force cast that reference using `as!`, and it will adhere to the
forced type as well as the original type.

3. This last quest will be your most difficult yet. Take the CryptoPoops contract and add a function called `borrowAuthNFT` just like we did in the section called "The Problem" above. Then, find a way to make it publically accessible to other people so they can read our NFT's metadata. Then, run a script to display the NFTs metadata for a certain `id`.

You will have to write all the transactions to set up the accounts, mint the NFTs, and then the scripts to read the NFT's metadata. We have done most of this in the chapters up to this point, so you can look for help there :)

- See the contract [cadence/CryptoPoops.cdc](cadence/CryptoPoops.cdc)
- See the transaction to create the account (borrowed from github) [flow_cli_tutorials/createAccount.cdc](https://github.com/rdlalmeida/flow_cli_tutorials/blob/main/flow/cadence/00/transactions/createAccount.cdc)
- See the transaction to create the Collection [cadence/CreateEmptyCollection.cdc](cadence/CreateEmptyCollection.cdc)
- See the transaction to mint an NFT [cadence/CreateNFTAndDeposit.cdc](cadence/CreateNFTAndDeposit.cdc)
- See the script to read the NFT IDs [cadence/ReadNFTIds.cdc](cadence/ReadNFTIds.cdc)
- See the script to read the NFT metadata [cadence/ReadNFTMetadata.cdc](cadence/ReadNFTMetadata.cdc)

```sh
flow project deploy --network=emulator

# Create a recipient-account we can send an NFT to:
flow keys generate
flow transactions send cadence/createAccount.cdc c65e9851cce54338ac8ec96cfde167f0ac0ea605e4df1c1f8bc19f39bdb78b0c79525ff1fe09d0e4759c86eb98334db1535f79057469b6e92417266acabaceab --network=emulator --signer emulator-account

# Create empty Collections for ourselves and the recipient:
flow transactions send cadence/CreateEmptyCollection.cdc --network=emulator --signer emulator-account
flow transactions send cadence/CreateEmptyCollection.cdc --network=emulator --signer recipient-account

# Create NFTs for ourselves and the recipient:
flow transactions send cadence/CreateNFTAndDeposit.cdc 0xf8d6e0586b0a20c7 MyName MyFood 14 --network=emulator --signer emulator-account
flow transactions send cadence/CreateNFTAndDeposit.cdc 0x01cf0e2f2f715450 RecipientName RecipientFood 7 --network=emulator --signer emulator-account

# Get the IDs of the NFTs from our collections:
flow scripts execute ./cadence/ReadNFTIds.cdc 0xf8d6e0586b0a20c7
flow scripts execute ./cadence/ReadNFTIds.cdc 0x01cf0e2f2f715450
```

Output:
```text
Result: [29]

Result: [31]
```

```sh
# Get the metadata from the NFTs:
flow scripts execute ./cadence/ReadNFTMetadata.cdc 0xf8d6e0586b0a20c7 29
flow scripts execute ./cadence/ReadNFTMetadata.cdc 0x01cf0e2f2f715450 31
```

Log:
```text
DEBU[6195] LOG [e3cc95] "Metadata from the NFT"
DEBU[6195] LOG [e3cc95] 29
DEBU[6195] LOG [e3cc95] "MyName"
DEBU[6195] LOG [e3cc95] "MyFood"
DEBU[6195] LOG [e3cc95] 14

DEBU[6242] LOG [e3cc95] "Metadata from the NFT"
DEBU[6242] LOG [e3cc95] 31
DEBU[6242] LOG [e3cc95] "RecipientName"
DEBU[6242] LOG [e3cc95] "RecipientFood"
DEBU[6242] LOG [e3cc95] 7
```
