import Tile

// debug code
d: func (s: String) { fprintf(stderr, "%s\n", s) }

// test code
Map new() redraw()

Map: class {
    tiles: Tile[][]
    
    mapw = 32, maph = 32 : static const UInt
    
    init: func {
        d("Initializing map")
		tiles = Tile[mapw][maph] new()
		
        for (x in 0..mapw) {
		    for (y in 0..maph) {
			    this setTileAtPos(x, y, Tile new(x * mapw + y))
		    }
	    }
	}

	setTileAtPos: func (x, y:Int, tile: Tile) {
		tiles[x][y] = tile
	}

	getTileAtPos: func (x, y:Int) -> Tile {
		if (checkPos(x, y))
			return tiles[x][y]
		else
			return null
	}

	checkPos: func (x, y:Int) -> Bool {
		if (x > -1 && x < mapw && y > -1 && y < maph)
			return true
		else
			return false
	}

    redraw: func() {
        d("Redraw called")
        tile: Tile
        
        d("Mapw %d Maph %d" format(mapw, maph))
        
        for (x in 0..this mapw) {
            d("In loop for x %d" format(x))
		    for (y in 0..this maph) {
			    tile = getTileAtPos(x, y)
			    tile println(x, y)
		    }
	    }  
    }
}

