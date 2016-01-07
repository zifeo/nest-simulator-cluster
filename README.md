## NEST simulator cluster

Requires at least python 2.7 and DigitalOcean [python-bindings](https://github.com/koalalorenzo/python-digitalocean) (`pip install -U python-digitalocean`).
The deloy system was tested up to **1/2** million neurons (Brunnel balanced network) on **400**vcpus with **1.28**To RAM for ~19$ hourly.
This script is provided as is and comes with no warranty nor liability.

The command offers the following facilities:

- `./clusterify.py key [token]`: setup Digital Ocean token (empty for removing it)
- `./clusterify.py list`: list current cluster
- `./clusterify.py create [2|3|...] [1gb|2gb|...]`: create n-cluster of given size and setup ssh everywhere
- `./clusterify.py install [script]`: execute given bash script on each node
- `./clusterify.py run [1..] [program]`: run given python program on the cluster using mpi and n processes
- `./clusterify.py delete`: delete: remove current cluster

Common scenario (global installation takes 15 minutes on average):

```bash
./clusterify.py key digitalOceanToken
./clusterify.py create 4 8gb
./clusterify.py list
./clusterify.py install install_env.bash
./clusterify.py install install_nest.bash
./clusterify.py install install_stdpmodule.bash
./clusterify.py run 16 brunnel.py
./clusterify.py run 8 brunnel.py
./clusterify.py run 4 brunnel.py
./clusterify.py delete`
```