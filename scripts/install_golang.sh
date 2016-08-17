#!/bin/bash
if go version&>/dev/null; then
  echo 'Go ya está instalado. Nada que hacer.'
else
sudo su -c "
yum install -y golang
echo 'export GOROOT=/usr/lib/golang
export GOBIN=$GOROOT/bin
export GOPATH=/root
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' > /etc/profile.d/go.sh
"
sudo su vagrant -c "
echo '# Golang Path
export GOROOT=/usr/lib/golang
export GOBIN=$GOROOT/bin
export GOPATH=/home/vagrant
export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc
source /etc/profile
"
sudo su -c "
ldconfig
"
sudo su vagrant -c "
go version
go env
"
fi
#go get github.com/gin-gonic/gin
