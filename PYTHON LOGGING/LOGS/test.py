import logging
def add(a, b):
    logging.debug("The addition operation is being performed")
    result = a + b
    logging.debug("The addition function is called")
    return result

print(add(2, 2))

