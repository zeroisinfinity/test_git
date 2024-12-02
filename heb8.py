""" x = "ab8de5"
y = ['g','h','a','b','e','5']
# 1. Combine x and y in one ds
# 2. eliminate repeating elements
# 3. Try to get this output: heb8
"""
x = "ab8de5"
y = ['g','h','a','b','e','5']

x_list = list(x)

for ele in y:
    if ele not in x_list:
        x_list.append(ele)

x_list.sort(reverse=True)

output = ''
for ans in x_list[0::2]:
    output+=ans

print(output)
