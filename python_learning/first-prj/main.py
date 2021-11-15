"""
Block #1 of comments
Block #2 of comments
"""
# single comment

calc_to_sec = 24 * 60 * 60
name_of_units = "seconds"
list_of_days = ["1", "2", "33", "5", "6"]
my_test_list = ["January", "February", "March", "April"]
my_test_set = {"January", "February", "March", "April", "April"}

def day_to_units(num_of_days):
    if num_of_days > 0:
        print(f"{num_of_days} day are {num_of_days * calc_to_sec} {name_of_units}\n")
    elif num_of_days == 0:
        print("Must be not equal 0")
    else:
        print("Enter number greater 0")


def validate_and_execute(num_of_days):
    try:
        print(f"For test Try {int(num_of_days)}\n")
    except ValueError:
        print("For test Try - ERROR")
    if num_of_days.isdigit():
        num_of_days_input = int(num_of_days)
        day_to_units(num_of_days_input)
    else:
        print("Text")


data = ""
while data != "q":
    data = input("Enter your data:\n")
    for days in data.split(","):
        validate_and_execute(days)

for day in list_of_days:
    validate_and_execute(day)

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
