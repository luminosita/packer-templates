#!/usr/bin/env bash

set -e

source common.sh

SCRIPT_PATH=$(realpath "$(dirname "$(follow_link "$0")")")
CONFIG_PATH=$(realpath "${1:-${SCRIPT_PATH}/config}")

menu_option_1() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/almalinux/9/
  echo -e "\nCONFIRM: Build a AlmaLinux 9 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a AlmaLinux 9 Template for Proxmox. ###
  echo "Building a AlmaLinux 9 Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_2() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/almalinux/8/
  echo -e "\nCONFIRM: Build a AlmaLinux 8 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a AlmaLinux 8 Template for Proxmox. ###
  echo "Building a AlmaLinux 8 Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_3() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/centos/9-stream/
  echo -e "\nCONFIRM: Build a CentOS 9 Stream Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a CentOS 9 Stream Template for Proxmox. ###
  echo "Building a CentOS 9 Stream Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_4() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/debian/12/
  echo -e "\nCONFIRM: Build a Debian 12 (Bookworm) Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Debian 12 (Bookworm) for Proxmox. ###
  echo "Building a Debian 12 (Bookworm) for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_5() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/debian/11/
  echo -e "\nCONFIRM: Build a Debian 11 (Bullseye) Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Debian 11 (Bullseye) for Proxmox. ###
  echo "Building a Debian 11 (Bullseye) for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_6() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/opensuse/leap-15-6/
  echo -e "\nCONFIRM: Build a OpenSUSE Leap 15.6 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a OpenSUSE Leap 15.6 Template for Proxmox. ###
  echo "Building a OpenSUSE Leap 15.6 Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_7() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/opensuse/leap-15-5/
  echo -e "\nCONFIRM: Build a OpenSUSE Leap 15.5 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a OpenSUSE Leap 15.5 Template for Proxmox. ###
  echo "Building a OpenSUSE Leap 15.5 Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_8() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/oracle/9/
  echo -e "\nCONFIRM: Build a Oracle Linux 9 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Oracle Linux 9 Template for Proxmox. ###
  echo "Building a Oracle Linux 9 Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_9() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/oracle/8/
  echo -e "\nCONFIRM: Build a Oracle Linux 8 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Oracle Linux 8 Template for Proxmox. ###
  echo "Building a Oracle Linux 8 Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_10() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/rocky/9/
  echo -e "\nCONFIRM: Build a Rocky Linux 9 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Rocky Linux 9 for Proxmox. ###
  echo "Building a Rocky Linux 9 for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_11() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/rocky/8/
  echo -e "\nCONFIRM: Build a Rocky Linux 8 Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Rocky Linux 8 for Proxmox. ###
  echo "Building a Rocky Linux 8 for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_12() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/ubuntu/24-04-lts/
  echo -e "\nCONFIRM: Build a Ubuntu Server 24.04 LTS Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Ubuntu Server 24.04 LTS Template for Proxmox. ###
  echo "Building a Ubuntu Server 24.04 LTS Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_13() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/ubuntu/22-04-lts/
  echo -e "\nCONFIRM: Build a Ubuntu Server 22.04 LTS Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Ubuntu Server 22.04 LTS Template for Proxmox. ###
  echo "Building a Ubuntu Server 22.04 LTS Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_14() {
  INPUT_PATH="$SCRIPT_PATH"/builds/iso/ubuntu/20-04-lts/
  echo -e "\nCONFIRM: Build a Ubuntu Server 20.04 LTS Template for Proxmox?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Ubuntu Server 20.04 LTS Template for Proxmox. ###
  echo "Building a Ubuntu Server 20.04 LTS Template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build -force \
      -var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_cloud_image() {
  INPUT_PATH="$SCRIPT_PATH/builds/cloud-image/$2"
  echo -e "\nCONFIRM: Build $1 cloud image template?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  echo "Building a $1 cloud image for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

menu_option_template() {
  INPUT_PATH="$SCRIPT_PATH"/builds/template/$2
  echo -e "\nCONFIRM: Build $1 ($4) template?"
  echo -e "\nContinue? (y/n)"
  read -r REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  echo "Building a $1 ($4) template for Proxmox..."

  ### Initialize HashiCorp Packer and required plugins. ###
  echo "Initializing HashiCorp Packer and required plugins..."
  packer init "$INPUT_PATH"

  ### Start the Build. ###
  echo "Starting the build...."
  packer build \
      -var "vm_clone_name=$4" \
      -var "vm_os_name=$3" \
      -var-file="$CONFIG_PATH/build.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/common.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/linux-storage.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/network.pkrvars.hcl" \
      -var-file="$CONFIG_PATH/proxmox.pkrvars.hcl" \
      "$INPUT_PATH"

  ### All done. ###
  echo "Done."
}

press_enter() {
  cd "$SCRIPT_PATH"
  echo -n "Press Enter to continue."
  read -r
  clear
}

info() {
  echo "License: BSD-2"
  echo ""
  echo "For more information, review the project README."
  read -r
}

incorrect_selection() {
  echo "Invalid selection, please try again."
}

menu_header() {
  clear
  echo ""
  echo "    ____                __                  ____                                             "
  echo "   / __ \ ____ _ _____ / /__ ___   _____   / __ \ _____ ____   _  __ ____ ___   ____   _  __ "
  echo '  / /_/ // __ `// ___// //_// _ \ / ___/  / /_/ // ___// __ \ | |/_// __ `__ \ / __ \ | |/_/ '
  echo " / ____// /_/ // /__ / ,<  /  __// /     / ____// /   / /_/ /_>  < / / / / / // /_/ /_>  <   "
  echo '/_/     \__,_/ \___//_/|_| \___//_/     /_/    /_/    \____//_/|_|/_/ /_/ /_/ \____//_/|_|   '
  echo ""
  echo -n "  Select a HashiCorp Packer build for your hypervisor:"
  echo ""
  echo ""
}

