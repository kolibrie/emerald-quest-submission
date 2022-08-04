import Circles from 0xf8d6e0586b0a20c7

pub fun main(address: Address): Int {
    // Create a Capability to access the public storage via an Interface
    let publicCapability: Capability<&Circles.Circle{Circles.ICircle}> =
          getAccount(address).getCapability<&Circles.Circle{Circles.ICircle}>(/public/MyCircle)

    // Read from public storage via the Interface (using the Capability object)
    let myCircle: &Circles.Circle{Circles.ICircle} = publicCapability.borrow() ?? panic("The capability doesn't exist or you did not specify the right type when you got the capability.")

    let radius = myCircle.radius
    log(radius)
    return radius
}
