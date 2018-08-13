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

![alt-text](https://ai2-s2-public.s3.amazonaws.com/figures/2017-08-08/137bb124d0f7cf1c08df6b96e40dbd09b8e0580a/1-Table1-1.png)

About Pervasive Encryption on LinuxONE
Pervasive encryption is a data-centric approach to information security that entails protecting data entering and exiting the z14 platform. It involves encrypting data in-flight and at-rest to meet complex compliance mandates and reduce the risks and financial losses of a data breach. It is a paradigm shift from selective encryption (where only the data that is required to achieve compliance is encrypted) to pervasive encryption. Pervasive encryption with z14 is enabled through tight platform integration that includes Linux on IBM Z or LinuxONE following features:

Integrated cryptographic hardware: Central Processor Assist for Cryptographic Function (CPACF) is a co-processor on every processor unit that accelerates encryption. Crypto Express features can be used as hardware security modules (HSMs).
Data set and file encryption: You can protect Linux file systems that is transparent to applications and databases.
Network encryption: You can protect network data traffic by using standards-based encryption from endpoint to endpoint.
LinuxONE Crypto Stack
Pervasive Encryption benefits of the full Power of Linux Ecosystem plus z14 Capabilities

LUKS dm-crypt – Transparent file & volume encryption using industry unique CPACF protected-keys
Network Security – Enterprise scale encryption and handshakes using z14 CPACF and SIMD (openSSL, IPSec...)
The IBM Z and LinuxONE systems provide cryptographic functions that, from an application program perspective, can be grouped as follows:

Synchronous cryptographic functions, provided by the CP Assist for Cryptographic Function (CPACF) or the Crypto Express features when defined as an accelerator.
Asynchronous cryptographic functions, provided by the Crypto Express features.
The IBM Z and LinuxONE systems provide also rich cryptographic functions available via a complete crypto stack made of a set of key crypto APIs. Image of the Crypto Stack

Note: Locate openSSL and dm-crypt. For the following, we will work on how set-up a Linux environment in order to benefit of Pervasive Encryption benefits.