menu_iso() {
  menu_header
  echo "      Linux Distribution:"
  echo ""
  echo "       1  -  AlmaLinux 9"
  echo "       2  -  AlmaLinux 8"
  echo "       3  -  CentOS 9 Stream"
  echo "       4  -  Debian 12"
  echo "       5  -  Debian 11"
  echo "       6  -  OpenSUSE Leap 15.6"
  echo "       7  -  OpenSUSE Leap 15.5"
  echo "       8  -  Oracle Linux 9"
  echo "       9  -  Oracle Linux 8"
  echo "       10 -  Rocky Linux 9"
  echo "       11 -  Rocky Linux 8"
  echo "       12 -  Ubuntu Server 24.04 LTS"
  echo "       13 -  Ubuntu Server 22.04 LTS"
  echo "       14 -  Ubuntu Server 20.04 LTS"
  echo ""
  echo "      Other:"
  echo ""
  echo "        I   -  Information"
  echo "        Q   -  Quit"
  echo ""
  read -r selection
  echo ""
  case $selection in
    1 ) clear ; menu_option_1  ;;
    2 ) clear ; menu_option_2  ;;
    3 ) clear ; menu_option_3  ;;
    4 ) clear ; menu_option_4  ;;
    5 ) clear ; menu_option_5  ;;
    6 ) clear ; menu_option_6  ;;
    7 ) clear ; menu_option_7  ;;
    8 ) clear ; menu_option_8  ;;
    9 ) clear ; menu_option_9  ;;
    10) clear ; menu_option_10 ;;
    11) clear ; menu_option_11 ;;
    12) clear ; menu_option_12 ;;
    13) clear ; menu_option_13 ;;
    14) clear ; menu_option_14 ;;
    [Ii] ) clear ; info ;;
    [Qq] ) clear ; exit ;;
    * ) clear ; incorrect_selection ;;
  esac  
}

menu_cloud_image() {
  menu_header
  echo "      Linux Distribution:"
  echo ""
  echo "       1 -  Alpine Cloud Image 3.21.2"
  echo "       2 -  Ubuntu Cloud Image 24.04-lts"
  echo "       3 -  Debian Cloud Image 12-latest"
  echo "       4 -  GNS3 Cloud Image 3.0.4"
  echo ""
  echo "      Other:"
  echo ""
  echo "        I   -  Information"
  echo "        Q   -  Quit"
  echo ""
  read -r selection
  echo ""
  case $selection in
    1 ) clear
        if [ -z "$1" ]; then 
          menu_option_cloud_image "Alpine" "alpine/3.21.2" 
        else 
          menu_option_template $1 $2 "alpine" "linux-alpine-3.21.2" 
        fi
        press_enter
        ;;
    2 ) clear
        if [ -z "$1" ]; then 
          menu_option_cloud_image "Ubuntu" "ubuntu/24.04-lts" 
        else 
          menu_option_template $1 $2 "ubuntu" "linux-ubuntu-24.04-lts" 
        fi
        press_enter
        ;;
    3 ) clear
        if [ -z "$1" ]; then 
          menu_option_cloud_image "Debian" "debian/12-latest" 
        else 
          menu_option_template $1 $2 "debian" "linux-debian-12-latest" 
        fi
        press_enter
        ;;
    4 ) clear
        if [ -z "$1" ]; then 
          menu_option_cloud_image "GNS3" "gns3/3.0.4" 
        else 
          echo "Unsupported cloud image !!!"
        fi
        press_enter
        ;;
    [Ii] ) clear ; info ;;
    [Qq] ) clear ; exit ;;
    * ) clear ; incorrect_selection ;;
  esac  
}

menu_template() {
  menu_header
  echo "      Options:"
  echo ""
  echo "       1 -  Base"
  echo "       2 -  Generic"
  echo "       3 -  Vault 1.19.2"
  echo ""
  echo "      Other:"
  echo ""
  echo "        I   -  Information"
  echo "        Q   -  Quit"
  echo ""
  read -r selection
  echo ""
  case $selection in
    1 ) clear ; menu_cloud_image "Base" "base/0.0.1" ;;
    2 ) clear ; menu_cloud_image "Generic" "generic/0.0.1" ;;
    3 ) clear ; menu_cloud_image "Vault" "vault/1.19.2" ;;
    [Ii] ) clear ; info ;;
    [Qq] ) clear ; exit ;;
    * ) clear ; incorrect_selection ;;
  esac  
}

main_menu() {
  menu_header
  echo "      Options:"
  echo ""
  echo "       1  -  ISO"
  echo "       2  -  Cloud Image"
  echo "       3  -  Template"
  echo ""
  echo "      Other:"
  echo ""
  echo "        I   -  Information"
  echo "        Q   -  Quit"
  echo ""
  read -r selection
  echo ""
  case $selection in
    1 ) clear ; menu_iso  ; press_enter ;;
    2 ) clear ; menu_cloud_image ;;
    3 ) clear ; menu_template ;;
    [Ii] ) clear ; info ; press_enter ;;
    [Qq] ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac  
}

until [ "$selection" = "0" ]; do
  main_menu
done
