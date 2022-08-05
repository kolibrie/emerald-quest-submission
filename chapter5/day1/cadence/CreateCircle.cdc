import Circles from 0xf8d6e0586b0a20c7

transaction(_ radius: Int) {
    prepare(signer: AuthAccount) {
        // Create the Resource and store it in /storage
        let circleResource <- Circles.createCircle(radius)
        log("Created Circle")
        signer.save(<- circleResource, to: /storage/MyCircle)
        log("Stored to /storage/MyCircle")
        // Link a reference to the interface of the Resource so it is available in a /public path
        signer.link<&Circles.Circle{Circles.ICircle}>(/public/MyCircle, target: /storage/MyCircle)
        log("Linked to /public/MyCircle using ICircle interface")
    }

    execute {
    }
}
