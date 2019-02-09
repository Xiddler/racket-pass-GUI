# racket-pass-GUI
racket-lang GUI for inputting credentials that will be saved in JSON format to a plaintext file
Because I have signed up to loads of web services and websites I need an easy  and standard way to enter new credentials.
This project creates a GUI using racket-lang. 

There are seven fields:
url-nick
website
email
username
password
date
note

The url-nick for www.drupal.org is drupal. This make finding  the credentials from the CLI very quick and easy.

The credentials are stored in JSON format in a plaintext file for maximum flexibility.

The plaintext file is encrypted. But this is optional if you're machine is safe.
