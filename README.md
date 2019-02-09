# racket-pass-GUI
This is a small project written using the racket-lang. It creates a GUI for inputting credentials that will be saved in JSON format to a plaintext file.

I created it because I have signed up to loads of web services and websites and I need an easy  and standard way to enter new credentials.


There are seven fields:
- url-nick
- website
- email
- username
- password
- date
- note

The url-nick for www.drupal.org is __drupal__. This makes finding the credentials using CLI tools like ag and ripgrep very quick and easy.

The credentials are stored in JSON format in a plaintext file for maximum flexibility.

The plaintext file is encrypted. But this is optional if you're machine is safe.
