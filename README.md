# CompX221 — Programming for Creative Industries
## Course File Index & Reference Guide
**University of Waikato | 2026**

---

```
CompX221_26A/
│
├── 01_Drawing_and_Basics/
│   ├── Studio_01_Ex1  — Grid drawing with nested loops
│   ├── Studio_01_Ex2  — Mouse drawing with random ellipses
│   └── Studio_01_Ex4  — Recursive fractal squares
│
├── 02_Images_and_PImage/
│   ├── loadAnImage    — Basic image loading
│   ├── Studio_01_Ex3  — Pixel sampling from image
│   ├── Studio_01_Ex3.1 — Pixel sampling v1 (no loop)
│   └── Studio_01_Ex3.2 — Pixel sampling v2 (with loop)
│
├── 03_Classes_and_Objects/
│   ├── Studio_02_Ex1  — Bluray class (basic OOP)
│   ├── Studio_02_Ex2  — Student class with getters/setters
│   ├── Studio_02_Ex3  — Button class with PVector
│   ├── Studio_02_Ex4  — Lollipop class with drawing
│   └── Studio_02_Ex6  — Triangle class with PVector corners
│
├── 04_ArrayLists/
│   ├── Studio_02_Ex2  — ArrayList of Student objects
│   ├── Studio_02_Ex3  — ArrayList of Button objects
│   ├── Studio_02_Ex4  — ArrayList of Lollipop objects
│   └── Studio_02_Ex6  — ArrayList of Triangle objects
│
├── 05_Inheritance_and_OOP/
│   ├── Studio_03_Ex1  — Student / International (basic inheritance)
│   ├── Studio_03_Ex2  — Button with isClicked & name
│   ├── Studio_03_Ex3  — Lollipop with grow & changeColor
│   ├── Studio_03_Ex3.1 — Lollipop extended (random grow)
│   ├── Studio_03_Ex5  — LottoLine / PowerballLine
│   ├── Studio_04_Ex1  — Sprite / PlayerShip / EnemyShip (abstract)
│   ├── Studio_04_Ex2  — Item / Weapon / Armour (abstract)
│   └── Studio_04_Ex3  — Button / RectangleButton / CircleButton (abstract)
│
├── 06_File_IO_and_CSV/
│   ├── Studio_03_Ex4  — loadStrings, wordList, text at mouse
│   ├── Studio_03_Ex5  — CSV loading into LottoLine objects
│   ├── Studio_04_Ex2  — CSV loading into Item objects
│   └── Studio_04_Ex3  — CSV loading into Button objects
│
├── 07_Mouse_and_Interaction/
│   ├── Studio_02_Ex3  — mousePressed check in draw loop
│   ├── Studio_03_Ex2  — isClicked method, named buttons
│   ├── Studio_04_Ex3  — mousePressed method, instanceof
│   └── Studio_04_Ex1  — keyPressed, UP/DOWN arrow movement
│
├── 08_Composition_and_Animation/
│   ├── Studio_07_Ex1  — Garden / Plant (aggregation)
│   └── Studio_07_Ex2  — TeddyBear / Wave (composition + animation)
│
├── 09_Abstract_Garden/
│   └── Studio_08_Ex1  — GardenObject / Plant / Bench (abstract + select/move)
│
└── 10_Assignment/
    └── ExtremophileFarm  — Ecosystem simulation (ControlP5, multiple organisms)
```

---

## Exercise Reference Index

---

### 🎨 STUDIO 1 — Drawing and Basics

---

#### Studio_01 — EX1: Grid Drawing
**File:** `EX1_Studio_1/EX1_Studio_1.pde`
**Summary:** Draws a grid of coloured ellipses using nested for loops. Each cell is randomly coloured.
**Concepts:** nested for loops, `ellipseMode()`, `fill()` with random colour, `noLoop()`
**Key Methods:** `drawGrid(int columns, int rows)`, `ellipse()`, `random()`, `fill()`

---

#### Studio_01 — EX2: Mouse Drawing
**File:** `Stud1_Ex2/Stud1_Ex2.pde`
**Summary:** Draws random-sized coloured ellipses near the mouse cursor when pressed. Saves a screenshot on keypress.
**Concepts:** `mousePressed`, `keyPressed`, `random()`, variables for RGB, `saveFrame()`
**Key Methods:** `ellipse()`, `noStroke()`, `saveFrame()`

---

