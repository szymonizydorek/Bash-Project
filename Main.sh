#!/bin/bash

source Helper_functions.sh 
function witaj {
    echo -e "*this is done by function witaj* \n Selected option Menu is: $Choice_1 \n" 
}

while_loop_choice=""

while [[ $while_loop_choice != "y" ]]; do
    echo "Welcome to 'Great Script Aggregator' "
    sleep 0.5 
    echo -e "Options:\n 1. Say Hello \n 2. Printing X Numbers \n 3. Marks Validator \n 4. Calculator \n 5. See todays date
 6. While and numbers from file \n 7. Echo Calendar \n 8. Show IP Address \n 9. Random fact \n 10. Card Games \n 11. Cards
 12. Print Working Directory \n 13. Ping your website  \n 14. Speedtest info \n 15. Docker Baby \n 16. System Monitor
 17. Passowrd Generator \n 18. Gender Recognizion \n 19. Concatenation \n 20. JSON operationss
 Provide your choice: "
    read  -p  "Provide your choice: " Choice_1

    wynik=$(witaj "Choice_1")
    echo $wynik
    

    if [ "$Choice_1" = 1 ]
    then
        1_hello

    elif [[ $"$Choice_1" = 2 ]]
    then
        2_Numbers

    elif [[ $"$Choice_1" = 3 ]]
    then
        3_Math

    elif [[ $"$Choice_1" = 4 ]]
    then
        4_Calculator

    elif [[ $"$Choice_1" = 5 ]]
    then
        5_Date

    elif [[ $"$Choice_1" = 6 ]]
    then 
        6_While

    elif [[ $"$Choice_1" = 7 ]]
    then
        7_Cal

    elif [[ $"$Choice_1" = 8 ]]
    then
        8_IP
   
    elif [[ $"$Choice_1" = 9 ]]
    then
        9_Random

    elif [[ $"$Choice_1" = 10 ]]
    then
        10_Cards

    elif [[ $"$Choice_1" = 11 ]]
    then
        11_Cards

    elif [[ $"$Choice_1" = 12 ]]
    then
        12_pwd

    elif [ "$Choice_1" = 13 ]
    then
        13_ping

    elif [ "$Choice_1" = 14 ]
    then
        14_Speed

    elif [ "$Choice_1" = 15 ]
    then
        15_Docker

    elif [ "$Choice_1" = 16 ]
    then
        16_System_Monitor
    
    elif [ "$Choice_1" = 17 ]
    then
        17_Password_Generator

    elif [ "$Choice_1" = 18 ]
    then
        18_Gender_Recognizion

    elif [ "$Choice_1" = 19 ]
    then
        19_Concatenation
    
    elif [ "$Choice_1" = 20 ]
    then
        20_JSON_Operation

    else
        echo "This option is not possible. Select other number."
    fi
  
    echo "Do you want to leave GSA? (type 'y' to quit):"
    read while_loop_choice
    
    # Check if the user wants to exit
    if [[ $while_loop_choice == "y" ]]; then
        echo "Exiting GSA... Bye!"
    else
        echo "You entered: $choice"
    fi
done
