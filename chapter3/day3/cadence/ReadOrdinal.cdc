import Ordinals from 0xf8d6e0586b0a20c7

pub fun main(_key: Int): String {
    let ordinal = Ordinals.getReferenceToOrdinal(key: _key) ?? panic("Number not known in Ordinals database.")
    return ordinal.value
}