#### Studio_01 — EX3: Image Pixel Sampling (v1 — no loop)
**File:** `Stud1_Ex3.1/Stud1_Ex3_v1.pde`
**Summary:** Samples pixel colours from a loaded image and paints dots at the mouse position using those colours.
**Concepts:** `PImage`, `dist()`, `img.get()`, colour with alpha, `pmouseX/pmouseY`
**Key Methods:** `loadImage()`, `img.get(int x, int y)`, `dist()`, `fill(color, alpha)`

---

#### Studio_01 — EX3: Image Pixel Sampling (v2 — with loop)
**File:** `Stud1_Ex3.2/Stud1_Ex3_v2.pde`
**Summary:** Same as v1 but uses a for loop to draw multiple dots per frame.
**Concepts:** `PImage`, for loop with `NUM_DOTS` constant, `final` keyword
**Key Methods:** `loadImage()`, `img.get()`, `dist()`

---

#### Studio_01 — EX3: Image Pixel Sampling (final version)
**File:** `Stud1_Ex3/Stud1_Ex3.pde`
**Summary:** Refined version using `noStroke()` and `if` condition instead of loop.
**Concepts:** `PImage`, conditional drawing, `noStroke()`
**Key Methods:** `loadImage()`, `img.get()`, `dist()`

---

#### Studio_01 — EX4: Recursive Fractal Squares
**File:** `Stud1_Ex4/Stud1_Ex_4.pde`
**Summary:** Draws recursive nested squares with random stroke colours, creating a fractal pattern.
**Concepts:** recursion, `rectMode(CENTER)`, `frameRate()`, random stroke colour
**Key Methods:** `drawLevel(float cx, float cy, int level, float side)`, `rect()`, `stroke()`

---

#### loadAnImage — Basic Image Load
**File:** `loadAnImage/loadAnImage.pde`
**Summary:** Simplest possible image loading and display.
**Concepts:** `PImage`, `loadImage()`, `image()`
**Key Methods:** `loadImage()`, `image()`

---

### 🧩 STUDIO 2 — Classes and Objects

---

#### Studio_02 — EX1: Bluray Class
**Files:** `Studio_02_ex1/bluray.pde`, `Studio_02_ex4.pde`
**Summary:** A `Bluray` class storing title, genre, year and lentTo. Demonstrates basic OOP with getters, setters and toString.
**Concepts:** classes, fields, constructor, `private`, getters, setters, `toString()`
**Key Methods:** `toString()`, `setLentTo()`, `getLentTo()`, `gettitle()`

---

#### Studio_02 — EX2: Student Class with ArrayList
**Files:** `Studio_02_ex2/Student.pde`, `Studio_02_ex2.pde`
**Summary:** A `Student` class with id, name, address and feesPaid. Stored in an `ArrayList` and displayed using both for loop and for-each loop.
**Concepts:** classes, `Boolean` field, getters/setters, `ArrayList`, for loop vs for-each loop
**Key Methods:** `toString()`, `getfeesPaid()`, `setfeesPaid()`, `ArrayList.get()`, `ArrayList.size()`

---

#### Studio_02 — EX3: Button Class with PVector
**Files:** `Studio_02_ex3/Button.pde`, `Studio_02_ex3.pde`
**Summary:** A `Button` class using `PVector` for position and size. Multiple buttons stored in an `ArrayList` and drawn in a loop.
**Concepts:** classes, `PVector`, `color` type, `ArrayList`, for-each loop, `drawButton()`
**Key Methods:** `new PVector(x, y)`, `fill()`, `rect()`, `ArrayList`

---

#### Studio_02 — EX4: Lollipop Class
**Files:** `Studio_02_ex4/Lollipop.pde`, `Studio_02_ex4.pde`
**Summary:** A `Lollipop` class with position, handle colour and lolly colour. Created at mouse click and stored in an `ArrayList`.
**Concepts:** classes, `PVector`, constants (`final`), drawing with `rect()` and `circle()`, dynamic ArrayList
**Key Methods:** `drawLollipop()`, `circle()`, `rect()`, `mousePressed`

---

#### Studio_02 — EX6: Triangle Class
**Files:** `Studio_02_ex6/Triangle.pde`, `Studio_02_ex6.pde`
**Summary:** A `Triangle` class with three `PVector` corners and a line colour. Drawn using `line()` calls between corners.
**Concepts:** classes, multiple `PVector` fields, `toString()`, `ArrayList`, for-each vs for loop
**Key Methods:** `drawTriangle()`, `line()`, `toString()`, `println()`

---

### 🔗 STUDIO 3 — Inheritance

