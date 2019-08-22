Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = 'ubuntu-18'

  config.vm.network :forwarded_port, guest: 3000, host: 3001

  config.vm.synced_folder "./", "/vagrant", type: "nfs", mount_options: ['dmode=777','fmode=777']

  config.vm.provider 'virtualbox' do |v|
      v.memory = ENV.fetch('RAILS_DEV_BOX_RAM', 2048).to_i
      v.cpus   = ENV.fetch('RAILS_DEV_BOX_CPUS', 2).to_i
    end

end
