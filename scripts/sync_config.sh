if [[ -z "$CONFIG_DIR" ]]; then
	echo "CONFIG_DIR is not defined, cannot sync config directory"
	exit 1
fi

cd $CONFIG_DIR
git pull origin $(git rev-parse --abbrev-ref HEAD) 2> /tmp/sync_config_err > /dev/null

if [[ -n `cat /tmp/sync_config_err` ]]; then
	echo "Error while syncing config dir (script $0): "
	cat /tmp/sync_config_err
fi
