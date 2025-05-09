#!/bin/bash

set -e

do_hash() {
    HASH_NAME=$1
    HASH_CMD=$2
    echo "${HASH_NAME}:"
    for f in $(find -type f); do
        f=$(echo $f | cut -c3-) # remove ./ prefix
        if [ "$f" = "Release" ]; then
            continue
        fi
        echo " $(${HASH_CMD} ${f}  | cut -d" " -f1) $(wc -c $f)"
    done
}

make_release_file() {
    rm -f $dists_stable_release
    rm -f $dists_stable_release_gpg
    rm -f $dists_stable_inrelease

    _curdir=$(pwd)
    cd $dists_stable

    release_content=$(cat $apt_repo_info)
    release_content+=$'\n'
    release_content+=$(do_hash "MD5Sum" "md5sum")
    release_content+=$'\n'
    release_content+=$(do_hash "SHA1" "sha1sum")
    release_content+=$'\n'
    release_content+=$(do_hash "SHA256" "sha256sum")
    release_content+=$'\n'

    echo "$release_content" | tee $dists_stable_release > /dev/null

    cd $_curdir
}

scan_packages() {
    _curdir=$(pwd)
    cd $apt_repo_dir

    dpkg-scanpackages --arch amd64 pool/ > $dists_stable_binary_amd64/Packages
    cat $dists_stable_binary_amd64/Packages | gzip -9 > $dists_stable_binary_amd64/Packages.gz

    cd $_curdir
}

create_pgp_key_info() {
    tee $pgp_key_info > /dev/null <<EOF
%echo Generating a local PGP key
Key-Type: RSA
Key-Length: 4096
Name-Real: $pgp_key_name
Name-Email: admin@kundun.dev
Expire-Date: 0
%no-ask-passphrase
%no-protection
%commit
EOF
}

create_apt_repo_info() {
    tee $apt_repo_info > /dev/null <<EOF
Origin: Local Repository
Label: Local
Suite: stable
Codename: stable
Version: 1.0
Architectures: amd64 arm64 arm7
Components: main
Description: An example software repository
Date: $(date -Ru)
EOF
}

create_pgp_keyring() {
    export GNUPGHOME="$(mktemp -d $pgp_dir/pgpkeys-XXXXXX)"

    gpg --no-tty --batch --gen-key $pgp_key_info
    gpg --armor --export $pgp_key_name > $pgp_dir/pgp-key.public
    gpg --armor --export-secret-keys $pgp_key_name > $pgp_dir/pgp-key.private

    gpg --dearmor -o $apt_repo_dir/pgp-key.gpg

    echo $GNUPGHOME | tee $DIR/.gnupghome
}

sign_release_file() {
    cat $dists_stable_release | gpg --default-key $pgp_key_name -abs > $dists_stable_release_gpg
    cat $dists_stable_release | gpg --default-key $pgp_key_name -abs --clearsign > $dists_stable_inrelease
}

load_pgp_keyring() {
    export GNUPGHOME=$(cat $DIR/.gnupghome)
}

usage() {
	# Display Help
	echo "Create Apt Repository"
	echo
	echo "Syntax: $script_name init|generate"
	echo "Init options:"
	echo "Generate options:"
	echo " "

    exit 1
}

# Function to log messages
log() {
    local timestamp=$(date +'[%Y-%m-%d %H:%M:%S]')
    sudo su -c "echo \"$timestamp $1\" | tee -a \"$LOG_FILE\" > /dev/null"

    printf "\n%s" \
        "$1" \
        ""
    sleep 2 # Added for human readability
}

DIR="$(pwd "$0")"
logs_dir="/var/log"
tmp_dir="/tmp"
LOG_FILE="$logs_dir/apt_repo_$(date +'%Y%m%d_%H%M%S').log"

pool_dir=$DIR/local/apt-repo/pool
pool_main_dir=$pool_dir/main
apt_repo_info=$DIR/local/apt_repo_info
apt_repo_dir=$DIR/local/apt-repo
dists_stable=$apt_repo_dir/dists/stable
dists_stable_release=$dists_stable/Release
dists_stable_release_gpg=$dists_stable/Release.gpg
dists_stable_inrelease=$dists_stable/InRelease
dists_stable_binary_amd64=$dists_stable/main/binary-amd64
pgp_dir=$DIR/pgp
pgp_key_name="local_key"
pgp_key_info=$pgp_dir/local_pgp_key.batch

if [ -z "$1" ]; then usage; fi

command=$1

shift 1

while getopts ":i:c:s:" o; do
    case "${o}" in
        i)
            vm_id=${OPTARG}
            # ((s == 45 || s == 90)) || usage
            ;;
        c)
            config_file_path=${OPTARG}
            ;;
        s)
            ssh_key_path=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ $command == "init" ]; then
    log "Initializing apt repository"

    if [ -d $pgp_dir ]; then 
        log "Removing old PGP folder"

        rm -rf $pgp_dir
    fi

    log "Creating apt repository folders"

    mkdir -p $pool_main_dir
    mkdir -p $dists_stable_binary_amd64
    mkdir -p $pgp_dir

    log "Creating apt repository info"

    create_apt_repo_info

    log "Creating PGP key info"

    create_pgp_key_info

    log "Creating PGP keyring"

    create_pgp_keyring

    log "Apt repository initialized. NOTE: Store $pgp/pgp-key.private securely."
elif [ $command == "generate" ]; then
    load_pgp_keyring

    scan_packages
    make_release_file
    sign_release_file
else
    log "Unsupported command !!!"
fi