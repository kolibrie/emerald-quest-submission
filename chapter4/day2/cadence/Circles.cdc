pub contract Circles {

    // The interface only exposes the radius variable
    pub resource interface ICircle {
        pub var radius: Int
    }

    // The resource contains two variables and a way to update the values for each
    pub resource Circle: ICircle {
        pub var radius: Int
        pub var color: String

        pub fun setRadius(_ radius: Int) {
            self.radius = radius
        }

        pub fun setColor(_ color: String) {
            self.color = color
        }

        init(_ radius: Int) {
            self.radius = radius
            self.color = "black"
        }
    }

    pub fun createCircle(_ radius: Int): @Circle {
        return <- create Circle(radius)
    }
}
