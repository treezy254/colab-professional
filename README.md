# Cloudflared SSH Tunnel Setup

This guide explains how to set up SSH access through Cloudflare Argo Tunnel using the Cloudflared binary. This setup provides a secure way to access your server, including instructions for running it on Google Colab.

## Prerequisites

- A client machine running a Unix-like operating system (Linux, macOS, etc.).
- Cloudflared binary installed on your machine.
- SSH client installed.

## Installation and Setup

### Step 1: Download and Install Cloudflared

1. Download the latest Cloudflared `.deb` package from [Cloudflare Downloads](https://developers.cloudflare.com/argo-tunnel/downloads/).

2. Open a terminal and navigate to the directory where the `.deb` file is located:
   ```sh
   cd ~/Downloads
   ```

3. Install the package using `dpkg`:
   ```sh
   sudo dpkg -i cloudflared-linux-amd64.deb
   ```

### Step 2: Locate the Cloudflared Binary

1. Use the `which` command to find the absolute path of the installed Cloudflared binary:
   ```sh
   which cloudflared
   ```
   The output should be something like `/usr/local/bin/cloudflared`.

### Step 3: Configure SSH

1. Open your SSH config file with a text editor. If the file does not exist, create it:
   ```sh
   nano ~/.ssh/config
   ```

2. Append the following configuration to the SSH config file, replacing `<PUT_THE_ABSOLUTE_CLOUDFLARE_PATH_HERE>` with the path you obtained from the `which` command:
   ```sh
   Host *.trycloudflare.com
       HostName %h
       User root
       Port 22
       ProxyCommand <PUT_THE_ABSOLUTE_CLOUDFLARE_PATH_HERE> access ssh --hostname %h
   ```
   For example, if the path to the Cloudflared binary is `/usr/local/bin/cloudflared`, the configuration should be:
   ```sh
   Host *.trycloudflare.com
       HostName %h
       User root
       Port 22
       ProxyCommand /usr/local/bin/cloudflared access ssh --hostname %h
   ```

3. Save the changes and close the editor. In nano, press `Ctrl+X`, then `Y`, and finally `Enter`.

### Step 4: Test the SSH Connection

1. You can now test the SSH connection to your server via Cloudflare Tunnel:
   ```sh
   ssh your-server-name.trycloudflare.com
   ```

## Running on Google Colab

To set up SSH access on Google Colab using Cloudflared, follow these steps:

1. Open a new Colab notebook.

2. Run the following code in a Colab cell:
   ```python
   # Install colab_ssh on google colab
   !pip install colab_ssh --upgrade

   from colab_ssh import launch_ssh_cloudflared, init_git_cloudflared
   launch_ssh_cloudflared(password="root")
   ```

3. This code will install the `colab_ssh` package, set up an SSH tunnel using Cloudflared, and display the SSH command to connect to the Colab instance.

4. Use the displayed SSH command to connect to your Colab instance from your terminal:
   ```sh
   ssh root@<displayed-ssh-address>
   ```

## Troubleshooting

- Ensure that Cloudflared is properly installed and the path in the SSH config file is correct.
- Verify that your server is properly configured to use Cloudflare Argo Tunnel for SSH access.

## Additional Resources

- [Cloudflare Argo Tunnel Documentation](https://developers.cloudflare.com/argo-tunnel/)
- [SSH Configuration Guide](https://linux.die.net/man/5/ssh_config)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
