pub contract Circles {

    pub resource Circle {
        pub var radius: Int
        init(_ radius: Int) {
            self.radius = radius
        }
    }

    pub fun createCircle(_ radius: Int): @Circle {
        return <- create Circle(radius)
    }
}
