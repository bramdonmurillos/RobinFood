sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker robinserver