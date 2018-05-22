#!/bin/bash

source common.properties

regex='^terraform.(.*)\((.*)\)'
if [[ "$1" =~ $regex ]]; then
    command="${BASH_REMATCH[1]}"
    dir="${BASH_REMATCH[2]%/}"
    dir="/${dir#/}"

    env=$( echo "$dir" | cut -d'/' -f2 )
    reg=$( echo "$dir" | cut -d'/' -f3 )
else
    echo "Error: unable to parse input with regular expression. Exiting..."
    exit 1
fi

echo -e "command: $command"
echo -e "tf dir: $dir"
echo -e "region: $reg"
echo -e "env: $env"

tf_bin="$tf_path/terraform"
working_dir="$PWD/../terraform${dir}"

case "$command" in
    get|apply|destroy)
        echo "Info: running terraform $command on $dir."
        cd "$working_dir"
        "$tf_bin" "$command"
        ;;
    plan)
        echo "Info: running terraform $command on $dir."
        cd "$working_dir"
        "$tf_bin" get
        "$tf_bin" init
        "$tf_bin" "$command"
        ;;
    init)
        echo "Info: running terraform $command on $dir."
        cd "$working_dir"

        "$tf_bin" init
        ;;
    plan-destroy)
        echo "Info: running terraform $command -destroy on $dir."
        cd "$working_dir"
        "$tf_bin" get
        "$tf_bin" plan -destroy
        ;;
    *)
        echo "Error: cannot recognize the verb '$command'. Exiting..."
        exit 1
        ;;
esac

echo 'Info: finished.'
exit 0
