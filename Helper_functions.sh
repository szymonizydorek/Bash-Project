#!/bin/bash
function 1_hello {
   echo -e "You selected 'Say Hello \n Provide your name: "
   read Name
   echo "Hello $Name"
}

function 2_Numbers {
    
    echo "Provide starting number (including): "
    read start;

    echo "Provide ending number (excluding):  "
    read stop

    for ((i=$start; i <= $stop; i=$i+1))
    do 
    echo "Liczba: $i"
    echo "Liczba: $i" >> liczby.txt

#ten kod bedzie potwarzany
done
}

function 3_Math {
    echo "Podaj ocene z matematyki: "
    read matematyka;

    echo "Podaj ocene z informatyki: "
    read informatyka;

    echo "Podaj ocene z historia: "
    read historia;

    echo "Podaj ocene z polskiego: "
    read polski;

   if [[ ("$matematka" -ge 5 || "$informatyka" -ge 5) && ("$historia" -ge 5 || "$polski" -ge 5) ]]
then
    echo "Moze zagrac na PC!" 
    exit 0;
else 
    echo "Nie mozesz grac"
    exit 1;
fi
}

function 4_Calculator {
     echo "You selected Calculator"

   echo "Provide number 1: "
   read VAR1
   echo -n "Provide number 2: "
   read VAR2

   echo -e "Options:\n 1.Adding\n 2.Subtraction\n 3.Multiplication\n 4.Division "
   read VAR3_Select

   if [[ $VAR3_Select = 1 ]]
   then
    echo "Addition of $VAR1 and $VAR2 is:"
   echo $VAR1+$VAR2|bc
   
  # echo "Addition of $VAR1 and $VAR2 is $((VAR1+VAR2))"

   elif [[ $VAR3_Select = 2 ]]
   then
   echo "Subtraction of $VAR1 and $VAR2 is:" 
   echo  $VAR1-$VAR2|bc

   elif [[ $VAR3_Select = 3 ]]
   then
   echo "Multipliacation of $VAR1 and $VAR2 is:"
   echo $VAR1+$VAR2|bc
   
   elif [[ $VAR3_Select = 4 ]]
   then
  echo "Division of $VAR1 and $VAR2 is $((VAR1/VAR2))"
  echo $VAR1/$VAR2|bc
   fi
}

function 5_Date {
    now=$(date)
    echo "$now"
}

function 6_While {
    while read line
do
    echo "-----------"
    echo $i:: $line 
    i=$((i + 1))
done < prawidlowe.txt
}

function 7_Cal {
     cal=$(cal)
    echo "$cal"
}

function 8_IP {
    echo 'Your IP Address is:' $(ifconfig | grep broadcast | awk '{print $2}')
    echo 'Your netmask Address is:' $(ifconfig | grep broadcast | awk '{print $4}')
}

