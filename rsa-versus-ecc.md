# RSA versus ECC performance

In previous section, you tested the RSA and the ECC performance. You probably understood already how fast ECC is.

Let's conclude together about your findings. Please reports your test measured performance in the two following tables:

RSA Key size in bits | Key generation in seconds |  Digital signature in seconds  | Signature verification in seconds  | Certificate generation in seconds | TLS Handshakes
------------ | ------------------ | ----------------------- | --------------------------- | -------------------------- | ----------
RSA 1024     | | | | |
RSA 2048     | | | | |
RSA 3072     | | | | |
RSA 4096     | | | | |
RSA 7680     | | | | |
RSA 15360    | | | | |


ECC Key size in bits | Key generation in seconds |  Digital signature in seconds  | Signature verification in seconds  | Certificate generation in seconds | TLS Handshakes
------------ | ------------------ | ----------------------- | --------------------------- | -------------------------- | ----------
prime256v1    | | | | |
secp384r1     | | | | |
secp521r1     | | | | |

Let's simplified thise tables with the following table:

RSA Key size in bits | ECC Key size in bits |  Key size factor  | Key generation factor | Signature verification factor  | Certificate generation factor
------------ | ------------------ | ----------------------- | --------------------------- | -------------------------- | ----------
RSA 3072 | prime256v1    | | | |
RSA 4096 | secp384r1     | | | |
RSA 7680 | secp521r1     | | | |
