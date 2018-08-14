# ECC pubic key activities

We already tested RSA performance, now lets test ECC performance. That way you will be able to compare later.

In this section, let's test performance of ECC in very different conditions. We will used openssl under the cover, in order to perform all the cryptographic activities. That is good, because in previous section, we optimized opensssl in order to speed-up the hardware way cryptographic operations.

Please now move in the ECC directory thanks to the follwing command:
```
cd ECC/
```

List the content of the directory with the following command:
```
ls -l
total 60
-rwxr-xr-x 1 root root   747 Aug 14 14:05 generateECCcertificates.sh
-rwxr-xr-x 1 root root   628 Aug 14 13:30 generateECCkeys.sh
-rwxr-xr-x 1 root root   529 Aug 14 13:29 signPDFwithECC.sh
-rw-r--r-- 1 root root 41044 Aug 14 14:00 test.pdf
-rwxr-xr-x 1 root root   732 Aug 14 13:30 verifyPDFwithECC.sh
```

As you can see, there are a set of script designed to test ECC cryptographic activities. During this section, we we will generate key pairs using ECC with different size of ECC key. 

Key sizes and curves are: prime256v1 secp384r1 secp521r1

Then we will use generated ECC keys to sign a pdf file, and to verify the digital signature of this pdf file. To conclude we will generate according ECC keys ECC digital certificate complying with x509. 

Let's make all these script executeable thanks to the following command:
```
chmod +x *.sh
```

## RSA performance table

The following performance table need to be completed by you during this lab part. This is important to provide at the end a summary of the perforance degradation of ECC cryptographic operation according key size.

ECC Key size in bits | Key generation in seconds |  Digital signature in seconds  | Signature verification in seconds  | Certificate generation in seconds | TLS Handshakes
------------ | ------------------ | ----------------------- | --------------------------- | -------------------------- | ----------
prime256v1    | | | | |
secp384r1     | | | | |
secp521r1     | | | | |

## Generating keys with ECC

Let's put first thing first and let generate one ECC key pair according key size. Issue the following command.
```
./generateECCkeys.sh
****************** BEGIN OF TEST OF ECC KEYS GENERATION ****************************
****************** SIGNATURE prime256v1  ****************************
 ECC Key Generation with prime256v1
engine "ibmca" set.

real	0m0.009s
user	0m0.007s
sys	0m0.002s
engine "ibmca" set.
read EC key
writing EC key

real	0m0.007s
user	0m0.005s
sys	0m0.001s
End of Test for prime256v1

****************** SIGNATURE secp384r1  ****************************
 ECC Key Generation with secp384r1
engine "ibmca" set.

real	0m0.010s
user	0m0.009s
sys	0m0.001s
engine "ibmca" set.
read EC key
writing EC key

real	0m0.006s
user	0m0.005s
sys	0m0.001s
End of Test for secp384r1

****************** SIGNATURE secp521r1  ****************************
 ECC Key Generation with secp521r1
engine "ibmca" set.

real	0m0.015s
user	0m0.013s
sys	0m0.001s
engine "ibmca" set.
read EC key
writing EC key

real	0m0.006s
user	0m0.005s
sys	0m0.001s
End of Test for secp521r1

******************END OF TEST SIGNATURE ECC Ciphers ****************************
```

Please, report to the performance table, the sum of **real+user+sys** time according key size for the column "**Key generation in seconds**". I guest you also realize this is very very FAST! Isn't?

Let's see together what has been generated. Please issue the following command:
```
ls -l p*
-rw-r--r-- 1 root root 227 Aug 14 15:23 private-prime256v1.pem
-rw-r--r-- 1 root root 288 Aug 14 15:23 private-secp384r1.pem
-rw-r--r-- 1 root root 365 Aug 14 15:23 private-secp521r1.pem
-rw-r--r-- 1 root root 178 Aug 14 15:23 public-prime256v1.pem
-rw-r--r-- 1 root root 215 Aug 14 15:23 public-secp384r1.pem
-rw-r--r-- 1 root root 268 Aug 14 15:23 public-secp521r1.pem
```

As you can see, we generated for each ECC key size, two keys (one public, and one private).

## Signing a pdf file with ECC

