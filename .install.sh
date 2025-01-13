# Run MacOS specific installations.
if [[ $(uname) == "Darwin" ]]; then
    [ -f .installmacos.sh ] && source .installmacos.sh
fi
