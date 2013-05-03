#! /bin/bash

cd `dirname $0`

linkcmd="ln -s "
rmcmd="rm "

ignoreFiles=(
    _.ssh-config
)
ignoreFileTargets=(
    ~/.ssh/config
)

ignoreLink() {            # Generate the sed script to ignore some files
    ignoreSedSh=""
    elem=${#ignoreFiles[@]}
    strReturn=""

    for (( i=0; i < $elem; i++ )); do
        strReturn=$strReturn"/^"${ignoreFiles[$i]}"/d;"
    done

    ignoreSedSh=$strReturn              # Return sed script strings
}

linkCommand() {                         # Generate the link script
    ignoreLink                              # In order to define ignoreSedSh
    if [[ $1 = "link" ]]; then
        sedScript=(
            's:^\_.*$:&\ &:g'';'                # create simple copy
            's:\ \_\.:\ \~\/\.:g'';'            # generate the target name
            "s:^:$linkcmd\ `pwd`\/:g"           # generate the source pat
        )
    elif [[ $1 = "remove" ]]; then
        sedScript=(
            's:^\_\.:\~\/\.:g'';'               # generate the target name
            "s:^:$rmcmd\ :g"                    # generate the source pat
        )
    fi
    echo '#! /bin/bash'
    ls -1 |\
        sed '/^[^_]/d' |                    # start Sel
        sed -e "${ignoreSedSh}" |           # delete some ignore file line
        sed -e "${sedScript[*]}"
}

otherLink() {
    if [[ ${#ignoreFiles[@]} -eq ${#ignoreFileTargets[@]} ]]; then
        for (( i=0; i<${#ignoreFiles[@]} ; i++ )); do
            if [ -f ${ignoreFiles[$i]} ];then
                mkdir -p $(dirname ${ignoreFileTargets[$i]} )
                if [[ $1 = "link" ]]; then
                    ln -s "`pwd`/${ignoreFiles[$i]} " ${ignoreFileTargets[$i]}
                elif [[ $1 = "remove" ]]; then
                    rm ${ignoreFileTargets[$i]}
                fi
            fi
        done
    else
        echo "************************************"
        echo "Some files could not be linked well!"
        echo "************************************"
    fi
}


if [[ -z $1 ]] && [[ $1 != 'remove' ]] && [[ $1 != 'link' ]]; then
    echo "Usage: link.sh (link | remove)"
    echo "    link, create the soft link to the ~/ directory."
    echo "      Some file in the ignore group will be link to "
    echo "      the other directory."
    echo "    remove, remove all the soft link."
else
    if [[ -f linkScript.sh ]]; then
        rm linkScript.sh
    fi
    #linkCommand $1                        # For test
    linkCommand $1 |tee -a linkScript.sh   # Generate the script command
    otherLink $1
    chmod +x linkScript.sh
    ./linkScript.sh
    rm ./linkScript.sh
fi

# vim: sw=4 sts=4 et tw=70
