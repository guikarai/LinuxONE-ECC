# Welcome in Step 2 about monitoring RSA public key acticity performance.

## Agenda of this Step 2 is the following:
1. Overview of the lab content
2. RSA performance table
3. Generating public keys with RSA
4. Signing a pdf file with RSA
5. Verifying digital signature of a pdf file with RSA
6. Generating x509 digital certificates with RSA

## Overview of the lab content

In this section, let's test performance of RSA in very different conditions. We will used openssl under the cover, in order to perform all the cryptographic activities. That is good, because in previous section, we optimized opensssl in order to speed-up the hardware way cryptographic operations.

Please now move in the RSA directory thanks to the follwing command:
```
cd RSA/
```

List the content of the directory with the following command:
```
ls -l

  total 60
  -rwxr-xr-x 1 root root   684 Aug 14 14:04 generateRSAcertificates.sh
  -rwxr-xr-x 1 root root   400 Aug 14 13:31 generateRSAkeys.sh
  -rwxr-xr-x 1 root root   371 Aug 14 12:00 signPDFwithRSA.sh
  -rw-r--r-- 1 root root 41044 Aug 14 11:58 test.pdf
  -rwxr-xr-x 1 root root   500 Aug 14 12:07 verifyPDFwithRSA.sh
```

As you can see, there are a set of script designed to test RSA cryptographic activities. During this section, we we will generate key pairs using RSA with different size of RSA key. 

Key sizes are: 1024, 2048, 3072, 4096, 7680 and 15360.

Then we will use generated RSA keys to sign a pdf file, and to verify the digital signature of this pdf file. To conclude we will generate according RSA keys RSA digital certificate complying with x509. 

Let's make all these script executeable thanks to the following command:
```
chmod +x *.sh
```

## RSA performance table

The following performance table need to be completed by you during this lab part. This is important to provide at the end a summary of the perforance degradation of RSA cryptographic operation according key size.

RSA Key size in bits | Key generation in seconds |  Digital signature in seconds  | Signature verification in seconds  | Certificate generation in seconds | TLS Handshakes
------------ | ------------------ | ----------------------- | --------------------------- | -------------------------- | ----------
RSA 1024     | | | | |
RSA 2048     | | | | |
RSA 3072     | | | | |
RSA 4096     | | | | |
RSA 7680     | | | | |
RSA 15360    | | | | |

## Generating public keys with RSA

Let's put first thing first and let generate one RSA key pair according key size. Issue the following command. Note that this script may need up to 240 seconds to generate RSA 15360 keys !!!! So, be patient.
```
./generateRSAkeys.sh

  ****************** KEY GENERATION RSA  ****************************
  RSA key generation with 1024
  Generating RSA private key, 1024 bit long modulus
  ........++++++
  .................++++++
  e is 65537 (0x10001)

  real	0m0.017s
  user	0m0.014s
  sys	0m0.001s
  engine "ibmca" set.
  writing RSA key

  real	0m0.007s
  user	0m0.005s
  sys	0m0.001s
  End of Test for 1024
  [**** truncated ***]
```

Please, report to the performance table, the sum of **real+user+sys** time according key size for the column "**Key generation in seconds**". At this step, you already realize how long it is to generate key pairs bigger than 4096!

