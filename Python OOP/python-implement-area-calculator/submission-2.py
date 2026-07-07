import math

class AreaCalc:
    # TODO: Implement calculate method
    def calculate(self, arg1, arg2=None):
        if not arg2:
            return round(math.pi * arg1 ** 2, 2)
        else:
            return arg1 * arg2

    # def calculate(self, *args):
    #     if len(args) == 1:
    #         return round(math.pi * args[0] ** 2, 2)
    #     else:
    #         return args[0] * args[1]

    

    
# Don't modify the following code
calc = AreaCalc()
print(calc.calculate(5))    
print(calc.calculate(4, 6))
