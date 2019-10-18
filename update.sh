#!/bin/bash

for f in $(<config_files)
do
	oldfile="$HOME/.$f"
	echo "Copying '$oldfile' to '$f'"
	cp $oldfile $f
done

