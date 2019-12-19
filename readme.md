# Task
spin up two separate virtual machines at the same time by altering the vagrant file. for This
we had to define the config ---> app or db depnding on the vagrant files we want associated with it.
in this case it was the node-app & mongo-database. so now rather than config.vm.box for the app we used
app.vm.box for example.

we also had to ensure the path of the provision script was specified correctly and in this example this was achieved by copying our mongodevenv db/ folder
to the multi machine vagrant environment folder.

## Example of two virtual machines being defined in one vagrant file

````
Vagrant.configure("2") do |config|
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder "app", "/home/ubuntu/app"
    app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
    #creates connection for the synced folders betwwen host and vm
    db.vm.synced_folder "environment/db", "/home/ubuntu/environment"
  end
  
````
