cd;
cat << 'catEND' >> .zshrc
alias pupdate='sudo apt update && apt list --upgradable'
alias plsblk='lsblk -o NAME,TYPE,FSTYPE,FSUSE%,FSAVAIL,SIZE,MOUNTPOINTS -J; lsblk -o NAME,TYPE,FSTYPE,FSUSE%,FSAVAIL,SIZE,MOUNTPOINTS'
catEND
