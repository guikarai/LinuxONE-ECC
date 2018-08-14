# Pervasive Encryption Applied - Hands-on LABs

## Elliptic-curve cryptography (ECC)
Elliptic-curve cryptography (ECC) is an approach to public-key cryptography based on the algebraic structure of elliptic curves over finite fields. ECC requires smaller keys compared to non-ECC cryptography (based on plain Galois fields) to provide equivalent security. Elliptic curves are applicable for key agreement, digital signatures, pseudo-random generators and other tasks. Indirectly, they can be used for encryption by combining the key agreement with a symmetric encryption scheme. They are also used in several integer factorization algorithms based on elliptic curves that have applications in cryptography, such as Lenstra elliptic-curve factorization.

## Why ECC?
ECC's main advantage is that you can use smaller keys for the same level of security, especially at high levels of security (AES-256 ~ ECC-512 ~ RSA-15424). Key advantages of ECC are:
* Smaller keys, ciphertexts and signatures.
* Very fast key generation.
* Fast signatures.
* Moderately fast encryption and decryption.
* Signatures can be computed in two stages, allowing latency much lower than inverse throughput.
* Good protocols for authenticated key exchange (FH-ECMQV et al).
* Binary curves are really fast in hardware.

The RSA algorithm is closing in on its 40th birthday and remains the standard public key exchange on the Internet today. However, researchers at Black Hat USA 2013 made a call for usage of elliptic curve cryptography in favor of the RSA algorithm, which the experts said could be cracked in the next five years.

The level of security in systems is becoming a primary concern as you would expect. Most cryptographic experts recommend that current systems offer at least 128 bits of security, but what does that really mean? 

Note that this is not the same thing as key length as many may think. Security comes from the combination of the specific algorithm and its key length. For example, it is generally thought that 128 bits of security can be achieved with 128-bit AES keys, 256-bit Elliptic Curve keys, and 3072-bit RSA keys. If implementation issues are ignored, then these algorithms with those specified key lengths will generally have the same level of security.

![alt-text](https://www.globalsign.com/files/1714/3284/2298/key-size-comparison.jpg)

# About Hands-on LAB Steps
* **Step 1** - [Preparing your Linux Environment to use hardware crypto](https://github.com/guikarai/LinuxONE-crypto-utils/blob/master/part1.md)
* **Step 2** - [Enabling OpenSSL and openSSH to use the Hardware](https://github.com/guikarai/LinuxONE-crypto-utils/blob/master/part2.md)
* **Step 2** - Creating RSA crypto materials and use them in various situation
* **Step 3** - Creating ECC crypto materials and use them in various situation
* **Step 4** - Comparing RSA and ECC regarding performance
