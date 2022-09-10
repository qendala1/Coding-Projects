import turtle
import math
import random
turtle.setup(500, 500)
turtle.pendown
turtle.speed(0)

def menu():
    print('\n--- MENU ---')

    # menu options
    print('1. circle [c]')
    print('2. polygon [p]')
    print('3. triangle [t]')
    print('4. concentric square [cs]')
    print('5. concentric polygons [cp]')
    print('6. draw a forest [f]')
    print('7. draw a graph [gr]')
    print('8. plot a parabola using the quadratic formula [q]')
    shape = input("OTHER: pen colour options [pc]")
    # asks questions depending on input
    if shape == 'c':
        size = int(input('Side Length?'))
        colour = input('Pen Colour?')

        # calls shape and adds in inputs
        circle(size,colour)

    # asks questions depending on input
    elif shape == 'p':
        noSides = int(input('How many sides?'))
        radius = int(input('Radius Length?'))
        colour = input('Pen Colour?')

        # calls shape and adds in inputs
        polygon(noSides, radius, colour)
    # asks questions depending on input
    elif shape == 'cs':
        noSquares = int(input('Number of Squares?'))
        size = int(input('Side Length?'))
        colour = input('Pen colour?')
        
        # calls shape and adds in inputs
        concentricSquares(noSquares, size, colour)

    # asks questions depending on input
    elif shape == 't':
        size = int(input('Side Length?'))
        colour = input('Pen Colour?')

        # calls shape and adds in inputs
        triangle(size,colour)

    # asks questions depending on input    
    elif shape == 'cp':
        noPolygons = int(input('Number of Polygons?'))
        noSides = int(input('Number of Sides?'))
        radius = int(input('Radius Length?'))
        colour = input('Pen colour?')

        # calls shape and adds in inputs
        concentricPolygon(noPolygons, noSides, radius, colour)



        
    elif shape == 'f':
        numTrees = int(input("how many trees do you want"))
        for i in range(numTrees):
            tree()
            
    #calls the graph subprogram     
    elif shape == 'gr':
        columnGraph()

    elif shape == 'q':
        quadraticFormula()
    # calls colours sub program
    elif shape == 'pc':
        colours()

    # prints text and calls menu
    else:
        print("Please enter an option.")
        menu()
        
# prints colour options
def colours():
    print('- black')
    print('- red')
    print('- orange')
    print('- yellow')
    print('- green')
    print('- blue')
    print('- indigo')
    print('- violet')
          
# draws square
def square(size):
    # self explanatory
    turtle.penup()
    turtle.pendown()

    # repeats until i = 4
    for i in range (4):
        turtle.forward(size)
        turtle.left(90)

# draws circle
def circle(size, colour):
    turtle.penup()
    turtle.color(colour)
    turtle.pendown()

    # repeats until i = 36, i think ? perhaps not
    for i in range(36):
        turtle.forward(size)
        turtle.left(10)
    menu()

# draws polygon
def polygon(noSides, radius,colour):
    turtle.penup()
    
    # sets pen colour
    turtle.color(colour)
    turtle.pendown()

    # math equation to determine the size of the sides of the polygons
    size = 2 * radius * math.sin(math.pi / noSides)

    # repeats until i = the number of sides
    for i in range(noSides):
        turtle.forward(size)
        turtle.left(360/noSides)

# draws concentric squares
def concentricSquares(noSquares, size, colour):
    turtle.penup()

    # sets pen colour
    turtle.color(colour)
    turtle.pendown()

    # sets location
    x=0
    y=0

    # repeats until i = number of squares
    for i in range (noSquares):

        # calls the square program
        square(size)

        # changes the length of the sides
        size=size-10

        # changes location of the square
        x=x+5
        y=y+5

    # calls the menu
    menu()

# draws concentric polygon
def concentricPolygon(noPolygons, noSides, radius, colour):
    
    turtle.penup()

    # sets pen colour
    turtle.color(colour)
    turtle.pendown()

    # math equation to determine the size of the sides of the polygons
    size = 2 * radius * math.sin(math.pi / noSides)

    # repeats until i = the number of polygons
    for i in range (noPolygons):

        # calls polygon code
        polygon(noSides, radius, colour)
        turtle.penup()

        # calculates the distance between the polygons
        distance = radius/noPolygons

        # changes radius to make smaller polygons
        radius = radius - radius/noPolygons

        # moves turtle into position to draw new polygons
        turtle.left((180-360/noSides)/2)
        turtle.forward(distance)
        turtle.right((180-360/noSides)/2)
        turtle.pendown()

    # calls menu sub program
    menu()

