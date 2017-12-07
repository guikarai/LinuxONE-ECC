#!/bin/bash

echo "****************** BEGIN OF TEST SIGNATURE ECC Ciphers ****************************"
for cipher in secp112r1 secp112r2 secp128r1 secp128r2 secp160k1 secp160r1 secp160r2 secp192k1 secp224k1 secp224r1 secp256k1 secp384r1 secp521r1 ; do
	echo "****************** SIGNATURE $cipher  ****************************"
	echo "1K ECC Signature with $cipher"
	#Create private key:
	openssl ecparam -genkey -name $cipher -noout -out private-$cipher.pem
	#Create public key:
	openssl ec -in private-$cipher.pem -pubout -out public-$cipher.pem
	time bash -c "for i in {1..1000}; do openssl dgst -sha256 -sign private-$cipher.pem test.pdf > signature-$cipher.bin; done;"
	echo "End of Test for $cipher"
	echo ""
done;
echo "******************END OF TEST SIGNATURE ECC Ciphers ****************************"
