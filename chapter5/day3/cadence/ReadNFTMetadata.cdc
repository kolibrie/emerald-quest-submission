import CryptoPoops from 0xf8d6e0586b0a20c7

pub fun main(address: Address, id: UInt64): UInt64 {
    let publicCollection = getAccount(address).getCapability(/public/MyCollection)
        .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
        ?? panic("The address does not have a Collection.")
  
    let nftRef: &CryptoPoops.NFT = publicCollection.borrowAuthNFT(id: id)
    log("Metadata from the NFT")
    log(nftRef.id)
    log(nftRef.name)
    log(nftRef.favouriteFood)
    log(nftRef.luckyNumber)

    return nftRef.id
}
