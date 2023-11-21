# Backup Script Project

This script automates the backup of a specified directory, allowing users to schedule regular backups. It includes functionality to delete the contents of the backup folder and create a new compressed archive.

## Table of Contents
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Scheduling Backups](#scheduling-backups)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Features

- Automated backup of a specified directory.
- Scheduled backups with the ability to delete old backups.
- Configurable settings via a configuration file.

## Getting Started

### Prerequisites

- Bash shell
- `cron` (for scheduling)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/hima890/backup-script.git
Navigate to the project directory:

bash
Copy code
cd backup-script
Make the script executable:

bash
Copy code
chmod +x backup_script.sh
Configuration
The script uses a configuration file (config.txt) for specifying project and backup folder paths. Update the config.txt file with your project and backup folder paths.

Example config.txt:

plaintext
Copy code
# Specify the path to your project folder
directory_to_compress="/path/to/your/project"

# Specify the path to your backup folder
backup_folder="/path/to/your/backup/folder"
Usage
Run the script manually:

bash
Copy code
./backup_script.sh
This will prompt you to initiate the backup process.

Scheduling Backups
To schedule the script to run daily using cron, open the crontab editor:

bash
Copy code
crontab -e
Add the following line to run the script every day at midnight:

plaintext
Copy code
0 0 * * * /path/to/your/backup_script.sh >/dev/null 2>&1 &
Save and exit the crontab editor.

Troubleshooting
If the script is not running as expected, check the log file (log.txt) for error messages and timestamps.
Contributing
Contributions are welcome! Please follow the Contribution Guidelines.

License
This project is licensed under the MIT License.

vbnet
Copy code
