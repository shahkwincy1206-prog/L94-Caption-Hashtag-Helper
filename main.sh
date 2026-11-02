
#!/bin/bash

# L94 - Caption & Hashtag Helper

cd "$(dirname "$0")" || exit 1

# Import all project functions
source lib/functions.sh

# Handle command-line arguments
case "$1" in
    --help)
        show_help
        exit 0
        ;;
    --backup)
        do_backup
        exit 0
        ;;
    --cron)
        cron_task
        exit 0
        ;;
esac

# Main menu
while true
do
    echo
    echo "======================================"
    echo "       CAPTION & HASHTAG HELPER"
    echo "======================================"

    echo "1. Pick a random caption"
    echo "2. Add 5 random hashtags"
    echo "3. Count characters"
    echo "4. Check number of hashtags"
    echo "5. Save drafts with date"
    echo "6. View data"
    echo "7. Create backup"
    echo "8. View activity log"
    echo "0. Exit"

    echo "======================================"

    read -r -p "Choose an option: " choice

    case "$choice" in
        1)
            feature_1
            ;;
        2)
            feature_2
            ;;
        3)
            feature_3
            ;;
        4)
            feature_4
            ;;
        5)
            feature_5
            ;;
        6)
            view_data
            ;;
        7)
            do_backup
            ;;
        8)
            view_log
            ;;
        0)
            echo "Thank you for using Caption & Hashtag Helper!"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
