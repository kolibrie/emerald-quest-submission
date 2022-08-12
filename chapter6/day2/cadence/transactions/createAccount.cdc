/*
    To create an account in flow emulator:
    
    1. Start the emulator in a terminal
    2. In another terminal, with FLOW CLI installed, run: "flow keys generate"
    3. Copy the public key returned from the last command, and run this transaction using that key as argument and signing it with the emulator's
        service account (defined as emulator-account in flow.json). NOTE: The service account needs to have some funds (not a lot really) to run
        this. Example:
            $ flow transactions send <path_to_this_transactions_cdc_file> <PublicKey_returned_from_2> --signer emulator-account --network emulator
    4. If successful, this transaction outputs the address of the new account created INTO THE EMULATOR'S OUTPUT (not the transaction's output), hence
        why you need to have a terminal with the emulator running in it. Check it for the address of the new account.
    5. Copy the address returned from the emulator output and the Private key from the pair generated in 2., and add these as elements for a new
        account entry in the flow.json file that is being used to run the emulator in 1. Example:
                "emulator-account": {
                        "address": "0xf8d6e0586b0a20c7",                                                            
                        "key": "680fa28962650ef346a7edf23d63967b0fcf44958488d0d48f8539ece6e92eba",                                                                               
                },                                                                                                  
                "account01": {                                                                                      
                        "address": "0x01cf0e2f2f715450",                                                            
                        "key": "2df342adc4f8fc5a2c91c6759c766096b2afe3660a861d4b83f815b7d3e06b27"                                                             
                }
            In this case, "account01" is just an alias (use whatever name you wish) that can be used to sign transactions, for example, the value
            in the "address" key is the address returned from this transaction's output in the emulator terminal and the value in the key "key" is
            the PRIVATE KEY from the pair obtained from step 2.
    6. There's no need to restart the emulator. Save the flow.json with the new account in it and it is ready for use.
*/
transaction(publicKey: String) {
    /*
        IMPORTANT: The signer of this transaction is the account that is going to pay for the instructions needed to create the new account. Therefore,
        account creation needs to come from the "outside", i.e., from an account with enough funds to do that. As a suggestion, using the service account
        is an easy way to deal with this
    */
    prepare(signer: AuthAccount) {
        let pub_key = PublicKey(
            /*
                The publicKey is provided to the transaction as a String but this instruction requires an array of UInt8 ([UInt8]). It is much
                more easy to get the key as String, therefore it is necessary to convert it to the [UInt8] required. The decodeHex() instruction
                does just that
            */
            publicKey: publicKey.decodeHex(),

            // This one is pretty much standard in Flow/Cadence
            signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
        )

        /*
            Create a bare account. Notice how the AuthAccount object is used to create this new "object" (I think...) but it requires a signer
            with enough funds to pay for the gas costs as argument.
        */
        let newAccount = AuthAccount(payer: signer)

        // This is a bit redundant and it serves just to ensure that I get the address of the account created somewhere (it should be set in
        // transaction's output too)
        log("New Account created with address ".concat(newAccount.address.toString()))

        // Add public key to account created. Notice that it is the Publickey object and not the String that goes here
        newAccount.keys.add(
            publicKey: pub_key,
            // The hash algorithm is also pretty much standard
            hashAlgorithm: HashAlgorithm.SHA3_256,
            // IMPORTANT: Recent rule changes in Flow/Cadence now require accounts with a minimum weight of 1000 to be able to sign... things.
            // So, yeah, make sure this value is at least 1000.0
            weight: 1000.0
        )

        log("Created account with address ".concat(newAccount.address.toString()).concat("with Public Key = ").concat(publicKey[0].toString()))
    }

    execute {
        
    }
}
