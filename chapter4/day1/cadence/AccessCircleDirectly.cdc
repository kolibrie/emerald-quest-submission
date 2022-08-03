import Circles from 0xf8d6e0586b0a20c7

transaction(_ radius: Int) {
    prepare(signer: AuthAccount) {
        // Create the Resource and store it in /storage
        let circleResource <- Circles.createCircle(radius)
        signer.save(<- circleResource, to: /storage/MyCircle)

        // Retrieve the Resource from /storage and destroy it
        let circle <- signer.load<@Circles.Circle>(from: /storage/MyCircle)
            ?? panic("A `@Circles.Circle` resource does not live here.")
        log(circle.radius)
        destroy circle
    }

    execute {
    }
}
