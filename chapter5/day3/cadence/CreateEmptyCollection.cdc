import CryptoPoops from 0xf8d6e0586b0a20c7
import NonFungibleToken from 0xf8d6e0586b0a20c7
transaction() {
  prepare(signer: AuthAccount) {
    // Store a `CryptoPoops.Collection` in our account storage.
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/MyCollection)
    
    // We only link the interfaces tied to the Collection, not the Collection Resource itself.
    signer.link<&CryptoPoops.Collection{NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic, CryptoPoops.CollectionPublic}>(/public/MyCollection, target: /storage/MyCollection)
  }
}
