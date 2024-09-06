Vagrant.configure("2") do |config|

    # Use the official Ubuntu 20.04 LTS image
    config.vm.box = "ubuntu/focal64"
  
    # Forward port 8080 so Jenkins is accessible on http://localhost:8080
    config.vm.network "forwarded_port", guest: 8080, host: 8080
  
    # Allocate more memory and CPU to VM (optional but helpful for Jenkins)
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
  
    # Provisioning script to install Jenkins and dependencies
    config.vm.provision "shell", inline: <<-SHELL
      # Update and install required packages
      sudo apt-get update
      sudo apt-get install -y openjdk-11-jdk
  
      # Add Jenkins Debian package repository and key
      wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
      sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  
      # Install Jenkins
      sudo apt-get update
      sudo apt-get install -y jenkins
  
      # Start Jenkins service and enable it to start at boot
      sudo systemctl start jenkins
      sudo systemctl enable jenkins
  
      # Install Git (if needed for Jenkins jobs)
      sudo apt-get install -y git
    SHELL
  
  end
  