function 9_Random {
    echo "Interesting fact is: " $(curl https://uselessfacts.jsph.pl/random.json | python -m json.tool | grep text )
    echo "-------------------"
    echo "The Response Code was:" $(curl --include https://uselessfacts.jsph.pl/random.json | grep HTTP)
}
 
function 10_Cards {
  echo $(curl https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1 | python -m json.tool | grep remaining )
  cal2=$( echo $(curl https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1 | python -m json.tool | grep deck_id ))
  echo "The cards we have are: $cal2"
  echo  $(curl https://deckofcardsapi.com/api/deck/$cal2/draw/?count=3 | python -m json.tool |grep suit)
}

function 11_Cards {
    echo "How many cards you want to take: "
    read cards
    echo "Your three cards: " $(curl  https://deckofcardsapi.com/api/deck/d00xb3ilqn3n/draw/?count=$cards | python -m json.tool  | grep suit )
}

function 12_pwd {
     pwd=$(pwd)
    echo $pwd
}

function 13_ping {
    echo -e "You selected 'Say Hello \n Provide website address: "
    read website
    ping -c 1 $website | grep loss
}

function 14_Speed {
    Host=$(speedtest-cli | grep "Testing from" | cut -d " " -f 3,4)
    Download=$(speedtest-cli | grep Download  | cut -d " " -f 2,3 )
    Upload=$(speedtest-cli | grep Upload  | cut -d " " -f 2,3 )
   # echo "Hosting provider: " $(speedtest-cli | grep "Testing from" | cut -d " " -f 3,4  )
    echo -e " Hosting Provider: $Host \n Download speed: $Download \n Upload speed: $Upload"
}

function 15_Docker {
    echo -e "Welcome to Docker. \n 1. See Docker Version\n 2. Build Ubuntu \n 3. Image Version \n 4. Removing Images \n 5. See all containers \n 6. Build Flask App on Docker \n Please select: "
    read choice_15
    if [ "$choice_15" = 1 ]
    then
        docker1_version=$(Docker version | grep "Version")
        echo -e " \n $ $docker1_version \n" 

    elif [ "$choice_15" = 2 ]
    then
        docker2_building_ubuntu=$(docker run ubuntu bash)
        echo $docker2_building_ubuntu
        id=$(docker container ls -a | grep "Less than" | cut -d " " -f 1,2,3)
        echo -e "New ubuntu id is: $id\nYou want to start your $id container? y/n "
        read container_choice
        if [ "$container_choice" = 'y' ]
        then
            docker start $id
            docker exec $id bash
            docker ps
        fi
    
    elif [ "$choice_15" = 3 ]
    then
        docker3=$(Docker image ls)
        echo -e $docker3

    elif [ "$choice_15" = 4 ]
    then
        docker4_remove=$(Docker image ls)
        echo -e $docker4_remove
    
    elif [ "$choice_15" = 5 ]
    then
        docker5_containers=$(Docker container ls -a)
        echo -e $docker5_containers

    elif [ "$choice_15" = 6 ]
    then
        
        mkdir dockerdir
        mkdir dockerdir/templates

        cp sample_app.py dockerdir/.
        cp -r templates/* dockerdir/templates/.

        echo "FROM python" >> dockerdir/Dockerfile
        echo "Run pip install flask" >> dockerdir/Dockerfile

        echo "COPY ./templates /home/myapp/templates/" >>dockerdir/Dockerfile
        echo "COPY sample_app.py /home/myapp/" >>dockerdir/Dockerfile

        echo "EXPOSE 8080" >> dockerdir/Dockerfile

        echo "CMD python3 /home/myapp/sample_app.py" >>dockerdir/Dockerfile
        cd dockerdir

        docker build -t image_name .

        docker run -t -d -p 8080:8080 --name my-flask-app-name2 image_name
        docker ps -a

    else
        echo "0"
    fi
}

function 16_System_Monitor {
    #Get the current network usage in kbbytes per second for the en0 interface. We search in the tail of the file and print 1st and 2nd value 
    network_usage_downlink=$(ifstat -q -i en0 1 1 | tail -n 1 | awk '{print $1}')
    network_usage_uplink=$(ifstat -q -i en0 1 1 | tail -n 1 | awk '{print $2}')
    disk_usage=$(df | awk 'NR==2 {print $5}' | tr -d '%')

    echo -e "Network Downlink: $network_usage_downlink Kbps \nNetwork Uplink: $network_usage_uplink Kbps"
    echo "Disk Usage: $disk_usage%"
    
}

function 17_Password_Generator {
    length=12

    # Get the password length from the user
    echo "Enter password length (default is $length):"
    read input_length

    # If the user entered a valid password length, update the length variable
    if [[ $input_length =~ ^[0-9]+$ ]]; then
    length=$input_length    
    fi

    # Generate a random password
    password=$(openssl rand -base64 48 | tr -dc 'a-zA-Z0-9' | head -c $length)

    # Display the generated password
    echo "Your password is: $password"
}

function 18_Gender_Recognizion {
    echo -e "Provide your name: "
    read name
    name_lenght=${#name}
    last_letter=${name:$name_lenght-1} 
    echo "Your name has $name_lenght chatacrers. The last letter is ""$last_letter"""
    if [[ last_letter == "a" ]]
    then
        echo "It was female name"
    else
        echo "It was male name"
    fi
}

function 19_Concatenation {
  #  echo "Provide the writing: "
    napis="sentence_19"
    echo "Lenght (using {#napis}): "${#napis}
    echo "String 0:7 (using {#napis 0:7}): " ${napis:0:7}
    echo "String 0:7 (using {#napis 0:7}): " ${napis::7}
  #  echo "String -8:8 (using {#napis -8:8}): " ${napis:8:-8}
 #  echo "String ,, (using {#napis ,:,}): " ${napis,,}
 #   echo "String ^^ (using {#napis ^^}): " ${napis^^}
}
function 20_Curl {
    echo -e "What do you want to do? 
    \n 11"

}

function 20_JSON_Operation {
    echo -e "This is JSON Lab. First we will download JSON
    \n 1. GET the JSON 
    \n 2. GET the products titles from JSON
    \n 3. GET the id list JSON
    \n 4. GET the lenght of JSON
    \n 5. GET the sort based on e.g. price
    \n 6. GET the specific IDs
    \n 7. POST the product" 

    read choice_20
    if [ $choice_20 = 1 ]
    then
    echo -e "\n ================="
    echo "GET call successful"
    curl -s -k -X GET https://dummyjson.com/products | jq '.products[]'

    elif [ $choice_20 = 2 ]
    then
    echo -e "\n ================="
    echo "GET call successful"
    curl -s -k -X GET https://dummyjson.com/products | jq '.products[].title'

    elif [ $choice_20 = 3 ]
    then
    echo -e "\n ================="
    echo "GET call successful"
    curl -s -k -X GET https://dummyjson.com/products | jq '.products[].id'

    elif [ $choice_20 = 4 ]
    then
    lenghgt=$(curl -s -k -X GET https://dummyjson.com/products | jq '.products | length')
    echo "JSON lenght is: $lenghgt"

    elif [ $choice_20 = 5 ]
    then
    echo "What parameter you want to use for sorting?"
    read $parameter
    curl -s -k -X GET https://dummyjson.com/products | jq '.products | sort_by(.parameter)'

    elif [ $choice_20 = 6 ]
    then
    curl -s -k -X GET https://dummyjson.com/products | jq '.products[1:2]'

    elif [ $choice_20 = 7 ]
    then
    # prompt the user to enter product details
    echo "Enter product name:"
    read name

    echo "Enter product price:"
    read price

    echo "Enter product description:"
    read description

    # create a JSON payload with the new product details
    json_payload="{\"name\":\"$name\",\"price\":\"$price\",\"description\":\"$description\"}"

    # send a POST request to add the new product to the list
    curl -s -X POST -d "$json_payload" https://dummyjson.com/products/add | jq .

    # print a message to confirm that the product was added
    echo "New product added: $name"

    # Send a POST request to add the new product to the list
    curl -s -X POST -d "$json_payload" https://dummyjson.com/products/add | jq .

    # Verify that the product was added to the list
    curl -s https://dummyjson.com/products | jq ".[] | select(.name == \"$name\")"

    # Print a message to confirm that the product was added
    echo "New product added: $name"

    fi
}