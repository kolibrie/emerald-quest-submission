import FLOAT from 0x2d4c3caffbeab845

pub fun main(address: Address, id: UInt64): &FLOAT.NFT? {
    let publicCollection = getAccount(address).getCapability(/public/FLOATCollectionPublicPath)
        .borrow<&FLOAT.Collection{FLOAT.CollectionPublic}>()
        ?? panic("The address does not have a Collection.")
  
    let nftRef: &FLOAT.NFT? = publicCollection.borrowFLOAT(id: id)
    return nftRef
}
