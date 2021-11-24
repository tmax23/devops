import requests
import smtplib
import os

EMAIL_ADDRESS = os.environ.get('EMAIL_ADDRESS')
EMAIL_PASSWORD = os.environ.get('EMAIL_PASSWORD')

# 'vzlet.altai@yandex.ru', 'EDyR9DZ4Te1'

respond = requests.get('https://xn----8sbafplsld1ed.xn--p1ai/')

if respond.status_code == 200:
    print("Site ZBS")
else:
    print("Slomalos")
    with smtplib.SMTP('smtp.yandex.ru', 465) as smtp:
        smtp.starttls()
        smtp.ehlo()
        smtp.login(EMAIL_ADDRESS, EMAIL_PASSWORD)
