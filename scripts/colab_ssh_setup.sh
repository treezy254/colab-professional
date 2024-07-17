#!/bin/bash

# Prevent disconnection by periodically clicking the "connect" button
echo "function ClickConnect(){
    console.log('Working');
    document.querySelector('colab-toolbar-button#connect').click()
}
setInterval(ClickConnect, 60000)" > keepalive.js

# Install Node.js to run the keepalive script
apt-get update
apt-get install -y nodejs

# Load the keepalive.js script in the background using Node.js
nohup node keepalive.js &

# Install required Python packages
pip install colab_ssh --upgrade
pip install fastprogress

# Setup SSH using colab_ssh
python - << 'END_PYTHON'
from colab_ssh import launch_ssh
launch_ssh('YOUR_NGROK_TOKEN', password='YOUR_CHOSEN_PASSWORD')
END_PYTHON

echo "SSH setup complete. Please check the output above for connection details."