---

#### Studio_03 — EX1: Student / International (Inheritance)
**Files:** `Studio_03_ex1/Student.pde`, `International.pde`, `Studio_03_ex1.pde`
**Summary:** `International` extends `Student`. Demonstrates `super()` in constructor and `super.toString()` to avoid repeated code. Both types stored in one `ArrayList<Student>`.
**Concepts:** inheritance, `extends`, `super()`, `super.toString()`, `protected` fields, polymorphism
**Key Methods:** `super()`, `super.toString()`, `getExpiry()`
**Inheritance Tree:** `Student` → `International`

---

#### Studio_03 — EX2: Button with isClicked and Name
**Files:** `Studio_03_ex2/Button.pde`, `Studio_03_ex2.pde`
**Summary:** Extended `Button` class with `isClicked()` using mouse bounds checking, and a `_name` field to identify which button was clicked.
**Concepts:** bounds checking, `mousePressed`, `isClicked()`, `PVector` for position and size, named buttons
**Key Methods:** `isClicked()`, `getname()`, `drawButton()`, `mousePressed`

---

#### Studio_03 — EX3: Lollipop with Grow and ChangeColor
**Files:** `Studio_03_ex3/Lollipop.pde`, `Studio_03_ex3.pde`
**Summary:** Extended `Lollipop` class with `growLollipop()` and `changeColor()` methods. Height is now variable. Random lollipop grows on click, changes colour on keypress.
**Concepts:** methods that modify fields, `random()` array index, `isEmpty()`, `keyPressed`
**Key Methods:** `growLollipop()`, `changeColor()`, `lollipopList.isEmpty()`, `lollipopList.get()`

---

#### Studio_03 — EX3.1: Lollipop Extended
**Files:** `Studio_03_ex3.1/Lollipop.pde`, `Studio_03_ex3.1.pde`
**Summary:** Refined version of Ex3 with `changeColor()` called in constructor and `drawLollipop()` reorganised.
**Concepts:** calling methods from constructor, dynamic sizing with `_hgt/2`
**Key Methods:** `growLollipop()`, `changeColor()`, `drawLollipop()`

---

#### Studio_03 — EX4: Word Display from Text File
**File:** `Studio_03_ex4/Studio_03_ex4.pde`
**Summary:** Loads a text file, splits into individual words stored in an `ArrayList<String>`, then displays one word per frame at the mouse position.
**Concepts:** `loadStrings()`, `split()`, `ArrayList<String>`, `PFont`, `createFont()`, `textFont()`, `textAlign()`, `frameRate()`, index counter, if/else reset
**Key Methods:** `loadStrings()`, `split()`, `wordList.get(index)`, `text()`, `textFont()`, `createFont()`

---

#### Studio_03 — EX5: LottoLine / PowerballLine (CSV + Inheritance)
**Files:** `Studio_03_ex5/LottoLine.pde`, `PowerballLine.pde`, `Studio_03_ex5.pde`
**Summary:** `LottoLine` stores 6 lotto numbers in an int array. `PowerballLine` extends it with a 7th powerball number. CSV file loaded and parsed into appropriate objects stored in `ArrayList<LottoLine>`.
**Concepts:** inheritance, `protected` int array, `super()`, `super.toString()`, `Integer.parseInt()`, CSV parsing, polymorphic ArrayList
**Key Methods:** `Integer.parseInt()`, `loadStrings()`, `split()`, `super.toString()`
**Inheritance Tree:** `LottoLine` → `PowerballLine`

---

### ⚙️ STUDIO 4 — Abstract Classes and Advanced OOP

---

#### Studio_04 — EX1: Sprite / PlayerShip / EnemyShip
**Files:** `Studio_04_ex1/Sprite.pde`, `PlayerShip.pde`, `EnemyShip.pde`, `Studio_04_ex1.pde`
**Summary:** Abstract `Sprite` class with `PVector _center` and abstract methods `drawSprite()` and `moveSprite()`. `PlayerShip` is a rectangle moving vertically, `EnemyShip` is an ellipse moving horizontally. Enemy ships spawn every 30 frames.
**Concepts:** `abstract class`, abstract methods, `extends`, `PVector`, `frameCount`, `keyPressed`, arrow key detection (`CODED`, `UP`, `DOWN`)
**Key Methods:** `abstract void drawSprite()`, `abstract void moveSprite()`, `frameCount % 30`, `keyCode`
**Inheritance Tree:** `Sprite` (abstract) → `PlayerShip`, `EnemyShip`

