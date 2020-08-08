# DH_parallel
Computation of the moduli file used by openssh for the Diffie-Hellman Group Exchange (DH-GEX) protocol with a coarse parallel approach.

**Details**

The computation of groups for the DH-GEX protocol is an expensive task, especially during the primality test. In the aim to speed-up this computation, the candidat list to the primality test is splitted in a bunch of smaller files then the primality test is applied on each file. Because its computation is indenpendant for each file it can be done in parallel significantly reducing the time of computation. Furthermore, it offers the possibility to increase the length of the number.
This script has been written after the [Logjam attack](https://weakdh.org/) 

**Dependencies**
 * Openssh 8.3
 * GNU Parallel
 
 **Note**
 
 1. For older Openssh version, the two commands using _ssh-keygen_ have to be updated with respect to the associated documentation.
 2. It may be wise to run this script either in a folder mounted as a tmpfs or an encrypted folder
