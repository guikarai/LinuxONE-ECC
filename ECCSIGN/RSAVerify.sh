#!/bin/bash
echo "****************** SIGNATURE VERIFICATION RSA Ciphers ****************************"
for cipher in 1024 2048 3072 4096 7680 15360 ; do
        echo "1K RSA Signature VERIFICATION with $cipher"
	openssl genrsa -out private-$cipher.pem $cipher
	openssl rsa -in private-$cipher.pem -pubout -out public-$cipher.pem
	openssl dgst -sha256 -sign private-$cipher.pem test.pdf > signature-$cipher.bin
	time bash -c "for i in {1..1000}; do openssl dgst -sha256 -verify public-$cipher.pem -signature signature-$cipher.bin test.pdf &>/dev/null;  done;"
        echo "End of Test for $cipher"
        echo ""
done
