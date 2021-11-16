"""
Block #1 of comments
Block #2 of comments
"""
# single comment

import dictonary

calc_to_sec = 24 * 60 * 60
name_of_units = "seconds"
list_of_days = ["1", "2", "33", "5", "6"]
my_test_list = ["January", "February", "March", "April"]
my_test_set = {"January", "February", "March", "April", "April"}

data = ""
while data != "q":
    data = input("Enter your data:\n")
    for days in data.split(","):
        dictonary.validate_and_execute(days, calc_to_sec, name_of_units)

for day in list_of_days:
    dictonary.validate_and_execute(day, calc_to_sec, name_of_units)

print(my_test_list[0])
my_test_list.append("April")

print(my_test_list)  # data type is list
print(set(my_test_list))  # # data type is set: only unique

print(type(my_test_list))
print(type(set(my_test_list)))

my_test_set.add("May")
print(f"My test set: {my_test_set}\n")
my_test_set.remove("January")
print(f"My test 'remove' set: {my_test_set}\n")

input_data = input("Input days:unit\n").split(":")
my_dict = {"days": input_data[0], "unit": input_data[1]}

my_dict_wide = {"Europa": ["Russia", "Moscov"], "unit": "day"}


print(f"DAY: {my_dict['days']} UNIT: {my_dict['unit']}\n")
print(type(my_dict))

print(my_dict_wide["Europa"])
