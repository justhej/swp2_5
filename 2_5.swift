## 2.5 World Building

### 2.5.1 Uniting worlds


```Swift
// 2.5.1
// v- 0

let bk1 = Block()
world.place(bk1, atColumn: 3, row: 3)


while !isOnClosedSwitch{
    moveForward()
    if isBlocked && !isBlockedLeft{
        turnLeft()
    }
    if isBlocked && !isBlockedRight{
        turnRight()
    }
}

toggleSwitch()

////////////////////////////////

```


```Swift
// 2.5.1
// v- 1 Hej!

let ch = Character()
world.place(ch, atColumn: 5, row: 0)
ch.toggleSwitch()


////////////////////////////////

```

### 2.5.2 Connect and solve

```Swift
// 2.5.2
// v- 0

let bk1 = Block(); let bk2 = Block(); let bk3 = Block();

world.place(bk1, atColumn: 2, row: 2)
world.place(bk2, atColumn: 4, row: 2)
world.place(bk3, atColumn: 6, row: 2)

var gems = 0

func pat(){
    moveForward()
    if isOnClosedSwitch{
        turnRight()
        toggleSwitch()
    }
    
    if isOnGem{
        collectGem()
        gems += 1
        turnLeft()
        turnLeft()
    }
    
    if isOnOpenSwitch && isBlocked  {
        turnRight()
    }
    if isBlocked{
        jump()
    }
}

while gems <  3 {
    pat()
}


////////////////////////////////

```


```Swift
// 2.5.2
// v- 1


while !isBlocked{
    moveForward()
    isOnClosedSwitch ? toggleSwitch() : ()
    
}

let cha = Character()
[2, 4, 6].forEach { 
    world.place(cha, atColumn: $0, row: 0)
    cha.collectGem() }



////////////////////////////////

```

### 2.5.3 Making your own portals

```Swift
// 2.5.3
// v- 0



var gems = 0 
collectGem()
world.place(Portal(color: #colorLiteral(red: 0.0, green: 0.3813630939, blue: 0.9982447028, alpha: 1.0)), atStartColumn: 0, startRow: 5, atEndColumn: 5, endRow: 0)


func mtmctt(){
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
}

for i in 1...4 {
    mtmctt()
}

turnLeft()

for i in 1...3{
    mtmctt()
}


////////////////////////////////

```



```Swift
// 2.5.3
// v- 1


[3, 5].forEach { loc in
    (1...4).forEach { _ in world.place(Block(), atColumn: loc, row: 8 - loc) }
}

[3, 1].forEach { loc in 
    (1...4).forEach {_ in world.place(Block(), atColumn: loc, row: 4 - loc) }
}

let violet = Portal(color: #colorLiteral(red: 0.26626044511795044, green: 0.31208133697509766, blue: 0.9638455510139465, alpha: 1.0))
let green = Portal(color: #colorLiteral(red: -0.22150400280952454, green: 0.5057360529899597, blue: 0.07412504404783249, alpha: 1.0))
world.place(violet, atStartColumn: 3, startRow: 5, atEndColumn: 3, endRow: 1)
world.place(green, atStartColumn: 5, startRow: 3, atEndColumn: 1, endRow: 3)

func work(ent: Character) {
    while !ent.isBlocked {
        if ent.isOnGem {
            ent.collectGem()
        }
          ent.moveForward()
    }
    ent.collectGem()
}

let koo = Expert()
let mi = Expert()

world.place(koo, facing:.east, atColumn: 0, row: 5)
world.place(mi, facing:.north, atColumn: 5, row: 0)

work(ent: koo)
work(ent: mi)

////////////////////////////////

```

```Swift
// 2.5.3
// v- 2 Hej!

let positions = [(5,0), (4,1), (5,2), (6,1), (1,4), (2,5), (1,6), (0,5)]
let ch = Character()

positions.forEach { 
    world.place(ch, atColumn: $0.0, row: $0.1)
        ch.collectGem()
}



////////////////////////////////

```


