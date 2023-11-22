# Backup Script Project

This Bash script automates the backup of a specified directory, allowing you to run it at scheduled intervals. The script checks if 24 hours have passed since the last backup and, if so, initiates a new backup.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Automated Scheduling](#automated-scheduling)
- [Logs](#logs)
- [License](#license)

---

## Features

- **Automated Backup:** The script automatically backs up a specified directory.
- **Scheduled Backups:** You can schedule the script to run at specific intervals.
- **Log Files:** Logs are maintained to keep track of backup activities.

---

## Prerequisites

Before using the script, ensure you have the following prerequisites:

- Bash (shell scripting environment)
- Tar command (for creating compressed archives)
- Cron (for scheduling automated backups)

---

## Installation

1. Clone the repository or download the script to your local machine.

   ```bash
   git clone https://github.com/hima890/backup-script.git
   ```

2. Make the script executable.

   ```bash
   chmod +x backup_script.sh
   ```

---

## Configuration

Edit the `config.txt` file to set the paths and configurations:

```bash
# Specify the path to your project folder
directory_to_compress="/path/to/your/project"

# Specify the path to your backup folder
backup_folder="/path/to/your/backup/folder"
```

---

## Usage

Run the script manually:

```bash
./backup_script.sh
```

This will prompt you to initiate the backup. Follow the instructions to proceed.

---

## Automated Scheduling

To schedule the script to run automatically, add a cron job:

1. Open the crontab editor:

   ```bash
   crontab -e
   ```

2. Add a cron job entry to run the script every day at midnight:

   ```bash
   0 0 * * * /path/to/your/backup_script.sh >/dev/null 2>&1 &
   ```

   Save and exit the crontab editor.

---

## Logs

Logs are maintained in the `backup_log.txt` file. This file contains timestamps and messages related to backup activities.

---

## License

This project is licensed under the [MIT License](LICENSE).
```
