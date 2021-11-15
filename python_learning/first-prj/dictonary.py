input_data = input("Input days:unit\n").split(":")
my_dict = {"days": input_data[0], "unit": input_data[1]}

my_dict_wide = {"Europa": ["Russia", "Moscov" ], "unit": "day"}


print(f"DAY: {my_dict['days']} UNIT: {my_dict['unit']}\n")
print(type(my_dict))

print(my_dict_wide["Europa"])
