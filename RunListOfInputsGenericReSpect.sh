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
  inputDIRAC=$(basename -- "$input")
  inputDIRACFileName=${inputDIRAC%.*} 
  
  echo "$inputDIRACFileName"
  echo "$input"
  PathToScratch="/home/nqtcm/Documentos/respect/scratch"
  /scr/programas/ReSpect-5.1.0/respect --nt=14 --scf --inp=${inputDIRACFileName} --scratch=${PathToScratch}
  wait
  /scr/programas/ReSpect-5.1.0/respect --nt=14 --cs --inp=${inputDIRACFileName} --scratch=${PathToScratch}
  wait
done
