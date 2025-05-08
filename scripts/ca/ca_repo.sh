#!/bin/bash

set -e

create_ca_cnf() {
    cnf_dir=$1
    echo '# OpenSSL root CA configuration file.
# Copy to `/root/ca/openssl.cnf`.

[ ca ]
# `man ca`
default_ca = CA_default

[ CA_default ]
# Directory and file locations.' > "$cnf_dir/openssl.cnf"
    echo 'dir               = '$cnf_dir >> "$cnf_dir/openssl.cnf"
    echo 'certs             = $dir/certs
crl_dir           = $dir/crl
new_certs_dir     = $dir/newcerts
database          = $dir/index.txt
serial            = $dir/serial
RANDFILE          = $dir/private/.rand

# The root key and root certificate.
private_key       = $dir/private/ca.key.pem
certificate       = $dir/certs/ca.cert.pem

# For certificate revocation lists.
crlnumber         = $dir/crlnumber
crl               = $dir/crl/ca.crl.pem
crl_extensions    = crl_ext
default_crl_days  = 30

# SHA-1 is deprecated, so use SHA-2 instead.
default_md        = sha256

name_opt          = ca_default
cert_opt          = ca_default
default_days      = 375
preserve          = no
policy            = policy_strict

[ policy_strict ]
# The root CA should only sign intermediate certificates that match.
# See the POLICY FORMAT section of `man ca`.
countryName             = match
stateOrProvinceName     = match
organizationName        = match
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[ policy_loose ]
# Allow the intermediate CA to sign a more diverse range of certificates.
# See the POLICY FORMAT section of the `ca` man page.
countryName             = optional
stateOrProvinceName     = optional
localityName            = optional
organizationName        = optional
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[ req ]
# Options for the `req` tool (`man req`).
default_bits        = 2048
distinguished_name  = req_distinguished_name
string_mask         = utf8only

# SHA-1 is deprecated, so use SHA-2 instead.
default_md          = sha256

# Extension to add when the -x509 option is used.
x509_extensions     = v3_ca

[ req_distinguished_name ]
# See <https://en.wikipedia.org/wiki/Certificate_signing_request>.
commonName                      = Common Name
countryName                     = Country Name (2 letter code)
stateOrProvinceName             = State or Province Name
localityName                    = Locality Name
0.organizationName              = Organization Name
organizationalUnitName          = Organizational Unit Name
emailAddress                    = Email Address

# Optionally, specify some defaults.
countryName_default             = SR
stateOrProvinceName_default     = Serbia
localityName_default            = Belgrade
0.organizationName_default      = Local doo
organizationalUnitName_default  = Local Certificate Authority
emailAddress_default            =

[ v3_ca ]
# Extensions for a typical CA (`man x509v3_config`).
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ v3_intermediate_ca ]
# Extensions for a typical intermediate CA (`man x509v3_config`).
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true, pathlen:0
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ usr_cert ]
# Extensions for client certificates (`man x509v3_config`).
basicConstraints = CA:FALSE
nsCertType = client, email
nsComment = "OpenSSL Generated Client Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth, emailProtection

[ server_cert ]
# Extensions for server certificates (`man x509v3_config`).
basicConstraints = CA:FALSE
nsCertType = server
nsComment = "OpenSSL Generated Server Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer:always
keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth

[ crl_ext ]
# Extension for CRLs (`man x509v3_config`).
authorityKeyIdentifier=keyid:always

[ ocsp ]
# Extension for OCSP signing certificates (`man ocsp`).
basicConstraints = CA:FALSE
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, digitalSignature
extendedKeyUsage = critical, OCSPSigning' >> "$cnf_dir/openssl.cnf"
}