```Swift
// 2.5.3
// v- 3

let green = Portal(color: #colorLiteral(red: -0.22150400280952454, green: 0.5057360529899597, blue: 0.07412504404783249, alpha: 1.0))
world.place(green, atStartColumn: 1, startRow: 3, atEndColumn: 3, endRow: 1)



    (1...4).forEach { _ in world.place(Block(), atColumn: 1, row: 3) }
    (1...4).forEach { _ in world.place(Block(), atColumn: 3, row: 1) }

let actions: [String: () -> Void] = [
    "m": moveForward,
    "c": collectGem,
    "l": turnLeft,
    "r": turnRight
]

func perform(_ sequence: String) {
    for action in sequence {
        actions[String(action)]?()
    }
}



perform("cmmcllmrmcllmmcmlm")
perform("cmmcllmrmcllmmcmlm")


////////////////////////////////

```


```Swift
// 2.5.3
// v- 4


collectGem()
moveForward()

let green = Portal(color: #colorLiteral(red: -0.22150400280952454, green: 0.5057360529899597, blue: 0.07412504404783249, alpha: 1.0))
world.place(green, atStartColumn: 1, startRow: 5, atEndColumn: 5, endRow: 1)
green.isActive = false

func pattern(){
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
}

for k in 1...7 {
    pattern()
    if k == 2 {
        green.isActive = true
    }
    if k == 3 {
        green.isActive = false
    }
    
}



////////////////////////////////

```





### 2.5.4 Reach for the stairs

```Swift
// 2.5.4
// v- 0


world.place(Stair(), facing:.south, atColumn: 4, row: 1)
world.place(Stair(), facing:.south, atColumn: 4, row: 2)
world.place(Stair(), facing:.east, atColumn: 5, row: 4)
world.place(Stair(), facing:.east, atColumn: 5, row: 5)
world.place(Stair(), facing:.east, atColumn: 5, row: 6)
world.place(Stair(), facing:.west, atColumn: 1, row: 6)
world.place(Stair(), facing:.west, atColumn: 1, row: 5)
world.place(Stair(), facing:.west, atColumn: 1, row: 4)
world.place(Stair(), facing:.north, atColumn: 2, row: 7)
world.place(Stair(), facing:.north, atColumn: 3, row: 7)
world.place(Stair(), facing:.north, atColumn: 4, row: 7)
var swis = 0
turnRight()
moveForward()
turnLeft()
move(distance: 4)
pat()

func pat(){
    turnRight()
    move(distance: 2)
    turnLeft()
}
while swis < 9 {
    if isOnClosedSwitch{
        toggleSwitch()
        swis += 1
    }
    moveForward()
    if isBlocked && isBlockedRight && !isBlockedLeft{
        toggleSwitch()
        swis += 1
        turnLeft()
        move(distance: 2)
        pat()
    }
}
    



////////////////////////////////

```


```Swift
// 2.5.4
// v- 1


for k in stride(from: 1, through: 3, by: 2) {
    world.place(Stair(), atColumn: 3, row: k)
}


for k in 4...6 {
    world.place(Stair(), facing: .east, atColumn: 5, row: k)
}

for k in 2...4 {
    world.place(Stair(), facing: .north, atColumn: k, row: 7)
}

for k in 4...6 {
    world.place(Stair(), facing: .west, atColumn: 1, row: k)
}


////////////////////////////////

```


```Swift
// 2.5.4
// v- 2

func placeTwoBlocks(atColumn column: Int, row: Int) {
    world.place(Block(), atColumn: column, row: row)
    world.place(Block(), atColumn: column, row: row)
}

for k in 7...8 {
    placeTwoBlocks(atColumn: 6, row: k)
}

placeTwoBlocks(atColumn: 5, row: 8)

for k in 0...1 {
    placeTwoBlocks(atColumn: k, row: 8)
}

placeTwoBlocks(atColumn: 0, row: 7)

for _ in 1...4 {
    moveForward()
}


turnRight()


var switches = 0

while switches < 9 {
    moveForward()
    if isOnClosedSwitch{
        toggleSwitch()
        switches += 1
    }
    if isBlocked{
        turnLeft()
    }
}


////////////////////////////////

```


```Swift
// 2.5.4
// v- 3

let Blu = Character()

for k in 4...6 {
    world.place(Blu, atColumn: 6, row: k)
    Blu.toggleSwitch()
    world.place(Blu, atColumn: 0, row: k)
    Blu.toggleSwitch()
}

for k in 2...4 {
    world.place(Blu, atColumn: k, row: 8)
    Blu.toggleSwitch()
}


////////////////////////////////

```


