#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
echo "Please enter DB password:"
read -s mysql_root_password
echo "logfile location = $LOGFILE"

#exec >>$LOGFILE



if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

VALIDATE(){
    if [ $1 -ne 0 ]
   then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

# Install packages
apt update

apt install openjdk-17-jdk maven unzip -y
VALIDATE $? "Installing java and maven"

id localhelp &>/dev/null
if [ $? -ne 0 ];then
    useradd -m localhelp
    VALIDATE $? "Creating localhelp user"
else
    echo -e "localhelp user already created...$Y SKIPPING $N"
fi

# Ensure home directory exists
mkdir -p /home/localhelp

# Create Maven repo directory
mkdir -p /home/localhelp/.m2/repository

# Fix ownership
chown -R localhelp:localhelp /home/localhelp

# Set proper permissions
chmod -R 755 /home/localhelp

mkdir -p /app
chown localhelp:localhelp /app
VALIDATE $? "Creating app directory"

cd /app
rm -rf /app/localhelp-backend
git clone https://github.com/sbp828/localhelp-backend.git
VALIDATE $? "Cloning backend repository"
chown -R localhelp:localhelp /app/localhelp-backend

# Build application
cd /app/localhelp-backend
sudo -u localhelp mvn clean package -DskipTests
VALIDATE $? "Building Spring Boot JAR"

# Get JAR name dynamically
JARFILE=$(ls target/*.jar | head -n 1)


cp /home/ubuntu/local-backend/backend.service /etc/systemd/system/backend.service &>>$LOGFILE
VALIDATE $? "Copied backend service file"

# Reload systemd
systemctl daemon-reload
VALIDATE $? "Daemon reload"

# Start backend
systemctl start backend
VALIDATE $? "Starting backend"

systemctl enable backend
VALIDATE $? "Enabling backend"

apt install mysql-client -y
VALIDATE $? "Installing mysql client"

# Load DB schema (UPDATE IP + PATH)
mysql -h localhost -uroot -p${mysql_root_password} < /app/localhelp-backend/db/init.sql
VALIDATE $? "Loading schema"

# Restart backend
systemctl restart backend
VALIDATE $? "Restarting backend"

systemctl status backend




