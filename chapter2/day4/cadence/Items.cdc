pub contract Items {

    pub var items: {UInt64: Item}

    pub struct Item {
        pub let description: String
        pub let size: String
        pub let price: Int
        pub let id: UInt64

        init(_description: String, _size: String, _price: Int, _id: UInt64) {
            self.description = _description
            self.size = _size
            self.price = _price
            self.id = _id
        }
    }

    pub fun addItem(description: String, size: String, price: Int, id: UInt64) {
        let newItem = Item(_description: description, _size: size, _price: price, _id: id)
        self.items[id] = newItem
    }

    init() {
        self.items = {}
    }
}
