import Items from 0xf8d6e0586b0a20c7

transaction(description: String, size: String, price: Int, id: UInt64) {

    prepare(signer: AuthAccount) {}

    execute {
        Items.addItem(description: description, size: size, price: price, id: id)
        log("Added item.")
    }
}
