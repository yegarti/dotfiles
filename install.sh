#!/bin/bash

for f in $(<config_files)
do
	oldfile="$HOME/.$f"
	fdiff=$(diff -u $oldfile $f)
	if [[ $fdiff ]]
	then
		echo "New file '$f' is different from '$oldfile'"
		echo "$fdiff"
		echo -n "Do you wish to overwrite '$oldfile' [y\\N]? "
		read -n 1 ans
		echo
		if [[ $ans != "y" ]];
		then
			echo "Skipping '$f'"
			continue
		fi
	fi
	echo "Copying '$f' to '$oldfile'"
	cp $f $oldfile
done

