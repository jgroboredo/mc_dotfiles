########################################### Aliases ###################################################



alias ls="ls -hF --color=auto"
alias ll="ls -lahF --color=auto"
alias pacman="sudo pacman"
alias goncalosshm="sshfs goncalo@192.168.1.64:/home/goncalo/HDD/Downloads/ /home/alexandra/Desktop/goncalo"
alias goncalosshum="fusermount -u /home/alexandra/Desktop/goncalo/"
alias backup="rsync -avhe ssh --progress /home/alexandra/Documents/Xa/ goncalo@192.168.1.64:/home/goncalo/HDD/Documentos/XaBackup/"


#Nota: para fazer tar faço tardir ficheiro.tar.gz -C diretorioacomprimir .

######################################################################################################






############################################# Funtions ################################################

#note that $(something) runs the command "something" and captures output


function checkham {
        tmpfile=$(mktemp)
	pgrep hamsket  &> "$tmpfile"
	if [[ $? != 0 ]]; then
	  rm -f "$tmpfile"	
          echo "Command failed"
	elif [[ -s "$tmpfile" ]]; then
	  rm -f "$tmpfile"
          echo "Command generated output"
	else
	  rm -f "$tmpfile"
          echo "Command has no output"
	fi
}

function restartham {
	checkham | grep 'Command generated output' &> /dev/null
	if [[ $?  == 1 ]]; then
		echo "Hamsket não está a correr"
		sleep 2
		nohup hamsket &>/dev/null &;
		disown;
		exit;
	else
		echo "Hamsket está a correr"
		sleep 2
		pkill hamsket;
		nohup hamsket &>/dev/null &;
		disown;
		exit;
	fi
}

function rvi {
 pkill volumeicon
 nohup volumeicon &>/dev/null &;
 disown;
 exit;
}



