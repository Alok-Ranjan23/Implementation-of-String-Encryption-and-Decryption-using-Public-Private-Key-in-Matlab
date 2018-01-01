function [data,d,n] =  IS006_encryption(org_data)
        %%Empty vector to store encrypted data
        data = [];
        %%key generation using RSA
        [e,d,n] = IS006_RSA();
        if(e == 0)
            fprintf('Please Enter a large prime number Next time\n');
        else
            %%Encryption
            for i = 1:length(org_data)
                %x = mod(power(org_data(i),e),n);
                x = find_res(org_data(i),e,n);
                data = [data,x];
            end        
        end
        
    %%Modular Exponentiation    
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