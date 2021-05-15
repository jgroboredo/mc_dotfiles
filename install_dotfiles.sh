#!/bin/bash

shopt -s dotglob

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CONFIG="${HOME}/.config"

#Installing Home dot files
for file in "$SCRIPT_DIR/Home"/*; do
  if [[ -f $file ]]
  then
	temp=$(basename "$file")
	if [[ -L "${HOME}/${temp}" ]]
	then
		echo "$file has already been symlinked"
		echo "Wish to overwrite?"
		echo -n "y(yes) / n(no): "
		read $ans
		if [[ $ans==[yY] || $ans==[yY][eE][sS] ]]
		then
			echo "Updating symbolic link"
			ln -sf "$file" "${HOME}/${temp}"
			echo ""
		else
			echo "Skipping"
			echo ""
		fi
	elif [[ -f "${HOME}/${temp}" ]]
	then
		echo "${file} already exists but it is not symlinked"
		echo "Backing up original"
		mv "${HOME}/${temp}" "${HOME}/${temp}_backup"
		echo "Installing symlink"
		ln -sf "$file" "${HOME}/${temp}"
		echo "Done"
		echo " "

	else
		echo "Installing $file"
		ln -sf "$file" "${HOME}/${temp}"
		echo "Successful"
		echo ""
        fi    
  fi
done

#Installing .config dot files
for file in "$SCRIPT_DIR/Home/.config"/*; do
  if [[ -f $file ]]
  then
	temp=$(basename "$file")
	if [[ -L "${CONFIG}/${temp}" ]]
	then
		echo "$file has already been symlinked"
		echo "Wish to overwrite?"
		echo -n "y(yes) / n(no): "
		read $ans
		if [[ $ans==[yY] || $ans==[yY][eE][sS] ]]
		then
			echo "Updating symbolic link"
		        ln -sf "$file" "${CONFIG}/${temp}"
			echo " "
		else
			echo "Skipping"
			echo " "
		fi
	elif [[ -f "${CONFIG}/${temp}" ]]
	then
		echo "${file} already exists but it is not symlinked"
		echo "Backing up original"
		mv "${CONFIG}/${temp}" "${CONFIG}/${temp}_backup"
		echo "Installing symlink"
		ln -sf "$file" "${CONFIG}/${temp}"
		echo "Done"
		echo " "
	else
		echo "Installing $file"
		ln -sf "$file" "${CONFIG}/${temp}"
		echo "Done"
	        echo " "	
        fi    
  else
	#This deals with directories
	temp=$(basename "$file")
        if [[ -L "${CONFIG}/${temp}" ]]
	then
		echo "$file has already been symlinked"
		echo "Wish to overwrite?"
		echo -n "y(yes) / n(no): "
		read $ans
		if [[ $ans==[yY] || $ans==[yY][eE][sS] ]]
		then
			echo "Updating symbolic link"
		        ln -sf "$file" "${CONFIG}/${temp}"
			echo " "
		else
			echo "Skipping"
			echo " "
		fi
	elif [[ -d "${CONFIG}/${temp}" ]]
	then
		echo "${file} already exists but it is not symlinked"
		echo "Backing up original"
		mv "${CONFIG}/${temp}" "${CONFIG}/${temp}_backup"
		echo "Installing symlink"
		ln -sf "$file" "${CONFIG}/${temp}"
		echo "Done"
		echo " "
	else
		echo "Installing $file"
		ln -sf "$file" "${CONFIG}/${temp}"
		echo "Done"
	        echo " "	
        fi    

  fi
done


#if [[ -d $i3_DIR ]]
#then
#    echo "$i3_DIR exists on your filesystem."
#else
#    echo "$i3_DIR does not exist on your filesystem."
#fi


#if [[ -L "$file" && -d "$file" ]]
#then
#    echo "$file is a symlink to a directory"
#fi

