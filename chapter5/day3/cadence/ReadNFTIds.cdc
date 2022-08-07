import CryptoPoops from 0xf8d6e0586b0a20c7

pub fun main(address: Address): [UInt64] {
    let publicCollection = getAccount(address).getCapability(/public/MyCollection)
        .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
        ?? panic("The address does not have a Collection.")
  
    return publicCollection.getIDs() // [2353]
}
