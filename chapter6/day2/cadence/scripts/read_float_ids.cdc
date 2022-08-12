import FLOAT from 0x2d4c3caffbeab845

pub fun main(address: Address): [UInt64] {
    let publicCollection = getAccount(address).getCapability(/public/FLOATCollectionPublicPath)
        .borrow<&FLOAT.Collection{FLOAT.CollectionPublic}>()
        ?? panic("The address does not have a Collection.")
  
    return publicCollection.getIDs() // [2353]
}