create_intermediate_cnf() {
    cnf_dir=$1
    echo '# OpenSSL intermediate CA configuration file.
# Copy to `/root/ca/intermediate/openssl.cnf`.

[ ca ]
# `man ca`
default_ca = CA_default

[ CA_default ]
# Directory and file locations.' > "$cnf_dir/openssl.cnf"
    echo 'dir               = '$cnf_dir >> "$cnf_dir/openssl.cnf"
    echo 'certs             = $dir/certs
crl_dir           = $dir/crl
new_certs_dir     = $dir/newcerts
database          = $dir/index.txt
serial            = $dir/serial
RANDFILE          = $dir/private/.rand

# The root key and root certificate.
private_key       = $dir/private/intermediate.key.pem
certificate       = $dir/certs/intermediate.cert.pem

# For certificate revocation lists.
crlnumber         = $dir/crlnumber
crl               = $dir/crl/intermediate.crl.pem
crl_extensions    = crl_ext
default_crl_days  = 30

# SHA-1 is deprecated, so use SHA-2 instead.
default_md        = sha256

name_opt          = ca_default
cert_opt          = ca_default
default_days      = 375
preserve          = no
policy            = policy_loose

copy_extensions   = copy

[ policy_strict ]
# The root CA should only sign intermediate certificates that match.
# See the POLICY FORMAT section of `man ca`.
countryName             = match
stateOrProvinceName     = match
organizationName        = match
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[ policy_loose ]
# Allow the intermediate CA to sign a more diverse range of certificates.
# See the POLICY FORMAT section of the `ca` man page.
countryName             = optional
stateOrProvinceName     = optional
localityName            = optional
organizationName        = optional
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[ req ]
# Options for the `req` tool (`man req`).
default_bits        = 2048
distinguished_name  = req_distinguished_name
string_mask         = utf8only

# SHA-1 is deprecated, so use SHA-2 instead.
default_md          = sha256

# Extension to add when the -x509 option is used.
x509_extensions     = v3_ca

[ req_distinguished_name ]
# See <https://en.wikipedia.org/wiki/Certificate_signing_request>.
commonName                      = Common Name
countryName                     = Country Name (2 letter code)
stateOrProvinceName             = State or Province Name
localityName                    = Locality Name
0.organizationName              = Organization Name
organizationalUnitName          = Organizational Unit Name
emailAddress                    = Email Address

# Optionally, specify some defaults.
countryName_default             = XX
stateOrProvinceName_default     = MyState
localityName_default            =
0.organizationName_default      = MyOrg
organizationalUnitName_default  =
emailAddress_default            =

[ v3_ca ]
# Extensions for a typical CA (`man x509v3_config`).
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ v3_intermediate_ca ]
# Extensions for a typical intermediate CA (`man x509v3_config`).
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true, pathlen:0
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ usr_cert ]
# Extensions for client certificates (`man x509v3_config`).
basicConstraints = CA:FALSE
nsCertType = client, email
nsComment = "OpenSSL Generated Client Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth, emailProtection

[ server_cert ]
# Extensions for server certificates (`man x509v3_config`).
basicConstraints = CA:FALSE
nsCertType = server
nsComment = "OpenSSL Generated Server Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer:always
keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
authorityInfoAccess = OCSP;URI:http://ocsp2.example.com
#subjectAltName = @alt_names

#[ alt_names ]
#DNS.1 = example.com
#DNS.2 = www.example.com
#DNS.3 = m.example.com

[ crl_ext ]
# Extension for CRLs (`man x509v3_config`).
authorityKeyIdentifier=keyid:always

[ ocsp ]
# Extension for OCSP signing certificates (`man ocsp`).
basicConstraints = CA:FALSE
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, digitalSignature
extendedKeyUsage = critical, OCSPSigning' >> "$cnf_dir/openssl.cnf"
}

server_sign() {
    _display_name="$1"
    _root_ca="$2"
    _subj="$3"
    _ip_sans="$4"

    _name=$(echo "$_subj" | sed -e "s/.*CN=\(\.*\)/\1/")
    _alt="subjectAltName = DNS:$_name,DNS:*.$_name,$_ip_sans"

    printf "\n%s" \
        "Signing Server $_display_name certificate (CA: $_root_ca, NAME: $_name, ALT: $_alt)" \
        ""
    sleep 2 # Added for human readability

    openssl ca -config "$_root_ca/openssl.cnf" -extensions server_cert \
        -days 375 -notext -md sha256 -in "$_root_ca/csr/$_name.csr.pem" \
        -out "$_root_ca/certs/$_name.cert.pem"
    chmod 444 "$_root_ca/certs/$_name.cert.pem"

    printf "\n%s" \
        "Verifing Server $_display_name certificate" \
        ""
    sleep 2 # Added for human readability

    openssl x509 -noout -text -in "$_root_ca/certs/$_name.cert.pem"

    openssl verify -CAfile "$_root_ca/certs/ca-chain.cert.pem" \
        "$_root_ca/certs/$_name.cert.pem"
}

