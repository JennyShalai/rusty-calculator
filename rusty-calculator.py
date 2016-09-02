


def answer(str):

    # store output result here
    output = ""

    # valid chars can be in equation
    numbers = "0123456789"
    operations = "+*"

    # counters to hold operations as "+" and "*"
    counter_for_pluses = 0
    counter_for_multipliers = 0

    # check validity of input equation
    if len(str) % 2 == 0:
        return "Wrong input: equation has to have at least two operands and operation sign!"

    for index, char in enumerate(str):
        # check the validity of input based on valid chars
        if char not in numbers and char not in operations:
            return "There is not valid input: providing char is not valid!"

        # work with first char in equation
        if index == 0:
            if char in numbers:
                output += char
            else:
                return "Equation has to begin from number, not operation!"

        # work with chars at odd positions in equation
        if index % 2 != 0 and index > 0 and char in operations:
            if char == "*":
                counter_for_multipliers += 1
            elif char == "+":
                counter_for_pluses += 1
                if counter_for_multipliers > 0:
                    for i in range(counter_for_multipliers):
                        output += "*"
                    counter_for_multipliers = 0
            else:
                return "Wrong input: equation can not contain number with more then one digit!"

        # work with chars at even positions in equation
        if index % 2 == 0 and index > 0:
            if char in numbers:
                output += char
            else:
                return "Wrong input: equation can not contain number with more then one digit!"

    if counter_for_multipliers > 0:
        for i in range(counter_for_multipliers):
            output += "*"

    for i in range(counter_for_pluses):
        output += "+"

    return output

print(answer("2+3*2"))
print(answer("2*3+2"))
print(answer("2*4*3+9*3+5"))
print(answer("2*4*3+9+3*5"))
print(answer("2+"))
print(answer("*3+5"))
print(answer("24*3+5"))
print(answer("0"))