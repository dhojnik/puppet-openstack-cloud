This is an setup that deploys an openstack cloud with release ocata using puppet 4, git, r10k hiera 5 and a in bash written external node classifer for roles and environments. It has been developed under FreeBSD as puppetmaster and tested with Ubuntu 16.04. But with some small changes it should also run with CentOS 7.2

Controller Node:
OpenVswitch, Keystone, Nova, Glance, Horizon, Neutron

Compute Node
OpenVswitch, Nova, Neutron...
take the favor of your favourite hypervisor at your choise :)

planned features....

integration of designate and magnum

integration for cinder and varios storage solutions as examples like isci, nfs, netapp or don't laugh sheepdog :)

integration for manila

this should also be a base to develope and port openstack finaly on FreeBSD 

thanks a lot by the guys behind https://deploymentsbook.com/ I'm using some code from them which hasincreased the speed of developing for me 