### 2.5.5 Floating Islands

```Swift
// 2.5.5
// v- 0


world.place(Portal(color: #colorLiteral(red: 0.3997545242, green: 0.6133489013, blue: 0.2060141265, alpha: 1.0)), atStartColumn: 1, startRow: 6, atEndColumn: 6, endRow: 4)
world.place(Portal(color: #colorLiteral(red: 0.3018117249, green: 0.1339289844, blue: 0.7035960555, alpha: 1.0)), atStartColumn: 5, startRow: 5, atEndColumn: 2, endRow: 1)
let ch = Character()
world.place(ch, facing:. north, atColumn: 1, row: 6)
var swis = 0
var gems = 0

while swis < 6{
    if ch.isOnGem{
        ch.collectGem()
        gems += 1
    }
    
    if ch.isOnClosedSwitch{
        ch.toggleSwitch()
        swis += 1
        ch.turnRight()
        ch.jump()
        ch.turnRight()
    }
    if ch.isBlocked{
    ch.jump()
    }
    
    if ch.isBlocked && !ch.isBlockedLeft{
        ch.turnLeft()
    }
    
}

////////////////////////////////

```


```Swift
// 2.5.5
// v- 1


world.place(Portal(color: #colorLiteral(red: 0.0, green: 0.3813630939, blue: 0.9982447028, alpha: 1.0)), atStartColumn: 2, startRow: 3, atEndColumn: 0, endRow: 6)
world.place(Portal(color: #colorLiteral(red: 0.9023433924, green: 0.2320581675, blue: 0.4786583185, alpha: 1.0)), atStartColumn: 3, startRow: 6, atEndColumn: 7, endRow: 4)

world.place(Block(), atColumn: 7, row: 4)
let x = Character()
world.place(x, facing: .north, atColumn: 2, row: 0)

for i in 1...3 {
    if i == 2 {
        x.jump()
        x.turnRight() } 
    else if i == 3 {
        x.jump()
        x.turnRight()
        x.turnRight() }
    x.jump()
    x.collectGem()
    x.turnLeft()
    x.jump()
    x.toggleSwitch()
    x.turnRight()
    x.turnRight()
    x.jump()
    x.turnLeft()
    x.jump()
    x.toggleSwitch()
}


////////////////////////////////

```


```Swift
// 2.5.5
// v- 2

let a = Character()
world.place(a, atColumn: 6, row: 4)
a.collectGem()
world.place(a, atColumn: 6, row: 3)
a.toggleSwitch()
world.place(a, atColumn: 5, row: 4)
a.toggleSwitch()
world.place(a, atColumn: 2, row: 1)
a.collectGem()
world.place(a, atColumn: 2, row: 2)
a.toggleSwitch()
world.place(a, atColumn: 1, row: 1)
a.toggleSwitch()
world.place(a, atColumn: 1, row: 6)
a.collectGem()
world.place(a, atColumn: 2, row: 6)
a.toggleSwitch()
world.place(a, atColumn: 1, row: 7)
a.toggleSwitch()



////////////////////////////////

```


```Swift
// 2.5.5
// v- 3

let j = Character()
world.place(Block(), atColumn: 0, row: 1)
world.place(Block(), atColumn: 7, row: 4)
world.place(Portal(color: #colorLiteral(red: 0.7460896969, green: 0.2179569006, blue: 0.9540396333, alpha: 1.0)), atStartColumn: 0, startRow: 1, atEndColumn: 3, endRow: 6)
world.place(Portal(color: #colorLiteral(red: 1.0, green: 0.2527073622, blue: 0.07590860873, alpha: 1.0)), atStartColumn: 0, startRow: 6, atEndColumn: 3, endRow: 2)
world.place(Portal(color: #colorLiteral(red: 0.3681973815, green: 0.186875701, blue: 0.9226484895, alpha: 1.0)), atStartColumn: 1, startRow: 2, atEndColumn: 7, endRow: 3)
world.place(Portal(color: #colorLiteral(red: 0.0, green: 0.7790542245, blue: 0.9885957837, alpha: 1.0)), atStartColumn: 5, startRow: 3, atEndColumn: 2, endRow: 7)
world.place(Portal(color: #colorLiteral(red: 1.0, green: 0.6663846374, blue: 0.0, alpha: 1.0)), atStartColumn: 0, startRow: 7, atEndColumn: 7, endRow: 4)

world.place(j, facing: .west, atColumn: 2, row: 1)

var swi = 0

while swi < 6 {
    j.collectGem()
    j.jump() 
    if j.isOnGem{ j.collectGem()}
        if j.isOnClosedSwitch{ 
            j.toggleSwitch(); swi += 1}
}


////////////////////////////////

```

