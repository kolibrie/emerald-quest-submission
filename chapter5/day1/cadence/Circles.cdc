pub contract Circles {

    // Define what data should be emitted when this event is triggered
    pub event CircleCreated(uuid: UInt64)

    // The interface only exposes the radius variable
    pub resource interface ICircle {
        pub var radius: Int
    }

    // The resource contains two variables and a way to update the values for each
    pub resource Circle: ICircle {
        pub var radius: Int
        pub var color: String

        pub fun setRadius(_ radius: Int) {
            // The radius must be larger than 0
            pre {
                radius > 0: "The radius must be larger than 0."
            }
            // We do not allow the radius to be set to the same value it is currently
            post {
                before(self.radius) != self.radius: "The radius was already set to this value."
            }
            self.radius = radius
        }

        pub fun setColor(_ color: String) {
            // The color must a string that is longer than 0 characters
            pre {
                color.length > 0: "The color must have a value that is longer than 0 characters."
            }
            self.color = color
        }

        init(_ radius: Int) {
            // The radius must be larger than 0
            pre {
                radius > 0: "The radius must be larger than 0."
            }

            self.radius = radius
            self.color = "black"

            // Broadcast the event of the creation of a Circle to the outside world
            emit CircleCreated(uuid: self.uuid)
        }
    }

    pub fun createCircle(_ radius: Int): @Circle {
        return <- create Circle(radius)
    }
}
