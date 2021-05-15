while true; do
    nc -z -w 2 192.168.1.64 22
    if [ "$?" -ne 0 ]
    then
        sleep 20m
    else
        echo "Last backup done: $(date)" > /home/alexandra/Documents/Xa/Fisica/Mestrado/test.txt 
        rsync -avhe ssh /home/alexandra/Documents/Xa/Fisica/Mestrado/ goncalo@192.168.1.64:/home/goncalo/HDD/Documentos/XaBackup/Fisica/Mestrado
        sleep 20m
    fi
done
