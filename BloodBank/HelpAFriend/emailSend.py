import smtplib

content = "Hello "
mail = smtplib.SMTP('smtp.gmail.com',587)
mail.ehlo()
mail.starttls()
mail.login('email@example.com','enter.password')
mail.sendmail('helpafriend.bloodbank@gmail.com','divyashah.qa@gmail.com',content)
