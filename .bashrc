# export PATH="$PATH:$HOME/bin"

alias ls="ls -laht"

# Convert manual page to HTML format and open it in Google Chrome
#suggested name: docs
manhtml() {
    if [ -z "$1" ]; then
        echo "Usage: manhtml <command>"
        return 1
    fi

    local cmd="$1"

    local tempdir="$HOME/tmp/manhtml"
    mkdir -p "$tempdir"/

    local htmlfile="${tempdir}/${cmd}.html"

    man -w $cmd | xargs mandoc -T html > $htmlfile && open -a "Google Chrome" $htmlfile
}

# display directories with executable files
#suggested name: path, display [path]
format_path() {
    echo $PATH | tr ':' '\n'
}

# display environment variables
#suggested name: env, display [env]
format_env() {
    echo -e "\nFormatted Environment Variables:"
    env | grep -v "^PATH=" | sed 's/=/\t/' | column -t -s $'\t'

    echo -e "PATH:"
    echo "$PATH" | tr ':' '\n' | sed 's/^/\t\t\t/'
}