### 2.5.6 Build a loop


```Swift
// 2.5.6
// v- 0

let totalGems = randomNumberOfGems

world.place(Block(), atColumn: 0, row: 2)
world.place(Block(), atColumn: 1, row: 3)
world.place(Block(), atColumn: 3, row: 3)
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 6, row: 0)
world.place(Block(), atColumn: 1, row: 0)
let ch = Character()
world.place(ch, facing:.east, atColumn: 0, row: 0)
var gems = 0 
var steps = 0
while gems < totalGems{
    ch.moveForward()
    steps += 1
    if ch.isOnGem{
        ch.collectGem()
        gems += 1
    }    
    if ch.isBlocked && steps < 20 {
        ch.turnRight()
    }   
    if ch.isBlocked && steps > 20{
        ch.turnLeft()
        world.place(Portal(color: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1.0, alpha: 1.0)), atStartColumn: 6, startRow: 3, atEndColumn: 1, endRow: 3)
    }
}



////////////////////////////////

```


```Swift
// 2.5.6
// v- 1

let totalGems = randomNumberOfGems

let b = Character() 
var gemCounter = 0 
world.place(Block(), atColumn: 0, row: 2) 
world.place(b, facing: east, atColumn: 4, row: 3) 
while gemCounter < totalGems { 
    if b.isOnGem { 
        b.collectGem() 
        gemCounter += 1 
    } 
    !b.isBlockedRight ? b.turnRight() : ()
    !b.isBlockedLeft  ? b.turnLeft()  : ()
    if b.isBlocked { 
        b.turnRight()
        b.turnRight() 
    } 
    b.moveForward() }



////////////////////////////////

```


```Swift
// 2.5.6
// v- 2

let totalGems = randomNumberOfGems

let b = Character()
var gems = 0
world.place(b, facing: east, atColumn: 4, row: 3)
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 0, row: 2)

while gems < totalGems {
    if b.isOnGem{
        b.collectGem()
        gems += 1
    }
    b.moveForward()
    if b.isBlocked && !b.isBlockedRight{
        b.turnRight()
    }
    if b.isBlocked && !b.isBlockedLeft{
        b.turnLeft()
    }
    if gems == 2 {
        bluePortal.isActive = false
    }
    if b.isBlocked{
        b.turnLeft()
        b.turnLeft()
        bluePortal.isActive = true
    }
}




### 2.5.7 A puzzle of your own

////////////////////////////////

```


```Swift
// 2.5.7
// v- 0


func placeSwis(times: Int){
    for i in 1...times{
        for j in 1...3 {
            world.place(Switch(), atColumn: i, row: j)
        }
    }
}

placeSwis(times: 6)

func placeGems(times: Int){
    for i in 1...3{
        for j in 1...2 {
            world.place(Gem(), atColumn: i - 1 , row: j + 3 )
        }
    }
}

placeGems(times: 2)


func placePets(times: Int){
    for i in 1...3{
        for j in 1...2 {
            world.place(Character(), atColumn: i + 4, row: j + 4)
        }
    }
}

placePets(times: 2)

////////////////////////////////

```

```Swift
// 2.5.7
// v- 1

func placeItems(count: Int) {
    if count > 0 {
        let randCol = Int.random(in: 0...7)
        let randRow = Int.random(in: 0...5)
        
        world.place(Block(), atColumn: randCol, row: randRow)
        world.place(Portal(color: #colorLiteral(red: 0.3681973815, green: 0.186875701, blue: 0.9226484895, alpha: 1.0)), atColumn: randCol, row: randRow)
        world.place(Gem(), atColumn: randCol, row: randRow)
        
        placeItems(count: count - 1)
    }
}

placeItems(count: 15)



////////////////////////////////

```