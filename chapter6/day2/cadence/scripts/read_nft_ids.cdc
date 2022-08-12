import EmeraldNFTExample from "../contracts/EmeraldNFTExample.cdc"

pub fun main(address: Address): [UInt64] {
    let publicCollection = getAccount(address).getCapability(/public/MyCollection)
        .borrow<&EmeraldNFTExample.Collection{EmeraldNFTExample.CollectionPublic}>()
        ?? panic("The address does not have a Collection.")
  
    return publicCollection.getIDs() // [2353]
}
