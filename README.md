# Colab SSH Setup

This repository provides a script and example to set up an SSH connection to Google Colab, allowing you to use Colab's resources locally in VS Code for resource-intensive tasks like machine learning.

## Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/colab-ssh-setup.git
   cd colab-ssh-setup
Open scripts/colab_ssh_setup.sh and replace 'YOUR_NGROK_TOKEN' and 'YOUR_CHOSEN_PASSWORD' with your Ngrok token and desired SSH password.

Run the script in a Google Colab notebook:
```
!bash ./scripts/colab_ssh_setup.sh
```
Follow the instructions in the Colab output to establish an SSH connection.

Running the Flask App
Navigate to the examples/flask_app directory:
```
cd examples/flask_app
```
Install the required packages:
```
pip install -r ../../requirements.txt
```
Run the Flask app:
```
python app.py
```
Access the app by opening a browser and going to http://localhost:5000.