---

#### Studio_04 — EX2: Item / Weapon / Armour (CSV + Abstract)
**Files:** `Studio_04_ex2/Item.pde`, `Weapon.pde`, `Armour.pde`, `Studio_04_ex2.pde`
**Summary:** Abstract `Item` class with name, type and value. `Weapon` adds attackSpeed (float) and damage. `Armour` adds armour points. CSV file parsed into appropriate objects stored in `ArrayList<Item>`.
**Concepts:** abstract class, inheritance, `Float.parseFloat()`, `Integer.parseInt()`, `nf()` for number formatting, polymorphic ArrayList, CSV parsing
**Key Methods:** `nf(float, left, right)`, `Float.parseFloat()`, `super.toString()`, `loadStrings()`
**Inheritance Tree:** `Item` (abstract) → `Weapon`, `Armour`

---

#### Studio_04 — EX3: Button / RectangleButton / CircleButton
**Files:** `Studio_04_ex3/Button.pde`, `RectangleButton.pde`, `CircleButton.pde`, `Studio_04_ex3.pde`
**Summary:** Abstract `Button` class with `PVector _center` and `color _buttonColor`. `RectangleButton` adds caption, font, width and height with bounds-based `isClicked()`. `CircleButton` adds size with distance formula `isClicked()`. Buttons loaded from CSV and stored in `ArrayList<Button>`. `instanceof` used to identify button type on click.
**Concepts:** abstract class, abstract methods, `PVector`, `color` type, `PFont`, `createFont()`, `textFont()`, `textAlign(CENTER)`, `rectMode(CENTER)`, `sq()`, `instanceof`, `mousePressed()` method, polymorphic ArrayList
**Key Methods:** `abstract void drawButton()`, `abstract boolean isClicked(int x, int y)`, `sq()`, `instanceof`, `color(r,g,b)`, `mousePressed()`
**Inheritance Tree:** `Button` (abstract) → `RectangleButton`, `CircleButton`

---

### 🌿 STUDIO 7 — Composition and Animation

---

#### Studio_07 — EX1: Garden / Plant (Aggregation)
**Files:** `Studio_07_ex1/Garden.pde`, `Plant.pde`, `Studio_07_ex1.pde`
**Summary:** A standalone `Plant` class (no inheritance) stored in an `ArrayList` inside a `Garden` class. Plants are added at mouse click position with a random size. `growGarden()` randomly grows one plant per frame using an index guard.
**Concepts:** aggregation, composition via ArrayList field, `isEmpty()` guard, `random()` index, `mousePressed`
**Key Methods:** `addPlant()`, `drawGarden()`, `growGarden()`, `growPlant()`, `_plantList.size()`

---

#### Studio_07 — EX2: TeddyBear / Wave (Composition + Animation)
**Files:** `Studio_07_ex2/TeddyBear.pde`, `Wave.pde`, `Studio_07_ex2.pde`
**Summary:** A `TeddyBear` class that loads a `PImage` and bounces across the screen, reversing direction and stepping down a row when it hits the canvas edge. A `Wave` class aggregates multiple `TeddyBear` objects via an ArrayList and is responsible for drawing them as a group.
**Concepts:** composition, `PImage`, direction reversal, `getWidth()`, `imageMode(CENTER)`, ArrayList of objects
**Key Methods:** `drawBear()`, `moveBear(int amount)`, `getWidth()`, `drawWave()`

---

### 🌳 STUDIO 8 — Abstract Garden

---

#### Studio_08 — EX1: GardenObject / Plant / Bench
**Files:** `Studio_08_ex1/GardenObject.pde`, `Plant.pde`, `Bench.pde`, `Garden.pde`, `Studio_08_ex1.pde`
**Summary:** Abstract `GardenObject` class with shared fields (`_centre`, `_objColor`, `_isSelected`, `_selectedColor`) and abstract methods `drawObject()` and `isClicked()`. `Plant` uses distance formula for click detection and draws as an ellipse. `Bench` uses bounds checking and draws as a rectangle. `Garden` aggregates both types in a polymorphic `ArrayList<GardenObject>`. Click to select an object (highlights red), click again to move it. Key 'g' grows all plants using `instanceof` casting.
**Concepts:** abstract class, polymorphic ArrayList, `instanceof`, casting, aggregation, `_isSelected` toggle, `moveObject()`, `deselectObject()`, `pow()` distance formula, bounds checking
**Key Methods:** `handleClick()`, `growGarden()`, `addPlant()`, `addBench()`, `isClicked()`, `moveObject()`, `deselectObject()`, `instanceof`, `(Plant) g`
**Inheritance Tree:** `GardenObject` (abstract) → `Plant`, `Bench`