ca_sign_intermediate() {
    _display_name="$1"
    _root_ca="$2"
    _name="$5"

    _root_ca_cert="$2/certs/$4.cert.pem"
    _csr_folder="$3/csr"
    _certs_folder="$3/certs"

    printf "\n%s" \
        "Signing CA $_display_name certificate (CA: $_root_ca_cert, CSR: $_csr_folder/$_name.csr.pem)" \
        ""
    sleep 2 # Added for human readability

    openssl ca -config "$_root_ca/openssl.cnf" -extensions v3_intermediate_ca \
        -days 3650 -notext -md sha256 -in "$_csr_folder/$_name.csr.pem" \
        -out "$_certs_folder/$_name.cert.pem"

    chmod 444 "$_certs_folder/$_name.cert.pem"

    printf "\n%s" \
        "Verifing CA $_display_name certificate" \
        ""
    sleep 2 # Added for human readability

    openssl x509 -noout -text -in "$_certs_folder/$_name.cert.pem"

    openssl verify -CAfile "$_root_ca_cert" "$_certs_folder/$_name.cert.pem"

    cat "$_certs_folder/$_name.cert.pem" "$_root_ca_cert" > \
        "$_certs_folder/ca-chain.cert.pem"
    chmod 444 "$_certs_folder/ca-chain.cert.pem"
}

server_csr() {
    _display_name="$1"
    _root_ca="$2"
    _subj="$3"
    _ip_sans="$4"

    _name=$(echo "$_subj" | sed -e "s/.*CN=\(\.*\)/\1/")
    _alt="subjectAltName = DNS:$_name,DNS:*.$_name,$_ip_sans"

    printf "\n%s" \
        "Generating Server $_display_name CSR (CA: $_root_ca, NAME: $_name, ALT: $_alt)" \
        ""
    sleep 2 # Added for human readability

    openssl genrsa -out "$_root_ca/private/$_name.key.pem" 2048
    chmod 400 "$_root_ca/private/$_name.key.pem"    
    
    openssl req -config "$_root_ca/openssl.cnf" \
        -key "$_root_ca/private/$_name.key.pem" \
        -new -sha256 -out "$_root_ca/csr/$_name.csr.pem" -subj "$_subj" \
        -addext "$_alt"
}

intermediate_csr() {
    _display_name="$1"
    _root_ca="$2"
    _name="$3"
    _subj="$4"

    printf "\n%s" \
        "Generating Server $_display_name CSR (CA: $_root_ca, NAME: $_name, SUBJ: $_subj)" \
        ""
    sleep 2 # Added for human readability

    openssl genrsa -aes256 -out "$_root_ca/private/$_name.key.pem" 4096
    chmod 400 "$_root_ca/private/$_name.key.pem"

    openssl req -config "$_root_ca/openssl.cnf" -new -sha256 \
        -key "$_root_ca/private/$_name.key.pem" \
        -subj "$_subj" -out "$_root_ca/csr/$_name.csr.pem"
}

ca_cert() {
    _display_name="$1"
    _root_ca="$2"
    _name="$3"
    _subj="$4"

    printf "\n%s" \
        "Generating CA $1 certificate (Cert: $_root_ca/certs/$_name.cert.pem, Subject: $_subj)" \
        ""
    sleep 2 # Added for human readability

    openssl genrsa -aes256 -out "$_root_ca/private/$_name.key.pem" 4096
    chmod 400 "$_root_ca/private/$_name.key.pem"

    openssl req -config "$_root_ca/openssl.cnf" \
        -key "$_root_ca/private/$_name.key.pem" \
        -new -sha256 -out "$_root_ca/certs/$_name.cert.pem" \
        -x509 -subj "$_subj" -days 7300 -extensions v3_ca 
    chmod 444 "$_root_ca/certs/$_name.cert.pem"
}

ca_dir() {
    _root_ca="$2"

    printf "\n%s" \
        "Generating CA $1 folder ($_root_ca)" \
        ""
    sleep 2 # Added for human readability

    mkdir -p "$_root_ca"

    mkdir -p "$_root_ca/certs" "$_root_ca/crl" "$_root_ca/newcerts" "$_root_ca/private"
    chmod 700 "$_root_ca/private"
    touch "$_root_ca/index.txt"
    echo 1000 > "$_root_ca/serial"

    if [ $1 != $ROOT ]; then
        mkdir -p "$_root_ca/csr"
        
        echo 1000 > "$_root_ca/crlnumber"
    fi

    printf "\n%s" \
        "Generating CA $1 configuration ($_root_ca)" \
        ""
    sleep 2 # Added for human readability
    
    if [ $1 == $ROOT ]; then
        create_ca_cnf "$_root_ca"
    else
        create_intermediate_cnf "$_root_ca"
    fi
}

