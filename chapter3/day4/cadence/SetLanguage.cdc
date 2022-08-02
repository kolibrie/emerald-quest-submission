import Ordinals from 0xf8d6e0586b0a20c7

transaction(_ language: String) {

    prepare(signer: AuthAccount) {}

    execute {
        Ordinals.setLanguageNoInterface(language)
        log("Set language")
    }
}