![alt-text](https://github.com/guikarai/LinuxONE-ECC/blob/master/images/keygen-RSA.png)

Let's see together what has been generated. Please issue the following command:
```
ls -l p*

  -rw-r--r-- 1 root root   891 Aug 14 14:46 private-1024.pem
  -rw-r--r-- 1 root root 11823 Aug 14 14:51 private-15360.pem
  -rw-r--r-- 1 root root  1675 Aug 14 14:46 private-2048.pem
  -rw-r--r-- 1 root root  2455 Aug 14 14:46 private-3072.pem
  -rw-r--r-- 1 root root  3243 Aug 14 14:46 private-4096.pem
  -rw-r--r-- 1 root root  5973 Aug 14 14:47 private-7680.pem
  -rw-r--r-- 1 root root   272 Aug 14 14:46 public-1024.pem
  -rw-r--r-- 1 root root  2705 Aug 14 14:51 public-15360.pem
  -rw-r--r-- 1 root root   451 Aug 14 14:46 public-2048.pem
  -rw-r--r-- 1 root root   625 Aug 14 14:46 public-3072.pem
  -rw-r--r-- 1 root root   800 Aug 14 14:46 public-4096.pem
  -rw-r--r-- 1 root root  1405 Aug 14 14:47 public-7680.pem
```

As you can see, we generated for each RSA key size, two keys (one public, and one private).

## Signing a pdf file with RSA

Now, we have enough crypto materials. Let's reuse generated private keys to test how long it takes to **perform 100x digital signatures** of a 3MB pdf file with various RSA key size. Please, issue the following command:
```
./signPDFwithRSA.sh

  ****************** SIGNATURE RSA Ciphers ****************************
  100 RSA Signature with 1024

  real	0m0.491s
  user	0m0.285s
  sys	0m0.099s
  End of Test for 1024

  100 RSA Signature with 2048

  real	0m0.677s
  user	0m0.525s
  sys	0m0.096s
  End of Test for 2048

  100 RSA Signature with 3072

  real	0m1.246s
  user	0m1.038s
  sys	0m0.092s
  End of Test for 3072

  100 RSA Signature with 4096

  real	0m2.218s
  user	0m1.941s
  sys	0m0.101s
  End of Test for 4096

  100 RSA Signature with 7680

  real	0m11.152s
  user	0m10.233s
  sys	0m0.148s
  End of Test for 7680

  100 RSA Signature with 15360

  real	1m16.204s
  user	1m10.840s
  sys	0m0.221s
  End of Test for 15360
```

Please, report to the performance table, the sum of **real+user+sys** time according key size for the column "**Digital signature in seconds**". Don't you see how explonential is the time required for such RSA crypto workload?

Let's see together what has been generated. Please issue the following command:
```
ls -l *.bin

  -rw-r--r-- 1 root root  128 Aug 14 15:03 signature-1024.bin
  -rw-r--r-- 1 root root 1920 Aug 14 15:04 signature-15360.bin
  -rw-r--r-- 1 root root  256 Aug 14 15:03 signature-2048.bin
  -rw-r--r-- 1 root root  384 Aug 14 15:03 signature-3072.bin
  -rw-r--r-- 1 root root  512 Aug 14 15:03 signature-4096.bin
  -rw-r--r-- 1 root root  960 Aug 14 15:04 signature-7680.bin
```

As you can see, we generated in a separated file (all files with .bin extension) the digital signature of the 3MB pdf file and according each key size. Very interresting for digital signature verification.

## Verifying digital signature of a pdf file with RSA

We have enough crypto materials. We have a detached digital signature file. Let's reuse generated public keys to test how long it takes to **verify 100x digital signatures** of a 3MB pdf file with various RSA key size. Please, issue the following command:

```
./verifyPDFwithRSA.sh

****************** SIGNATURE VERIFICATION RSA Ciphers ****************************
100 RSA Signature VERIFICATION with 1024

real	0m0.311s
user	0m0.205s
sys	0m0.087s
End of Test for 1024

100 RSA Signature VERIFICATION with 2048

real	0m0.332s
user	0m0.218s
sys	0m0.088s
End of Test for 2048

100 RSA Signature VERIFICATION with 3072

real	0m0.316s
user	0m0.218s
sys	0m0.081s
End of Test for 3072

100 RSA Signature VERIFICATION with 4096

real	0m0.351s
user	0m0.234s
sys	0m0.090s
End of Test for 4096

100 RSA Signature VERIFICATION with 7680

real	0m0.397s
user	0m0.283s
sys	0m0.088s
End of Test for 7680

100 RSA Signature VERIFICATION with 15360

real	0m0.645s
user	0m0.502s
sys	0m0.089s
End of Test for 15360
```

Please, report to the performance table, the sum of **real+user+sys** time according key size for the column "**Signature verification in seconds**". Don't you see how verifying a digital signature is faster than performing a digital signature with RSA?

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
-rw-r--r-- 1 root root 9132 Aug 14 15:11 mycert-15360.pem
-rw-r--r-- 1 root root 2924 Aug 14 15:07 mycert-2048.pem
-rw-r--r-- 1 root root 4058 Aug 14 15:08 mycert-3072.pem
-rw-r--r-- 1 root root 5187 Aug 14 15:11 mycert-4096.pem
-rw-r--r-- 1 root root 9132 Aug 14 15:11 mycert-7680.pem
```

As you can see, we generated digital certificates (all files starting with my-cert*).

Let's browse together one of these generated self-signed digital certificate, please issue the following command:
```
openssl x509 -in mycert-4096 -text
  
  
```


This ends the RSA activity section. You can now start the ECC activity section [Step 3](https://github.com/guikarai/LinuxONE-ECC/blob/master/ecc-lab.md).
