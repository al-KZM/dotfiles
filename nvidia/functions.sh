dl_vdi_file() {
  local filepath=$1
  local target=$2
  sshpass -p "$(pass show nvidia/main)" scp -r eshukrun@$NV_HOST_VDI:$filepath $target
}
