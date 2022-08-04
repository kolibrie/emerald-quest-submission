import CryptoPoops from 0xf8d6e0586b0a20c7
transaction() {
  prepare(signer: AuthAccount) {
    // Get a reference to our `CryptoPoops.Collection`
    let collection = signer.borrow<&CryptoPoops.Collection>(from: /storage/MyCollection)
                      ?? panic("The recipient does not have a Collection.")
    
    // deposits an `NFT` to our Collection
    collection.deposit(token: <- CryptoPoops.createNFT())

    log(collection.getIDs()) // [2353]

    // withdraw the `NFT` from our Collection
    let withdrawID = collection.getIDs()[0]
    let nft <- collection.withdraw(withdrawID: withdrawID) // We get this number from the ids array above
  
    log(collection.getIDs()) // []

    destroy nft
  }
}
