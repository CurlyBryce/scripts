[[ -z ${PROTON_PATH} ]] && PROTON_PATH=~/.steam/root/compatibilitytools.d/Proton-5.8-GE-2-MF/;
[[ -z ${STEAM_COMPAT_DATA_PATH} ]] && export STEAM_COMPAT_DATA_PATH=~/.proton;
cd "$PROTON_PATH";
./proton run "$1"
