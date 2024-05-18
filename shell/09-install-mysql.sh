# check if user is root user or not

ID = id -u

echo ID
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi