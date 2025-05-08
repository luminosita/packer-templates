function usage {
	# Display Help
	echo "Create Vault configuration files"
	echo
	echo "Syntax: $script_name -f"
	echo "  -f     Configuration file."
	echo " "
}

while getopts ":f:" o; do
    case "${o}" in
        f)
            echo "Configuration: ${OPTARG}"
            config=${OPTARG}
            ;;
        *)
            usage

            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "$config" ]; then
    usage
    exit 1
fi

cluster=$(cat $config | yq '.cluster')
addrs=$(cat $config | yq '.nodes[].address')
names=$(cat $config | yq '.nodes[].name')

ip_flag=""

declare -a arr_addrs
declare -a arr_names

for addr in $addrs; do
    ip_flag+=" -p $addr"
    arr_addrs+=("$addr")
done

for name in $names; do
    arr_names+=("$name")
done

for i in "${!arr_addrs[@]}"; do 
    ssh -i ~/.ssh/id_test_rsa vault@${arr_addrs[$i]} 'hc_create_vault_config.sh -c $cluster-n ${arr_names[$i]}$ip_flag'
    ssh -i ~/.ssh/id_test_rsa vault@${arr_addrs[$i]} 'sudo systemctl restart vault'
done
