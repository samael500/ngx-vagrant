ip_address = "10.1.1.111"
hostname = "vagrantstore"
box_name = "debian/jessie64"

Vagrant.configure(2) do |config|
  # Virtual machine parameters
  config.vm.box = box_name
  config.vm.network "private_network", ip: ip_address
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/proj", type: "nfs",
    :mount_options => ['actimeo=2']
  config.vm.hostname = hostname
  config.vm.post_up_message = "#{hostname} server successfuly started.
    Connect to host with:
    http://#{ip_address}/
    or over ssh with `vagrant ssh`

    Vagrant metadata examle GET:
      http://#{ip_address}/hosted/example
  "

  # Set box name
  config.vm.define :"#{hostname}" do |t|
  end
  # Virtualbox specific parameters
  config.vm.provider "virtualbox" do |v|
    v.name = "#{hostname}"
    v.memory = 2048
    v.cpus = 2
  end
  # Provisioning with shell script
  config.vm.provision "shell",
    path: "provision/provision.sh",
    privileged: false
end
