%%We are providing private key so that decryption can be done.
function dec_data =  IS006_decryption(enc_data,d,n)
        %%Empty vector to store decrypted data
        dec_data = [];
        %%Decryption
        for i = 1:length(enc_data)
            x = find_res(enc_data(i),d,n);
            dec_data = [dec_data,x];
        end        
        
    function dec =  find_res(x,y,p)
        res = 1;
        x=mod(x,p);
        if(y == 0) dec = 1;
        else
            if(mod(y,2)==0)
                dec = mod(find_res(x*x,y/2,p),p);
            else
                dec = mod(x*find_res(x*x,(y-1)/2,p),p);
            end
        end
    end
end