Now, we have enough crypto materials. Let's reuse generated private keys to test how long it takes to **perform 100x digital signatures** of a 3MB pdf file with various ECC key size. Please, issue the following command:
```
./signPDFwithECC.sh
****************** BEGIN OF TEST SIGNATURE ECC Ciphers ****************************
****************** SIGNATURE prime256v1  ****************************
100x ECC Signature with prime256v1

real	0m0.495s
user	0m0.263s
sys	0m0.092s
End of Test for prime256v1

****************** SIGNATURE secp384r1  ****************************
100x ECC Signature with secp384r1

real	0m0.548s
user	0m0.328s
sys	0m0.087s
End of Test for secp384r1

****************** SIGNATURE secp521r1  ****************************
100x ECC Signature with secp521r1

real	0m0.642s
user	0m0.459s
sys	0m0.083s
End of Test for secp521r1

******************END OF TEST SIGNATURE ECC Ciphers ****************************
```

Please, report to the performance table, the sum of **real+user+sys** time according key size for the column "**Digital signature in seconds**". Still insanely FAST!!!

Let's see together what has been generated. Please issue the following command:
```
ls -l *.bin
-rw-r--r-- 1 root root  71 Aug 14 15:25 signature-prime256v1.bin
-rw-r--r-- 1 root root 103 Aug 14 15:25 signature-secp384r1.bin
-rw-r--r-- 1 root root 139 Aug 14 15:25 signature-secp521r1.bin
```

As you can see, we generated in a separated file (all files with .bin extension) the digital signature of the 3MB pdf file and according each key size. Very interresting for digital signature verification.

## Verifying digital signature of a pdf file with ECC

We have enough crypto materials. We have a detached digital signature file. Let's reuse generated public keys to test how long it takes to **verify 100x digital signatures** of a 3MB pdf file with various RSA key size. Please, issue the following command:

```
./verifyPDFwithECC.sh
****************** BEGIN OF TEST SIGNATURE VERIFICATTION ECC Ciphers ****************************
****************** SIGNATURE VERIFICATION WITH prime256v1 ************************************************
100x ECC Signature verification with prime256v1

real	0m0.376s
user	0m0.261s
sys	0m0.087s
End of Test for prime256v1

****************** SIGNATURE VERIFICATION WITH secp384r1 ************************************************
100x ECC Signature verification with secp384r1

real	0m0.446s
user	0m0.337s
sys	0m0.086s
End of Test for secp384r1

****************** SIGNATURE VERIFICATION WITH secp521r1 ************************************************
100x ECC Signature verification with secp521r1

real	0m0.615s
user	0m0.489s
sys	0m0.086s
End of Test for secp521r1

****************** END OF TEST SIGNATURE VERIFICATION ECC Ciphers ****************************
```

Please, report to the performance table, the sum of **real+user+sys** time according key size for the column "**Signature verification in seconds**". Huhhh... too fast again.

## Generating x509 digital certificates with RSA

Let's reuse generated public and private keys to test how long it takes to **generate 10x digital certificates** with various RSA key size. Please, issue the following command:

```
./generateRSAcertificates.sh
****************** BEGIN OF RSA CERTIFICATE GENERATION  ****************************
****************** CERTIFICATE WITH  1024  ****************************
10x RSA CERTIFICATE  with 1024

real	0m2.725s
user	0m2.424s
sys	0m0.143s
End of Test for 1024

****************** CERTIFICATE WITH  2048  ****************************
10x RSA CERTIFICATE  with 2048

real	0m14.471s
user	0m13.293s
sys	0m0.190s
End of Test for 2048

****************** CERTIFICATE WITH  3072  ****************************
10x RSA CERTIFICATE  with 3072

real	0m52.000s
user	0m48.090s
sys	0m0.252s
End of Test for 3072

****************** CERTIFICATE WITH  4096  ****************************
10x RSA CERTIFICATE  with 4096

real	2m20.024s
user	2m10.473s
sys	0m0.301s
End of Test for 4096

[**** Truncated ****]
```

Please, report to the performance table, the sum of **real+user+sys** time according key size for the column "**Certificate generation in seconds**". Don't you see the production limit of the RSA while hardening a digital certificates with bigger keys? And this is only about generating 10x x509 digital certificates !!! 

This mainly explain why RSA will not be good for production beyond a key size of 4096.

Let's see together what has been generated. Please issue the following command:
```
ls -l mycert*
-rw-r--r-- 1 root root 1783 Aug 14 15:07 mycert-1024.pem
-rw-r--r-- 1 root root 2924 Aug 14 15:07 mycert-2048.pem
-rw-r--r-- 1 root root 4058 Aug 14 15:08 mycert-3072.pem
-rw-r--r-- 1 root root 5187 Aug 14 15:11 mycert-4096.pem
-rw-r--r-- 1 root root 9132 Aug 14 15:11 mycert-7680.pem
```

As you can see, we generated digital certificates (all files starting with my-cert*).

This ends the RSA activity section. You can now start the ECC activity section.
