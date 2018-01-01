%%RSA Key Generation
function [e,d,n] =  IS006_RSA()
    %% Take Two large prime number as input
    p = input('Enter a large prime number');
    q = input('Enter another large prime number');
    % Check whether input p and q is prime or not
    if(and(isprime(p),isprime(q)))
        if(p*q>122)
        %calculate n
        n = p*q;
        %claculate euler's totient function
        eu = (p-1)*(q-1);
        %claculate public key 
        for i = 2:(eu-1)
            if(hcf(eu,i)==1)
                e = i;
                break;
            end
        end
        %caluclate private key using extended euclid method
        d = private_key(eu,e);      
        fprintf('Public key = [%d,%d] and Private Key = [%d,%d]\n',e,n,d,n);
        else
            e = 0;
            d = 0;
            n = 0;
        end
    else
        fprintf('Enter prime number next time\n');
    end
    
    %%HCF of two numbers
    function res = hcf(num_1,num_2)
        if(~(mod(num_1,num_2)))
            res = num_2;
        else
            res = hcf(num_2,mod(num_1,num_2));
        end
    end

    %Private Key calculation: Brute-force approach
    function d = private_key(a,b)
      d=2;  
      while(1)
          if(mod(b*d,a) == 1)
              break;
          end
          d=d+1;
      end
    end
end
    