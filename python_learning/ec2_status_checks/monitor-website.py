import requests
import smtplib
import os

EMAIL_ADDRESS = os.environ.get('EMAIL_ADDRESS')
EMAIL_PASSWORD = os.environ.get('EMAIL_PASSWORD')
DST_EMAIL_ADDRESS = 'tm_542@mail.ru'


def send_email(subject, email_text):
    with smtplib.SMTP('smtp.yandex.ru', 587) as smtp:
        smtp.starttls()
        smtp.ehlo()
        smtp.login(EMAIL_ADDRESS, EMAIL_PASSWORD)
        message = 'From: {}\nTo: {}\nSubject: {}\n\n{}'.format(EMAIL_ADDRESS, DST_EMAIL_ADDRESS, subject, email_text)
        smtp.sendmail(EMAIL_ADDRESS, DST_EMAIL_ADDRESS, message)


try:
    respond = requests.get('https://xn----8sbafplsld1ed.xn--p1ai66/1/')

    if respond.status_code == 200:
        print(f"Site worked, status code {respond.status_code}")
    else:
        print(f"Error, status code {respond.status_code}")
        subject = 'WEB site monitor'
        email_text = f"Site is DOWN, status code {respond.status_code}"
        send_email(subject, email_text)
except Exception as ex:
    subject = 'WEB Exception'
    email_text = f"{ex}"
    send_email(subject, email_text)
