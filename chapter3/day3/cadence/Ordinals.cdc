pub contract Ordinals {

    pub var dictionaryOfOrdinals: @{Int: Ordinal}

    pub resource Ordinal {

        pub let value: String

        init(_value: String) {
            self.value = _value
        }
    }

    pub fun getReferenceToOrdinal(key: Int): &Ordinal? {
        return &self.dictionaryOfOrdinals[key] as &Ordinal?
    }

    init() {
        self.dictionaryOfOrdinals <- {
            1: <- create Ordinal(_value: "1st"),
            2: <- create Ordinal(_value: "2nd"),
            3: <- create Ordinal(_value: "3rd"),
            4: <- create Ordinal(_value: "4th"),
            5: <- create Ordinal(_value: "5th"),
            6: <- create Ordinal(_value: "6th"),
            7: <- create Ordinal(_value: "7th"),
            8: <- create Ordinal(_value: "8th"),
            9: <- create Ordinal(_value: "9th")
        }
    }
}
