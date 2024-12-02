"""import math
a = "1a4b9c9d1e4fg"

# Separate the digits and alphabets into
# two different lists and find the sum
# of square roots of each digit
"""

import math
a = "1a4b9c9d1e4fg"
digit_bucket = list()
alpha_bucket = list()

for collect in a:
    if collect.isalpha():
        alpha_bucket.append(collect)
    elif collect.isnumeric():
        digit_bucket.append(collect)
    else:
        pass

print(f"List of alphabets is - {alpha_bucket}\nList of digits is - {digit_bucket}")

sum = 0
for result in digit_bucket:
    sum += math.sqrt(int(result))

print(f"The sum of square roots of each digit in {digit_bucket} is {sum}")