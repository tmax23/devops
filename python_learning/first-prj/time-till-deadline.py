from datetime import datetime

user_input = input("Enter your goal with with a deadline separated by colon\n")
input_list = user_input.split(":")

goal = input_list[0]
deadline = input_list[1]

deadline_data = datetime.strptime(deadline, "%d.%m.%Y")
# Calculate how many days from now till deadline
time_till = deadline_data - datetime.today()
print(f"User, time to you goal: {goal} is {time_till.days} days\n")
print(f"User, time to you goal: {goal} is {int(time_till.total_seconds() / 60 / 60)} hours\n")
print(f"User, time to you goal: {goal} is {int(time_till.total_seconds() / 60 )} minutes\n")
print(f"User, time to you goal: {goal} is {int(time_till.total_seconds())} secounds\n")
