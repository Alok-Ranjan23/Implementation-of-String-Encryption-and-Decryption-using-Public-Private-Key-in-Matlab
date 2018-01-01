function IS006_driver
%%Enter message to encrypt
msg = input('Enter a message as a string');
%%Convert it into ASCII values
org_vector  = double(msg)
%%Call Encryption Function
[enc_vector,d,n] = IS006_encryption(org_vector);
 if(~isempty(enc_vector))
    enc_vector
    enc_message = char(enc_vector)
    %%Call Decryption Function
    dec_vector = IS006_decryption(enc_vector,d,n);
    dec_cipher = char(dec_vector)
 end
end