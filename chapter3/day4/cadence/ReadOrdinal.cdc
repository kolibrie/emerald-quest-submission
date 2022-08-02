import Ordinals from 0xf8d6e0586b0a20c7

pub fun main(_ key: Int): String {
    let value = Ordinals.getOrdinalValue(key) ?? panic("Number not known in Ordinals database.")
    return value
}
