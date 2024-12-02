"""In given list
1.add even numbered indexes to the total
2.subtract odd numbered indexes from the total
3.index 0 is considered an even index"""

records = int(input("Enter the no.of records - "))
inp_list = [0]*records
for record in range(records):
    inp = float(input(f"Enter the {record + 1} number record - "))
    inp_list[record] = inp

count , total = 0 , 0
for trav in inp_list:
    if count == 0:
        total += trav
        count = 1
    else:
        total -= trav
        count = 0
print("Total is {}".format(total))

total = 0
for trav in range(records):
    if trav & 1 == 0:
        total += inp_list[trav]
    else:
        total -= inp_list[trav]
print("Total is {}".format(total))
