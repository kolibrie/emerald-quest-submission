import EmeraldNFTExample from "../contracts/EmeraldNFTExample.cdc"

transaction(recipient: Address, metadata_name: String, metadata_food: String, metadata_number: Int) {

    // The signer must have access to the Minter resource (so that is the person who deployed the contract in this case)
    prepare(signer: AuthAccount) {
        // Get a reference to the `Minter`
        let minter = signer.borrow<&EmeraldNFTExample.Minter>(from: /storage/Minter)
            ?? panic("This signer is not the one who deployed the contract.")

        // Get a reference to the `recipient`s public Collection      
        let recipientsCollection = getAccount(recipient).getCapability(/public/MyCollection)
            .borrow<&EmeraldNFTExample.Collection{EmeraldNFTExample.CollectionPublic}>()
            ?? panic("The recipient does not have a Collection.")

        // mint the NFT using the reference to the `Minter`
        let nft <- minter.createNFT(
            name:          metadata_name,
            favouriteFood: metadata_food,
            luckyNumber:   metadata_number
        )

        // deposit the NFT in the recipient's Collection
        recipientsCollection.deposit(token: <- nft)
    }
}
