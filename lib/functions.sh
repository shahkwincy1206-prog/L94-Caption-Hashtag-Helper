
#!/bin/bash

DATA="data/captions.txt"
TAGS="data/hashtags.txt"
LOG="logs/activity.log"
DRAFTS="reports/drafts.txt"
CHARACTER_LIMIT=280

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" >> "$LOG"
}

check_files() {
    if [[ ! -f "$DATA" || ! -f "$TAGS" ]]; then
        echo "Required data files are missing."
        return 1
    fi
}

feature_1() {
    check_files || return
    echo "Random caption:"
    tail -n +2 "$DATA" | sed '/^[[:space:]]*$/d' | shuf -n 1
    log "Random caption selected"
}

feature_2() {
    check_files || return
    read -r -p "Enter your caption: " caption

    if [[ -z "${caption//[[:space:]]/}" ]]; then
        echo "Caption cannot be empty."
        return
    fi

    selected=$(tail -n +2 "$TAGS" | shuf -n 5)

    echo "Your caption with 5 hashtags:"
    echo "$caption"
    printf '%s\n' "$selected" | tr '\n' ' '
    echo

    log "Five hashtags generated"
}

feature_3() {
    read -r -p "Enter caption: " caption

    count=$(printf '%s' "$caption" | wc -m | tr -d ' ')

    echo "Character count: $count"

    if (( count > CHARACTER_LIMIT )); then
        echo "Warning: Caption exceeds 280 characters!"
    else
        echo "Caption is within the character limit."
    fi

    log "Character count checked: $count"
}

feature_4() {
    read -r -p "Enter text containing hashtags: " text

    count=$(printf '%s' "$text" | grep -o '#' | wc -l | tr -d ' ')

    echo "Total hashtags: $count"

    if (( count > 5 )); then
        echo "Warning: More than 5 hashtags!"
    elif (( count == 0 )); then
        echo "No hashtags found."
    else
        echo "Hashtag count is within the limit."
    fi

    log "Hashtags counted: $count"
}

feature_5() {
    read -r -p "Enter caption to save: " caption

    if [[ -z "${caption//[[:space:]]/}" ]]; then
        echo "Draft cannot be empty."
        return
    fi

    {
        echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "Caption: $caption"
        echo "------------------------------"
    } >> "$DRAFTS"

    echo "Draft saved successfully!"
    log "Draft saved"
}

view_data() {
    check_files || return
    echo "CAPTION TEMPLATES:"
    cat -n "$DATA"
    echo
    echo "HASHTAGS:"
    cat -n "$TAGS"
    log "Data viewed"
}

do_backup() {
    mkdir -p backups
    file="backups/backup_$(date +%Y%m%d_%H%M%S).tar.gz"
    tar -czf "$file" data reports logs
    echo "Backup created: $file"
    log "Backup created"
}

view_log() {
    if [[ -f "$LOG" ]]; then
        tail -n 20 "$LOG"
    else
        echo "No activity yet."
    fi
}

show_help() {
    echo "Caption & Hashtag Helper"
    echo "./main.sh          Open menu"
    echo "./main.sh --help   Show help"
    echo "./main.sh --backup Create backup"
    echo "./main.sh --cron   Run scheduled task"
}

cron_task() {
    check_files || return
    mkdir -p reports

    idea=$(tail -n +2 "$DATA" | shuf -n 1)

    {
        echo "Post idea for $(date):"
        echo "$idea"
        echo
    } >> reports/idea.txt

    log "Daily post idea generated"
    echo "Daily post idea saved!"
}


cron_task() {
    check_files || return 1
    mkdir -p reports

    idea=$(tail -n +2 "$DATA" | sed '/^[[:space:]]*$/d' | shuf -n 1)

    if [[ -z "$idea" ]]; then
        echo "No caption ideas available."
        return 1
    fi

    {
        echo "Post idea for $(date '+%Y-%m-%d %H:%M:%S'):"
        echo "$idea"
        echo "------------------------------"
    } >> reports/idea.txt

    log "Daily post idea generated"
    echo "Daily post idea saved!"
}
