calc_to_sec = 24 * 60 * 60
name_of_units = "seconds"
# print("Text " + str(256) + " Not text") # for Python < 3.6


def day_to_units(num_of_days, custom_message):
    print(f"{num_of_days} day are {num_of_days * calc_to_sec} {name_of_units}")
    print(custom_message)


day_to_units(365, "Hello")

