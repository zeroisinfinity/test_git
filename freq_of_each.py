"""a = [1, 1, 2, 1, 3, 4, 5, 4, 3]

#find the  frequency of each element in the list
"""
a = [1, 1, 2, 1, 3, 4, 5, 4, 3]
freq_dict = {}
for ele in a:
    if ele in freq_dict:
        freq_dict[ele] += 1
    else:
        freq_dict[ele] = 1

for ele , freq in freq_dict.items():
    print(f"Freq of {ele} is {freq}.")