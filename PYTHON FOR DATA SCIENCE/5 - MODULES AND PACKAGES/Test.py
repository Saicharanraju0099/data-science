from PACKAGE.math import *
from PACKAGE.SUB_PACKAGE.mult import multiply
print(f"Addition: ",addition(9,8))
print(f"Substraction: ",sub(8,2))
print(f"Multiplication: ",multiply(8,9))

from PACKAGE.SUB_PACKAGE.Formatting import *
print(f"Lower case to Upper case: ",to_uppercase("Coding"))