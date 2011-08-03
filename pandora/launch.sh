#!/bin/bash

terminal --title "get-flash-videos" --execute bash --rcfile get_flash_videos.bashrc

# problem: if user already has a bash terminal running, above command
# just forks off that and comes straight back, so we go crashing back to
# pnd_run.sh but that can't unmount the pnd because the filesystem is
# still in use.
# solution: if we're here and "bash --rcfile .get_flash_videos.bashrc" (which should be a
# unique command) is still running, then wait for it before exiting.  

for pid in $(ps hX | awk '{print $1}')
do
    command=$(ps h --pid $pid -o command)
    if [ "$command" == "bash --rcfile get_flash_videos.bashrc" ]
    then
        alive=1
        while [ "$alive" -eq "1" ]
        do
            kill -0 $pid;
            if [ "$?" -ne "0" ]; then
                alive=0
            fi
            sleep 1
        done
    fi
done
