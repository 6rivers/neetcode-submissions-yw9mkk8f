import math

class AreaCalc:
    # TODO: Implement calculate method
    def calculate(self, arg1, arg2=None):
        if arg2:
            area = arg1 * arg2
            return area
        else:
            area = round(math.pi * (arg1**2), 2)
            return area
    

    
# Don't modify the following code
calc = AreaCalc()
print(calc.calculate(5))    
print(calc.calculate(4, 6))
