import EmeraldNFTExample from "../contracts/EmeraldNFTExample.cdc"

pub fun main(address: Address, id: UInt64): &EmeraldNFTExample.NFT {
    let publicCollection = getAccount(address).getCapability(/public/MyCollection)
        .borrow<&EmeraldNFTExample.Collection{EmeraldNFTExample.CollectionPublic}>()
        ?? panic("The address does not have a Collection.")
  
    let nftRef: &EmeraldNFTExample.NFT = publicCollection.borrowAuthNFT(id: id)
    log("Metadata from the NFT")
    log(nftRef.id)
    log(nftRef.name)
    log(nftRef.favouriteFood)
    log(nftRef.luckyNumber)

    return nftRef
}
