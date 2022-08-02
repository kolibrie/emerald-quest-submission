pub contract Ordinals {

    pub var dictionaryOfOrdinals: @{Int: Ordinal}  // Keep track of each ordinal value
    pub var languageSetting: @Language             // Have a global language setting

    // Each Ordinal is a resource with a language key and string representation of the ordinal number for that language
    pub resource Ordinal {
        pub let values: { String: String }

        init(_ data: {String: String}) {
            self.values = data
        }
    }

    // This Languange interface only allows us access to the language variable
    pub resource interface ILanguage {
        pub var language: String
    }

    // The Language resource allows us to set the language
    pub resource Language: ILanguage {
        pub var language: String

        pub fun setLanguage(_ language: String) {
            self.language = language
        }

        init(_ language: String) {
            self.language = language
        }
    }

    // Given an integer, returns the ordinal number in the language that is currently set
    pub fun getOrdinalValue(_ key: Int): String? {
        let ordinal = (&self.dictionaryOfOrdinals[key] as &Ordinal?)!
        return ordinal.values[self.languageSetting.language]
    }

    // Sets the language
    pub fun setLanguageNoInterface(_ language: String) {
        let setting = &self.languageSetting as &Language
        setting.setLanguage(language)
        log(setting.language)
    }

    // Attempts to set the language via the interface which does not expose that functionality
    // Need to comment out this function in order to deploy the contract.
    pub fun setLanguageViaInterface(_ language: String) {
        let setting = &self.languageSetting as &Language{ILanguage}
        setting.setLanguage(language) // Blows up because this function is not exposed via the Interface
        log(setting.language)
    }

    // Set the default language and ordinal values for 1-9
    init() {
        self.languageSetting <- create Language("English")
        self.dictionaryOfOrdinals <- {
            1: <- create Ordinal({"English": "1st", "French": "1er"}),
            2: <- create Ordinal({"English": "2nd", "French": "2e"}),
            3: <- create Ordinal({"English": "3rd", "French": "3e"}),
            4: <- create Ordinal({"English": "4th", "French": "4e"}),
            5: <- create Ordinal({"English": "5th", "French": "5e"}),
            6: <- create Ordinal({"English": "6th", "French": "6e"}),
            7: <- create Ordinal({"English": "7th", "French": "7e"}),
            8: <- create Ordinal({"English": "8th", "French": "8e"}),
            9: <- create Ordinal({"English": "9th", "French": "9e"})
        }
    }
}
