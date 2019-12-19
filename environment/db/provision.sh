# steps to get 3.2.20 or do a specific version

# retireves the public key of the repo distro./ Import the public key used by the package management system
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

# creates a list file for mongodb, with the location of the librabries and dependencies it needs to retireve.
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update

# will start mongo automatically.
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# removes the default mongod.conf that was created so we can replace it. 
sudo rm /etc/mongod.conf

# syncing the first location on the vm to the other location on the vm so it can take effect.
# imagine
sudo ln -s /home/ubuntu/environment/mongod.conf /etc/mongod.conf

# restarts the mongo service for the changes in mongod.conf to take effect.
sudo systemctl restart mongod
sudo systemctl enable mongod


# sudo service mongod start
# sudo systemctl enable mongod.service
#
# mongo
