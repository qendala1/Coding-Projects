import math
from turtle import delay
import pygame
from queue import PriorityQueue

#cd C:\Users\Merlijn\AppData\Local\Programs\Python\Python39
#python "c:\Users\Merlijn\OneDrive\Documents\Desktop\School\Pathfind Visualisation\Version Control\Pathfinding_Visualisation.py"


# Width of pygame
WIDTH = 800
# Creates a square GUI
WIN = pygame.display.set_mode((WIDTH, WIDTH))

# Title name for pygame GUI
pygame.display.set_caption("A* Path Finding Algorithm")

# RGB color variables
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 255, 0)
YELLOW = (255, 255, 0)
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
PURPLE = (128, 0, 128)
ORANGE = (255, 165, 0)
GREY = (128, 128, 128)
TURQUOISE = (64, 224, 208)

class Node:
    def __init__(self, row, col, width, total_rows):
        self.row = row
        self.col = col
        self.x = row * width
        self.y = col * width
        self.color = WHITE
        self.neighbors = []
        self.width = width
        self.total_rows = total_rows

    def get_pos(self):
        return self.row, self.col

    def is_closed(self):
        return self.color == RED

    def is_open(self):
        return self.color == GREEN

    def is_barrier(self):
        return self.color == BLACK

    def is_start(self):
        return self.color == ORANGE

    def is_end(self):
        return self.color == TURQUOISE

    def reset(self):
        self.color = WHITE

    def make_start(self):
        self.color = ORANGE

    def make_closed(self):
        self.color = RED

    def make_open(self):
        self.color = GREEN

    def make_barrier(self):
        self.color = BLACK

    def make_end(self):
        self.color = TURQUOISE

    def make_path(self):
        self.color = PURPLE

    def draw(self, win):
        pygame.draw.rect(win, self.color, (self.x, self.y, self.width, self.width))

    # finds the neighbors of the current node, is used in the algorithm to calculate shortest path
    def update_neighbors(self, grid):
        self.neighbors = []
        if self.row < self.total_rows - 1 and not grid[self.row + 1][self.col].is_barrier():  # DOWN
            self.neighbors.append(grid[self.row + 1][self.col])

        if self.row > 0 and not grid[self.row - 1][self.col].is_barrier():  # UP
            self.neighbors.append(grid[self.row - 1][self.col])

        if self.col < self.total_rows - 1 and not grid[self.row][self.col + 1].is_barrier():  # RIGHT
            self.neighbors.append(grid[self.row][self.col + 1])

        if self.col > 0 and not grid[self.row][self.col - 1].is_barrier():  # LEFT
            self.neighbors.append(grid[self.row][self.col - 1])

    def __lt__(self, other):
        return False


# calculates the value of H which is used in the A* algorithm formula (f(n) = h(n) + g(n))
def h(p1, p2):
    x1, y1 = p1
    x2, y2 = p2
    return abs(x1 - x2) + abs(y1 - y2)


# Draws the shortest path from the start node and the end node.
def reconstruct_path(came_from, current, draw):
    while current in came_from:
        current = came_from[current]
        current.make_path()
        draw()




# A* algorithm
def astar_Algorithm(draw, grid, start, end):
    count = 0
    open_set = PriorityQueue()
    open_set.put((0, count, start))
    came_from = {}
    # calculatres the g(n) score
    g_score = {node: float("inf") for row in grid for node in row}
    g_score[start] = 0
    # calculates the f(n) score
    f_score = {node: float("inf") for row in grid for node in row}
    f_score[start] = h(start.get_pos(), end.get_pos())

    open_set_hash = {start}

    while not open_set.empty():
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()

        current = open_set.get()[2]
        open_set_hash.remove(current)

        if current == end:
            reconstruct_path(came_from, end, draw)
            end.make_end()
            start.make_start()
            return True

        for neighbor in current.neighbors:
            temp_g_score = g_score[current] + 1

            if temp_g_score < g_score[neighbor]:
                came_from[neighbor] = current
                g_score[neighbor] = temp_g_score
                f_score[neighbor] = temp_g_score + h(neighbor.get_pos(), end.get_pos())
                if neighbor not in open_set_hash:
                    count += 1
                    open_set.put((f_score[neighbor], count, neighbor))
                    open_set_hash.add(neighbor)
                    neighbor.make_open()

        draw()

        if current != start:
            current.make_closed()

    return False

