# SSH Tunnel Proxy Rotator

A lightweight Windows Batch script to automate the rotation of dynamic SSH tunnels (SOCKS proxies). This tool cycles through a list of remote servers at a defined interval, providing a rotating IP address for your local SOCKS5 proxy.

## 🚀 Features

* **Automated Rotation**: Automatically switches between multiple SSH backends.
* **Dynamic Port Forwarding**: Creates a SOCKS proxy on a specific local port (default `1080`).
* **Background Execution**: Runs tunnels in the background using `plink.exe` to keep the workspace clean.
* **Customizable Intervals**: Easily adjust how long the script stays connected to each server.

## 📋 Prerequisites

1.  **Windows OS**: Designed for execution in Command Prompt (`.bat`).
2.  **PuTTY (Plink)**: You must have `plink.exe` installed and available in your System PATH.
    * [Download PuTTY/Plink here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

## ⚙️ Configuration

Open `switch.bat` and update the **CONFIGURATION** section:

| Variable | Description |
| :--- | :--- |
| `SERVERS` | Space-separated list of remote server IPs. |
| `SSH_USER` | Your SSH login username. |
| `SSH_PASS` | Your SSH login password. |
| `LOCAL_PORT` | The local port for your SOCKS proxy (default: 1080). |
| `ROTATION_TIME` | Seconds to wait before switching to the next server. |

## 🛠️ Usage

1.  **Prepare the Script**: Ensure your server IPs and credentials are set in the script variables.
2.  **Run**: Double-click `switch.bat`.
3.  **Connection**: The script will connect to the first server, wait for the `ROTATION_TIME`, then kill the process and move to the next server in the list.
4.  **Configure Client**: Set your browser or application to use:
    * **Proxy Type**: SOCKS5
    * **Address**: `127.0.0.1`
    * **Port**: `1080` (or your chosen `LOCAL_PORT`)

## ⚠️ Security Warning

* **Plaintext Credentials**: This script stores your SSH password in plaintext. Avoid sharing this file or committing it to public repositories without removing your credentials.
* **Process Management**: The script uses `task
