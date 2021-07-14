#! /bin/bash

user=$(whoami)

function share_key() {
	key_path="/home/${user}/.ssh/id_rsa.pub"
	ansible -k -m authorized_key -a "user=\'$1\' key=\'{{ lookup('file', \'${key_path}\') }}\'" all
}

function generate_key() {
	ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ''
}

function main() {
	echo -n "SSH User: "
	read ssh_user
	echo

	if [[ -f "/home/${user}/.ssh/id_rsa.pub" ]]; then
		echo "Using existing public key in: /home/${user}/.ssh/id_rsa.pub"
		share_key ${ssh_user}
	else
		echo "Generating new SSH Keypair..."
		generate_key 
		echo "SSH Keys generated successfully"
		share_key ${ssh_user}
	fi
}

main
