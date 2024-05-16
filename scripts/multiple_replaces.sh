#Usage: <script> MAP_FILE DST_FILE
# Map file should be in format:
# replace_with replace_this

sed -i -f <(sed -r 's/^(\S*)\s*(.*)/s@\2@\1@/g' $1) $2
