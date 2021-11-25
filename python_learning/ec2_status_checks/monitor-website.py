import requests
import smtplib
import os
import paramiko

EMAIL_ADDRESS = os.environ.get('EMAIL_ADDRESS')
EMAIL_PASSWORD = os.environ.get('EMAIL_PASSWORD')  # tfdnfwxhzezbcjnq
DST_EMAIL_ADDRESS = 'tm_542@mail.ru'


def send_email(subject, email_text):
    with smtplib.SMTP('smtp.yandex.ru', 587) as smtp:
        smtp.starttls()
        smtp.ehlo()
        smtp.login(EMAIL_ADDRESS, EMAIL_PASSWORD)
        message = 'From: {}\nTo: {}\nSubject: {}\n\n{}'.format(EMAIL_ADDRESS, DST_EMAIL_ADDRESS, subject, email_text)
        smtp.sendmail(EMAIL_ADDRESS, DST_EMAIL_ADDRESS, message)


def restart_docker_ssh():
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect('18.219.0.183', username='ec2-user', key_filename='/home/maxim/devops/keys_for_ssh/server-1.pem')
    stdin, stdout, stderr = ssh.exec_command('docker ps')
    data = stdout.readlines()
    ssh.close()

    return data


try:
    respond = requests.get('https://18.219.0.183/', verify=False)

    if respond.status_code == 200:
        print(f"Telegram bot is OK, status code {respond.status_code}")
    else:
        print(f"Telegram bot error, status code {respond.status_code}")
        subject = 'Telegram Bot notify'
        email_text = f"Bot is DOWN, status code {respond.status_code}"
        send_email(subject, email_text)
        # print(restart_docker_ssh())

except Exception as ex:
    print(ex)
    subject = 'Telegram Bot notify'
    email_text = f"Exception:\n{ex}"
    send_email(subject, email_text)
    # print(restart_docker_ssh())
