#!/bin/bash
echo "****************** BEGIN OF ECC CERTIFICATE GENERATION  ****************************"
for cipher in secp112r1 secp112r2 secp128r1 secp128r2 secp160k1 secp160r1 secp160r2 secp192k1 secp224k1 secp224r1 secp256k1 secp384r1 secp521r1 ; do        
echo "****************** CERTIFICATE WITH $cipher  ****************************"
        echo "ECC CERTIFICATE  with $cipher"
	openssl ecparam -name $cipher -genkey -param_enc explicit -out private-$cipher.pem
	openssl req -new -x509 -key private-$cipher.pem -out server-$cipher.pem -days 365 -sha256 -subj /C=FR/ST=France/L=Montpellier/CN=PSSC -engine ibmca 2>/dev/null
	cat private-$cipher.pem server-$cipher.pem > mycert-$cipher.pem 
	echo "End of Test for $cipher"
        echo ""
done;
echo "******************END OF TEST ECC CERTIFICATE GENERATION  ****************************"
