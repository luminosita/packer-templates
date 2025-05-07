- content: |-
    ${indent(4, file(custom_scripts[0]))}    
  path: /home/${username}/apt_repo.sh
  owner: "${username}:${username}"
  permissions: "0755"
