
# L94 – Caption & Hashtag Helper

## Linux Bash Scripting Project

### 1. Project Overview

Caption & Hashtag Helper is a Linux-based application developed using Bash Shell Scripting.

It helps users generate social media captions, add hashtags, check character limits, save caption drafts and manage content data.

### 2. Project Objectives

- Generate random social media captions.
- Automatically generate five hashtags.
- Count caption characters.
- Check the number of hashtags.
- Save captions with date and time.
- Maintain activity logs.
- Create compressed backups.
- Generate daily post ideas using Cron.

### 3. Technologies Used

- Operating System: Linux
- Language: Bash Shell Scripting
- Editor: GitHub Codespaces
- Version Control: Git and GitHub
- Scheduler: Cron
- Backup Utility: TAR

### 4. Project Features

| Option | Description |
|---|---|
| 1 | Pick a random caption |
| 2 | Add five random hashtags |
| 3 | Count characters |
| 4 | Check number of hashtags |
| 5 | Save drafts with date |
| 6 | View caption and hashtag data |
| 7 | Create compressed backup |
| 8 | View activity log |
| 0 | Exit application |

### 5. Project Structure

```text
L94-Caption-Hashtag-Helper/
│
├── main.sh
├── README.md
│
├── lib/
│   └── functions.sh
│
├── data/
│   ├── captions.txt
│   └── hashtags.txt
│
├── reports/
│   ├── drafts.txt
│   └── idea.txt
│
├── backups/
│
└── logs/
    └── activity.log
```

### 6. How to Execute

Give execution permission:

```bash
chmod +x main.sh lib/functions.sh
```

Run the application:

```bash
./main.sh
```

Display help:

```bash
./main.sh --help
```

Create backup:

```bash
./main.sh --backup
```

Generate a scheduled post idea:

```bash
./main.sh --cron
```

### 7. Cron Scheduling

The project uses Cron to generate a daily post idea at 7:00 PM.

Cron expression:

```cron
0 19 * * *
```

The generated idea is stored in:

```text
reports/idea.txt
```

### 8. Backup Management

The project creates compressed TAR.GZ backup files containing the data, reports and logs directories.

### 9. Conclusion

The Caption & Hashtag Helper project demonstrates practical Linux concepts, including Bash scripting, functions, file handling, logging, command-line arguments, backup management and Cron scheduling.

It provides a simple and useful solution for managing social media caption and hashtag ideas.

