if [[ -z "$CONFIG_DIR" ]]; then
	echo "CONFIG_DIR is not defined, cannot sync config directory"
	exit 1
fi

cd $CONFIG_DIR
git pull origin $(git rev-parse --abbrev-ref HEAD)

echo "Synced config dir at $CONFIG_DIR"
