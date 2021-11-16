def day_to_units(num_of_days, calc_to_sec, name_of_units):
    if num_of_days > 0:
        print(f"{num_of_days} day are {num_of_days * calc_to_sec} {name_of_units}\n")
    elif num_of_days == 0:
        print("Must be not equal 0")
    else:
        print("Enter number greater 0")


def validate_and_execute(num_of_days, calc_to_sec, name_of_units):
    try:
        print(f"For test Try {int(num_of_days)}\n")
    except ValueError:
        print("For test Try - ERROR")
    if num_of_days.isdigit():
        num_of_days_input = int(num_of_days)
        day_to_units(num_of_days_input, calc_to_sec, name_of_units)
    else:
        print("Text")
