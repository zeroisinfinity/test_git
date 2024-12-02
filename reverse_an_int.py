"""Write a program to reverse an integer in Python."""

inp = int(input('Enter the integer : '))

def reverse_int(arg_int):
    print("Reverse by slicing : ",str(arg_int)[::-1])
    print("Reverse by joining reversed's object into string  : ",''.join(reversed(str(arg_int))))
    rev_int = ''
    for trav in str(arg_int)[::-1]:
        rev_int += trav
    print("Reverse by adding char by char in reverse fashion : ",rev_int)
    
    int_str = str(arg_int)
    length = len(int_str)
    rev_aggregate_int = 0
    for place_val in range(length - 1,-1,-1):
        rev_aggregate_int += int(int_str[ - length + place_val ]) * (10**place_val)
    print("Reverse by partially mathematical by handling exponents but loses precision : ",rev_aggregate_int)

    rev_aggregate_int2 = 0
    while arg_int > 0:
        rev_aggregate_int2 = rev_aggregate_int2 * 10  +  arg_int % 10
        arg_int //= 10
    print("Reverse by completely mathematical way reassigning result with each iteration but loses precision : ",rev_aggregate_int2)

reverse_int(inp) #NO TRAILING ZEROS SHOWN


