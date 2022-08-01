pub contract ResourceStorage {

    // Variables to store our resource object.
    pub var arrayOfResources: @[MyResource]
    pub var dictionaryOfResources: @{String: MyResource}

    // Definition of our resource.
    pub resource MyResource {
        pub let label: String

        init() {
            self.label = "my exceptional resource"
        }
    }

    // Public function to add our resource to an array.
    pub fun addResourceToArray(myresource: @MyResource) {
        self.arrayOfResources.append(<- myresource)
    }

    // Public function to remove our resource from an array.
    pub fun removeResourceFromArray(index: Int): @MyResource {
        return <- self.arrayOfResources.remove(at: index)
    }

    // Public function to add our resource to a dictionary, destroying any previous resource that has the same label.
    pub fun addResourceToDictionary(myresource: @MyResource) {
        let key = myresource.label

        let oldResource <- self.dictionaryOfResources[key] <- myresource
        destroy oldResource
    }

    // Public function to remove our resource from a dictionary.
    pub fun removeResourceFromDictionary(key: String): @MyResource {
        let myresource <- self.dictionaryOfResources.remove(key: key) ?? panic("Could not find the Resource with that label.")
        return <- myresource
    }

    // Initialize our variables.
    init() {
        self.arrayOfResources <- []
        self.dictionaryOfResources <- {}
    }
}
