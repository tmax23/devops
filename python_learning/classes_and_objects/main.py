from user import User
from post import Post

app_user_one = User("mm@mm.mm", "Maxim", "pwd", "DevOps")
app_user_one.get_user_info()
app_user_one.change_job_title("SecOps")
app_user_one.get_user_info()

new_post = Post("Hello", app_user_one.name)

print(app_user_one.name)

new_post.get_post_info()
