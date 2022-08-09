import EmeraldNFTExample from "../contracts/EmeraldNFTExample.cdc"
import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
transaction() {
  prepare(signer: AuthAccount) {
    // Store a `EmeraldNFTExample.Collection` in our account storage.
    signer.save(<- EmeraldNFTExample.createEmptyCollection(), to: /storage/MyCollection)
    
    // We only link the interfaces tied to the Collection, not the Collection Resource itself.
    signer.link<&EmeraldNFTExample.Collection{NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic, EmeraldNFTExample.CollectionPublic}>(/public/MyCollection, target: /storage/MyCollection)
  }
}
