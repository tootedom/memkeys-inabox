Vagrant.configure("2") do |config|

  config.vm.define "memkeys" do |memkeys|
  	memkeys.vm.box = "centos64-x86_64-20140116"
  	memkeys.vm.provision :shell, :path => "provision.sh"
	memkeys.vm.synced_folder "sharedfolder/", "/home/vagrant/shared"
  	memkeys.ssh.forward_agent = true
	memkeys.vm.network "forwarded_port", guest: 80, host: 8181
  	memkeys.vm.provider "virtualbox" do |v|
    		v.memory = 300
  	end
  end
end
