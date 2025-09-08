#!/bin/bash 

num1=$1
num2=$2

common_divisor() {
    x=$i

    if [ $(( $num1%$x )) -eq 0 ] && [ $(( $num2%$x )) -eq 0 ];then
        return 1;
    else
        reture 0;
    fi
}

for (( i=1; i<=$num1 && i<=$num2; i++));
then
    common_divisor $1
    if [ $? -nq 1 ];
    then   
        gcd=$i
    fi
done

echo "The gcd of $num1 and $num2"
------------------------------------

for(( i=0;i<256;i++));then
    ping -c1 23.227.36.$i >> /dev/null 2>&1
    if [ $? -eq 0 ];
    then   
        echo "server 23.227.36.$i is up and running fine"
    else 
        echo "server 23.227.36.$i is not up and running"
    fi
done