init_ca() {
    _ca_info="/C=SR/ST=Serbia/L=Belgrade/O=$1 doo/OU=$1 Certificate Authority/CN=$1 Root CA"

    _root_ca_dir="$2"

    ca_dir "$ROOT" "$_root_ca_dir"

    ca_cert "$ROOT" "$_root_ca_dir" "$CA_KEY_NAME" "$_ca_info"
}

init_intermediate() {
    _ca_intermediate_info="/C=SR/ST=Serbia/L=Belgrade/O=$1 doo/OU=$1 Certificate Authority/CN=$1 Intermediate CA"

    _display_name="$2"
    _name="$3"
    _root_ca_dir="$4"
    _root_ca_intermediate_dir="$5"

    ca_dir "$_display_name" "$_root_ca_intermediate_dir"

    intermediate_csr "$_display_name" "$_root_ca_intermediate_dir" "$_name" "$_ca_intermediate_info"
    ca_sign_intermediate "$_display_name" "$_root_ca_dir" "$_root_ca_intermediate_dir" "$CA_KEY_NAME" "$_name"
}

usage() {
	# Display Help
	echo "CA Certificate Authority Repository"
	echo
	echo "Syntax: $script_name init_ca|init_int|server [-i|d|n|p]"
	echo "Init CA options:"
	echo "  -i     Organization name (e.g. Local)"
	echo "Init Intermediate options:"
	echo "  -i     Organization name (e.g. Local)"
	echo "  -n     CA Name (e.g. intermediate)"
	echo "  -d     CA Display Name (e.g. Intermediate)"
	echo "Server options:"
	echo "  -i     Server Info (e.g. /C=SR/ST=Serbia/L=Belgrade/O=Local doo/OU=Local Vault Service/CN=vault.lan)."
    echo "  -d     Server Display Name (e.g. Vault Service)"
	echo "  -n     CA Name (e.g. intermediate)"
    echo "  -p     IP SANS (e.g. IP:172.16.20.11,IP:172.16.20.12,IP:172.16.20.13)"
	echo "Environment:"
	echo "  CA_ROOT_DIR  CA Root Folder (e.g. /root)."
	echo " "

    exit 1
}

# Function to log messages
log() {
  local timestamp=$(date +'[%Y-%m-%d %H:%M:%S]')
  echo "$timestamp $1" | tee -a "$LOG_FILE"
}

DIR="$(pwd "$0")"
LOG_FILE="$logs_dir/template_creation_$(date +'%Y%m%d_%H%M%S').log"

ROOT="Root"
CA_KEY_NAME="ca"
root_dir="$CA_ROOT_DIR"
root_ca_dir="$root_dir/ca"
logs_dir="$DIR/logs"
tmp_dir="$DIR/tmp"

if [ -z "$1" ]; then usage; fi

command=$1

shift 1

while getopts ":i:d:n:p:" o; do
    case "${o}" in
        i)
            info=${OPTARG}
            ;;
        d)
            display_name=${OPTARG}
            ;;
        n)
            name=${OPTARG}
            ;;
        p)
            ip_sans=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

mkdir -p "$DIR/logs"
mkdir -p "$DIR/tmp"

echo "Root CA Folder: $root_ca_dir"

if [ $command == "init_ca" ]; then
    if [ -z "$info" ]; then
        usage
        exit 1
    fi

    init_ca "$info" "$root_ca_dir"
elif [ $command == "init_int" ]; then
    if [ -z "$info" ] || [ -z "$display_name" ] || [ -z "$name" ]; then
        usage
        exit 1
    fi

    root_ca_intermediate_dir="$root_ca_dir/$name"

    init_intermediate "$info" "$display_name" "$name" "$root_ca_dir" "$root_ca_intermediate_dir"
elif [ $command == "server" ]; then
    if [ -z "$info" ] || [ -z "$display_name" ] || [ -z "$name" ] || [ -z "$ip_sans" ]; then
        usage
        exit 1
    fi

    root_ca_intermediate_dir="$root_ca_dir/$name"

    server_csr "$display_name" "$root_ca_intermediate_dir" "$info" "$ip_sans"
    server_sign "$display_name" "$root_ca_intermediate_dir" "$info" "$ip_sans"
else 
    echo "Unsupported command !!!"

    exit 1
fi


