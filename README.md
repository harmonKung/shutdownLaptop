# harmon u
# 202/6/8

# shutdownLaptop
repository for an app that shuts down a laptop from local wifi
This project is intended for personal use on a trusted local network only.

The system has two parts:

1. iPhone App (SwiftUI / Swift Playgrounds)
   - Sends an HTTP request over local Wi-Fi

2. Windows Laptop Server (Python + Flask)
   - Listens for requests
   - Validates a secret token
   - Executes a shutdown command

--------
Requirements

On Windows Laptop
- Python 3.x installed  
  https://www.python.org/downloads/
- pip (comes with Python)
- Flask

Install Flask:
bash pip install flask

## IMPORTANT REQUIRMENTS
laptop server must bbe running
iphone and laptop same wifi network
correct ip address mmust be used
  - on command line: ipconfig
  - make sure your looking at ipv 4
secret token MUST match exactly

if it doesnt work, check the laptops firewall and if python has access
