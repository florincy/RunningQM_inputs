#!/bin/bash
echo "Lets start some calculations?"
directory=$(zenity --title="Select the directory" --file-selection --directory)
file_list=()
while IFS= read -d $'\0' -r file; do
  file_list=("${file_list[@]}" "$file")
done < <(find $directory -type f -name '*.com' -print0)
for i in ${!file_list[@]}; do
  cd ${directory}
  input=${file_list[$i]}
  inputNWCHEM=$(basename -- $input)
<<<<<<< HEAD
  g16 ${inputNWCHEM} &
  wait
=======
  echo "$inputNWCHEM"
  g16 ${input} 
  echo "We did it"
>>>>>>> 8e1abf51edcd42bb5e1490931b7e7849905e80d2
done
