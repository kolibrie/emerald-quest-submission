### Day 4

Take our NFT contract so far and add comments to every single resource or function explaining what it's doing in your own words.


```cadence
pub contract CryptoPoops {
  pub var totalSupply: UInt64

  // This is an NFT resource with an ID and some metadata fields.
  pub resource NFT {
    pub let id: UInt64

    pub let name: String
    pub let favouriteFood: String
    pub let luckyNumber: Int

    // We initialize the ID with the UUID of the resource.
    init(_name: String, _favouriteFood: String, _luckyNumber: Int) {
      self.id = self.uuid

      self.name = _name
      self.favouriteFood = _favouriteFood
      self.luckyNumber = _luckyNumber
    }
  }

  // This public interface to the Collection resource allows
  // access to deposit tokens, get a list of IDs of existing
  // tokens, and read data from any given token.
  pub resource interface CollectionPublic {
    pub fun deposit(token: @NFT)
    pub fun getIDs(): [UInt64]
    pub fun borrowNFT(id: UInt64): &NFT
  }

  // This resource keeps track of which NFTs are owned by this
  // account, with functions to deposit, withdraw, list the IDs
  // of existing tokens, and look at the metadata for any given
  // token. 
  pub resource Collection: CollectionPublic {
    pub var ownedNFTs: @{UInt64: NFT}

    // Allows a token to be deposited into the collection.
    pub fun deposit(token: @NFT) {
      self.ownedNFTs[token.id] <-! token
    }

    // Allows a token to be withdrawn from the collection.
    pub fun withdraw(withdrawID: UInt64): @NFT {
      let nft <- self.ownedNFTs.remove(key: withdrawID) 
              ?? panic("This NFT does not exist in this Collection.")
      return <- nft
    }

    // Lists the IDs of the tokens currently in the collection.
    pub fun getIDs(): [UInt64] {
      return self.ownedNFTs.keys
    }

    // Provides a reference to a given token so that metadata can
    // be accessed without moving the token out of the collection.
    pub fun borrowNFT(id: UInt64): &NFT {
      return (&self.ownedNFTs[id] as &NFT?)!
    }

    // We initialize with an empty collection.
    init() {
      self.ownedNFTs <- {}
    }

    // When the collection resource is destroyed, all the tokens
    // it contains will also be destroyed.  This is a requirement
    // of cadence.
    destroy() {
      destroy self.ownedNFTs
    }
  }

  // This function creates an empty collection and returns it, so
  // that the transaction that runs the function can store it
  // somewhere.
  pub fun createEmptyCollection(): @Collection {
    return <- create Collection()
  }

  // This resource allows us to create functionality that we only
  // want the owner to have (creating new tokens).
  pub resource Minter {

    // This function creates a new token and returns it.
    pub fun createNFT(name: String, favouriteFood: String, luckyNumber: Int): @NFT {
      return <- create NFT(_name: name, _favouriteFood: favouriteFood, _luckyNumber: luckyNumber)
    }

    // This functions creates a Minter resource, so that more
    // than one person can create tokens.
    pub fun createMinter(): @Minter {
      return <- create Minter()
    }

  }

  // We start out with only the owner of the contract being able
  // to mint tokens, and with a totalSupply of zero.
  init() {
    self.totalSupply = 0
    self.account.save(<- create Minter(), to: /storage/Minter)
  }
}
```
