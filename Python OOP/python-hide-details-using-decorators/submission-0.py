class SuperHero:
    def __init__(self, name: str, health: int, power_level: int):
        self.name = name
        self.__health = health
        self.__power_level = power_level
    
    # TODO: Add the getter and setter methods
    # Remember to use the @property decorator for the getter methods
    # Remember to use the @setter decorator for the setter methods

    @property
    def health(self):
        return self.__health

    @property
    def power_level(self):
        return self.__power_level


    @health.setter
    def health(self, value):
        if value >= 0 and value <= 100:
            self.__health = value
        elif value > 100:
            print("You can't set the health to more than 100")
        else:
            print("You can't set the health to less than 0")

    
    @power_level.setter
    def power_level(self, value):
        if value >= 1 and value <= 10:
            self.__power_level = value
        elif value > 10:
            print("You can't set the power level to more than 10")
        else:
            print("You can't set the power level to less than 1")


# Don't change the following code
super_hero = SuperHero("Batman", 80, 9)

print(super_hero.health) # this should print 80
super_hero.health = 110 # this should print You can't set the health to more than 100

print(super_hero.power_level) # this should print 9
super_hero.power_level = 100 # this should print You can't set the power level to more than 10
super_hero.power_level = 0 # this should print You can't set the power level to less than 1


# TODO: print the hero's attributes 
print(f"{super_hero.name} has {super_hero.health} health and {super_hero.power_level} power level.")

