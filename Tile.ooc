
Drawable: class {}

Tile: class extends Drawable {
    id: ULong
    
    init: func (=id)
    
    println: func (x: Int, y: Int) {
        "(%d, %d, %ld)" format(x, y, id) println()
    }   
}
