cid=ocid1.compartment.oc1..aaaaaaaanvjh7lpjvwqsf5trnnkkmgmeku7dwlvhbctofzekfc25pzgifnha
vid=ocid1.vault.oc1.eu-frankfurt-1.bfpjktp6aafak.abtheljrfa52uirkfzttlsugkcwhhdhz4jzn4do5lhps5l2dp2odjhxfwpfa
kid=ocid1.key.oc1.eu-frankfurt-1.bfpjktp6aafak.abtheljtol3jvcr6bx3fzk4scjwjgwjgtutminy3q6cxrpozb4jn4qhiythq
for f in wallet/*
do
   echo $f
   oci vault secret create-base64 \
        --compartment-id $cid \
        --vault-id $vid \
        --key-id $kid \
        --secret-name `echo -n $f|cut -f2 -d/` \
        --secret-content-content `base64 < $f|tr -d "\n"`
done