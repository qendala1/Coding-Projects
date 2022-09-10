Python 3.9.2 (tags/v3.9.2:1a79785, Feb 19 2021, 13:44:55) [MSC v.1928 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license()" for more information.
>>> def orderPizza():
  pizza=input("Welcome to Pizza. Would you like to order? [y/n]")
  if pizza == 'y':
    name()
  if pizza =='n':
    print("Thank you for not ordering")
    orderPizza()
  else:
    print("You gonna decide or what?")
    orderPizza()

def name():
  name=input("What is your name? ")
  print(" ")
  print(name+", what base would you like?")
  base()

def base():
  print("- BASE MENU - ")
  print("[g]luten free base")
  print("[n]ormal base")
  base=input("")
  if base=="g":
    crust()
  elif base=="n":
    crust()
  else:
    pickBase()

def pickBase():
  print("\nPlease pick a Base.")
  base()
  

def crust():
  print("\n- CRUST MENU -")
  print("[t]hin")
  print("[th]ick")
  print("[s]tuffed")
  crust=input('')
  if crust == "t":
    sauce()
  elif crust == "th":
    sauce()
  elif crust == "s":
    sauce()
  else:
    pickCrust()
    

def pickCrust():
  print("\nPlease pick a Crust.")
  crust ()
  
def sauce():
  print("\n- SAUCE MENU -")
  print("[b]bq")
  print("[t]omato") 
  print("[n]o sauce")
  sauce=input('')
  if sauce == "b":
    pizza()
  elif sauce == "t":
    pizza()
  elif sauce == "n":
    pizza()
  else:
    pickSauce()

def pickSauce():
  print("\nPlease pick a Sauce.")
  sauce()

def pizza():
  pizza = print("\n- PIZZA TYPE MENU -")
  print('[m]eat')
  print('[v]egetarian')
  print('[c]heese')
  pizza=input('')
  if pizza =='m':
    meatPizza()
  elif pizza =='v':
    vegePizza()
  elif pizza == 'c':
    cheesePizza()
  else:
    pickPizza()

def pickPizza():
  print("\nSeriously mate, pick a pizza ya gronk.")
  pizza()
  
def meatPizza():
  print("\n - MEAT MENU -")
  print("[m]eatlovers")
  print("[h]am and cheese")
  print("[s]upreme")
  answer = input('')
  if answer =='m':
    toppingsMenu()
  elif answer =='h':
    toppingsMenu()
  elif answer == 's':
    toppingsMenu()
  else:
    print("Seriously mate, pick a pizza ya gronk.")
    meatPizza()
  
def vegePizza():
  print("\n - VEGE MENU -")
  print("[v]egelover")
  print("[su]preme vege")
  print("[s]pinach")
  answer = input('')
  if answer =='v':
    toppingsMenu()
  elif answer =='su':
    toppingsMenu()
  elif answer == 's':
    toppingsMenu()
  else:
    print("Seriously mate, pick a pizza ya gronk.")
    vegePizza()

def cheesePizza():
  print("\n - CHEESE MENU -")
  print("[m]argherita")
  print("[p]lain cheese")
  print("[c]heesey garlic")
  answer = input('')
  if answer =='m':
    toppingsMenu()
  elif answer =='p':
    toppingsMenu()
  elif answer == 'c':
    toppingsMenu()
  else:
    print("Seriously mate, pick a pizza ya gronk.")
    cheesePizza()


def toppingsMenu():
  price = 0
  print("\n- TOPPINGS MENU -")
  print("[o]nion")
  print("[b]azil")
  print("[bp]bell peppers")
  print("[p]ineapple")
  print("[a]pple sauce")
  print("[n]o toppings")
  toppings=input('')
  if toppings =='o':
    moreToppings()
    price = 1.5
  elif toppings == 'b':
    moreToppings()
  elif toppings =='bp':
    moreToppings()
  elif toppings =='p':
    moreToppings()
  elif toppings == 'a':
    moreToppings()
  elif toppings == 'n':
    extraQuestion()
  else:
    print("its not that hard")
    toppingsMenu()
  return price

def moreToppings():
  print("\nWould you like more toppings [y/n]")
  moreToppings=input('')
  if moreToppings =='y':
    toppingsMenu()
  else:
    extraQuestion()

def extraQuestion():
  print("\nWould you like any Extras? [y/n]")
  extraQ=input()

  if extraQ == 'y':
    extraOptions()
  else:
    drinksQuestion()

def extraOptions():
  print("\n- EXTRA MENU -")
  print("[g]arlic bread")
  print("[h]ot chips")
  print("[p]otato wedges")
  print("[s]weet potato wedges")
  print("[c]ancel")
  drinks=input()
  if drinks == 'g':
    moreExtraOptions()
  elif drinks == 'h':
    moreExtraOptions()
  elif drinks == 'p':
    moreExtraOptions()
  elif drinks == 's':
    moreExtraOptions()
  elif drinks == 'c':
    drinksQuestion()
  else:
    print("Please choose an option or cancel.")
    extraOptions()

def moreExtraOptions():
  print("\nWould you like more Extras? [y/n]")
  moreExtras=input()

  if moreExtras == 'y':
    extraOptions()
  else: 
    drinksQuestion

def drinksQuestion():
  print("\nWould you like a Drink? [y/n]")
  drinksQ=input()

  if drinksQ == 'y':
    drinks()
  else: 
    invoice()
  
def drinks():
  print("\n- DRINKS MENU -")
  print("[c]oke")
  print("[f]anta")
  print("[w]ater")
  drinks=input()
  if drinks == 'c':
    invoice()
  elif drinks == 'f':
    invoice()
  elif drinks == 'w':
    invoice()
  else:
    print("Thank you for not ordering.")
    orderPizza()

def moreDrinksOptions():
  print("Would you like more Drinks? [y/n]")
  moreDrinks=input()

  if moreDrinks == 'y':
    drinks()
  else: 
    invoice()

def invoice():
  print("\n\n- YOUR ORDER -")
  return base



orderPizza()
