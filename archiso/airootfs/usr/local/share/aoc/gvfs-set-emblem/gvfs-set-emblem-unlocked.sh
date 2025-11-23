run() {
cd # make sure we're in the home directory

for i in $@
do
    echo 'Changing stuff...'
    $(gio set $i -t stringv metadata::emblems vcs-normal)
done
echo 'Done!'
}

init() {

if [[ -z $@  ]]; then
    echo "No arguments provided"
else
    run $@
fi
}

init $@
