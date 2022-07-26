pub fun main(): UInt64? {
    var socialmedia: {String: UInt64} = {
        "Facebook": 4,
        "Instagram": 0,
        "Twitter": 3,
        "YouTube": 5,
        "Reddit": 1,
        "LinkedIn": 2
    }
    return socialmedia["Facebook"]
}
