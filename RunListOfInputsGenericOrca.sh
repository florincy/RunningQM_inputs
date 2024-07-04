#!/bin/bash
echo "Lets run some inputs?"
directory=$(zenity --title="Select the directory" --file-selection --directory)
file_list=()
while IFS= read -d $'\0' -r file; do
  file_list=("${file_list[@]}" "$file")
done < <(find $directory -type f -name '*.inp' -print0)
for i in ${!file_list[@]}; do
  input=${file_list[$i]}
  DirInput="$(dirname "${input}")"
  cd ${DirInput}
  ls
  inputNWCHEM=$(basename -- $input)
  outputNWCHEM=$(basename -s .inp $input)".out"
  orca ${inputNWCHEM} >${outputNWCHEM} &
  wait
  echo "Input running ended!"
done