def dijkstras_Algorithm(draw, grid, start, end):

    count = 0
    open_set = PriorityQueue()
    open_set.put((0, count, start))
    came_from = {}

    open_set_hash = {start}

    while not open_set.empty():
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()

        current = open_set.get()[2]
        open_set_hash.remove(current)

        
        for neighbor in current.neighbors:

            if neighbor == end:
                reconstruct_path(came_from, end, draw)
                end.make_end()
                start.make_start()
                draw()
                return True
                
            if neighbor.color != BLACK:  

                came_from[neighbor] = current

                if neighbor not in open_set_hash:
                    count += 1
                    open_set.put((0, count, neighbor))
                    open_set_hash.add(neighbor)
                    neighbor.make_closed()

        draw()

        #if current != start:
            #current.make_closed()




# Generates a 2d grid in pygame
def make_grid(rows, width):
    grid = []
    gap = width // rows
    for i in range(rows):
        grid.append([])
        for j in range(rows):
            node = Node(i, j, gap, rows)
            grid[i].append(node)

    return grid


# draws a 2d grid in pygame
def draw_grid(win, rows, width):
    gap = width // rows
    for i in range(rows):
        pygame.draw.line(win, GREY, (0, i * gap), (width, i * gap))
        for j in range(rows):
            pygame.draw.line(win, GREY, (j * gap, 0), (j * gap, width))


# draws nodes with mouse clicks
def draw(win, grid, rows, width):
    win.fill(WHITE)

    for row in grid:
        for node in row:
            node.draw(win)

    draw_grid(win, rows, width)
    pygame.display.update()


# get the position of where the mouse clicked in terms of X and Y (rows and cols)
def get_clicked_pos(pos, rows, width):
    gap = width // rows
    y, x = pos

    row = y // gap
    col = x // gap

    return row, col





def main(win, width):
    
    # how many rows there will be in the grid
    ROWS = int(input("how many rows do you want"))
    grid = make_grid(ROWS, width)

    # start and end variables for algorithm
    start = None
    end = None

    tempStartRow = 0
    tempStartCol = 0

    tempEndRow = 0
    tempEndCol = 0

    run = True
    while run:

        # calls draw and creates a grid
        draw(win, grid, ROWS, width)

        for event in pygame.event.get():

            if event.type == pygame.QUIT:
                run = False

            # when the left mouse button is pressed
            if pygame.mouse.get_pressed()[0]:  # LEFT
                pos = pygame.mouse.get_pos()
                # finds the mouse clicked position
                row, col = get_clicked_pos(pos, ROWS, width)
                node = grid[row][col]
                if not start and node != end:
                    start = node
                    start.make_start()

                    tempStart = start
                    
                    
                elif not end and node != start:
                    end = node
                    end.make_end()

                    tempEnd = end

                elif node != end and node != start:
                    node.make_barrier()
            # when the right mouse button is pressed
            elif pygame.mouse.get_pressed()[2]:  # RIGHT
                pos = pygame.mouse.get_pos()
                # finds the mouse clicked position
                row, col = get_clicked_pos(pos, ROWS, width)
                node = grid[row][col]
                node.reset()
                if node == start:
                    start = None
                elif node == end:
                    end = None

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_a and start and end:
                    for row in grid:
                        for node in row:
                            node.update_neighbors(grid)

                    astar_Algorithm(lambda: draw(win, grid, ROWS, width), grid, start, end)
            
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_d and start and end:
                    for row in grid:
                        for node in row:
                            node.update_neighbors(grid)

                    dijkstras_Algorithm(lambda: draw(win, grid, ROWS, width), grid, start, end)

                if event.key == pygame.K_r:
                    for row in grid:
                        for node in row:
                           node.reset()
                        
                        start = tempStart
                        start.make_start()

                        end = tempEnd
                        end.make_end()

                if event.key == pygame.K_c:

                    start = None
                    end = None
                    grid = make_grid(ROWS, width)

    pygame.quit()


main(WIN, WIDTH)

