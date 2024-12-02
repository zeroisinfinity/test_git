"""Program to find the maximum element in a list"""
records = int(input("Enter the no.of records - "))
inp_list = [0]*records
for record in range(records):
    inp = float(input(f"Enter the {record + 1} number record - "))
    inp_list[record] = inp

max = inp_list[0]
for check in inp_list:
    if check > max:
        max = check

print("The max is {}".format(max))