---

### 🦀 ASSIGNMENT 2 — Extremophile Farm

---

#### ExtremophileFarm — Ecosystem Simulation
**Files:** `EXFarm.pde`, `Organism.pde`, `BlackSmoker.pde`, `MarineSnow.pde`, `TubeWorm.pde`, `HoffCrab.pde`, `VulcanOctopus.pde`, `EruptionRock.pde`
**Summary:** A real-time ecosystem simulation set at a deep-sea hydrothermal vent. `Organism` is an abstract base class with `_position` and abstract `drawObject()`. `BlackSmoker` generates a heat gradient via `getTempAt()`. `MarineSnow` falls and converts to bacteria on the ocean floor. `TubeWorm`, `HoffCrab`, and `VulcanOctopus` each have vitality, hunting, eating, reproduction, and death logic. `EruptionRock` projectiles are spawned on eruption and check collision against all organism lists. UI built with ControlP5 (sliders, radio buttons, buttons). Gradient background drawn with `lerpColor()`.
**Concepts:** abstract class, inheritance, polymorphism, `instanceof`, `ArrayList` with reverse-index removal, `frameCount`, `constrain()`, `map()`, `dist()`, `lerpColor()`, ControlP5 library, `PImage`, callback methods
**Key Methods:** `getTempAt(PVector)`, `eatSnow()`, `eatBacteria()`, `eatCrabs()`, `huntBacteria()`, `huntCrabs()`, `checkCollision()`, `setGradient()`, `lerpColor()`, `constrain()`, `map()`
**Inheritance Tree:** `Organism` (abstract) → `BlackSmoker`, `MarineSnow`, `TubeWorm`, `HoffCrab`, `VulcanOctopus`

---

## Quick Concept Lookup

| Concept | Where to find it |
|---|---|
| Basic class structure | Studio_02 Ex1 (Bluray) |
| `private` fields + getters/setters | Studio_02 Ex2 (Student) |
| `PVector` for position | Studio_02 Ex3 (Button) |
| `ArrayList` basics | Studio_02 Ex2, Ex3, Ex4 |
| `toString()` method | Studio_02 Ex1, Ex6 |
| Inheritance (`extends`) | Studio_03 Ex1, Ex5 |
| `super()` constructor | Studio_03 Ex1, Ex5 |
| `super.toString()` | Studio_03 Ex1, Ex5 |
| `protected` fields | Studio_03 Ex1, Ex5 |
| Polymorphic ArrayList | Studio_03 Ex1, Ex5 |
| Abstract class | Studio_04 Ex1, Ex2, Ex3 |
| Abstract methods | Studio_04 Ex1, Ex3 |
| `instanceof` | Studio_04 Ex3 |
| `loadStrings()` / CSV parsing | Studio_03 Ex4, Ex5 |
| `Integer.parseInt()` | Studio_03 Ex5, Studio_04 Ex2, Ex3 |
| `Float.parseFloat()` | Studio_04 Ex2 |
| `PFont` / `createFont()` | Studio_03 Ex4, Studio_04 Ex3 |
| `mousePressed()` method | Studio_04 Ex3 |
| `keyPressed()` method | Studio_04 Ex1 |
| `isClicked()` bounds check | Studio_03 Ex2, Studio_04 Ex3 |
| `sq()` distance formula | Studio_04 Ex3 (CircleButton) |
| `nf()` number formatting | Studio_04 Ex2 (Weapon) |
| `PImage` / image loading | Studio_01 Ex3 |
| Recursion | Studio_01 Ex4 |
| `frameRate()` | Studio_03 Ex4 |
| `frameCount` | Studio_04 Ex1, Studio_08 Ex1 |
| Aggregation / composition | Studio_07 Ex1, Ex2 |
| `instanceof` + casting | Studio_04 Ex3, Studio_08 Ex1 |
| Select / move object pattern | Studio_08 Ex1 |
| `_isSelected` toggle | Studio_08 Ex1 |
| `lerpColor()` gradient | Assignment 2 |
| ControlP5 library | Assignment 2 |
| Vitality / death loop pattern | Assignment 2 |
| Reverse-index ArrayList removal | Assignment 2 |

---

*Last updated: May 2026 | Paper: DSIGN221-26A*