# draws triangle
def triangle(size, colour):
    turtle.penup()

    # sets pen colour
    turtle.color(colour)
    turtle.pendown()

    # repeats until i actually have no idea how this one works
    for i in range(0,3):
        turtle.forward(size)
        turtle.left(120)

    # calls menu sub program
    menu()

# this one doesn't work

def polygon1(noSides, radius):
    leafColor = ["green","light green"]

    turtle.penup()
    # sets pen colour
    turtle.color(random.choice(leafColor))
    turtle.pendown()
    # math equation to determine the size of the sides of the polygons
    size = 2 * radius * math.sin(math.pi / noSides)
    # repeats until i = the number of sides
    for i in range(noSides):
        turtle.forward(size)
        turtle.left(360/noSides)
        
def concentricPolygon1(noPolygons, noSides, radius):
    turtle.pendown()
    # math equation to determine the size of the sides of the polygons
    size = 2 * radius * math.sin(math.pi / noSides)
    # repeats until i = the number of polygons
    for i in range (noPolygons):
        # calls polygon code
        polygon1(noSides, radius)
        turtle.penup()
        # calculates the distance between the polygons
        distance = radius/noPolygons
        # changes radius to make smaller polygons
        radius = radius - radius/noPolygons
        # moves turtle into position to draw new polygons
        turtle.left((180-360/noSides)/2)
        turtle.forward(distance)
        turtle.right((180-360/noSides)/2)
        turtle.pendown()

def tree():
        turtle.setheading(180)
        
        turtle.penup()
        #creates random number generators for number of sides and polygons
        noSides=int(random.randint(3,5))
        noPolygons=int(random.randint(3,5))
        
        #draws the stump
        x = random.randint(-500,500)
        y = random.randint(-50,20)
        turtle.goto(x,y)
        turtle.pendown()
        turtle.left(90)
        turtle.forward(25)
        turtle.right(180)
        turtle.color("brown")
        turtle.forward(random.randint(150,200))
        #draws the polygon on the stump
        turtle.right(90)
        concentricPolygon1(noPolygons, noSides, 50)
        
        turtle.penup()
        #draws the branches using random number generators
        for i in range(random.randint(3,5)):
            turtle.penup()
            turtle.goto(x,y)
            turtle.setheading(180)
            turtle.color('brown')
            turtle.pendown()
            turtle.right(90)
            turtle.forward(random.randint(50,125))
            turtle.setheading(random.randint(25,200))
            turtle.forward(random.randint(50,100))
            #calls the concentric polygon program to draw flowers
            concentricPolygon1(random.randint(3,5),random.randint(3,5),random.randint(20,30))
        menu()
def columnGraph():
    #draws a graph
    numbers=input("Enter some digits:")
    for i in range (len(numbers)):
        print(numbers[i])
        turtle.setheading(90)
        turtle.forward((int(numbers[i]))/9*200)
        turtle.setheading(360)
        turtle.forward(200/len(numbers))
        turtle.setheading(270)
        turtle.forward((int(numbers[i]))/9*200)
    menu()
    
def quadraticFormula():
    turtle.penup()
    turtle.goto(0,-500)
    turtle.pendown()
    turtle.goto(0,500)
    turtle.penup()
    turtle.goto(-500,0)
    turtle.pendown()
    turtle.goto(500,0)
    turtle.penup()
    a = int(input("enter value for a"))
    b = int(input("enter value for b"))
    c = int(input("enter value for c"))
    xr = int(input("enter how many values you want for x"))
    xs = int(input("enter the scale for x [1-10] (1 is original parabola)"))
    print("here is your parabola in digital form")
    
    x = -1*xr
    while x <= xr:
        y=a*(x*x)+(b*x)+c
        turtle.goto(xs*x,y)

        turtle.pendown()
        turtle.forward(1)
        print("x=",x,",y=",y)
        x+=1
    menu()
# calls menu
menu()

            
            
            

        



    
