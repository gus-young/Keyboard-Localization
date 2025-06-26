#!/bin/bash

# Define the options for the dropdown menu
declare -a options
options=(
  "USA,us" 
  "Andorra,ad"
  "Afghanistan,ah" 
  "Arabic,ara"     
  "Albania,al" 
  "Armenia,am" 
  "Azerbaijan,az" 
  "Belarus,by" 
  "Belgium,be" 
  "Bangladesh,bd" 
  "India,in"
  "Bosnia and Herzegovina,ba" 
  "Brazil,br" 
  "Bulgaria,bg"
  "Morocco,ma"
  "Myanmar,mm"
  "Canada,ca"
  "DR Congo,cd"
  "China,cn"
  "Croatia,hr"
  "Czechia,cz"
  "Denmark,dk"
  "Netherlands,nl"
  "Bhutan,bt"
  "Estonia,ee"
  "Iran,ir"
  "Iraq,iq"
  "Finland,fi"
  "France,fr"
  "Ghana,gh"
  "Guinea,gn"
  "Georgia,ge"
  "Germany,de"
  "Greece,gr"
  "Hungary,hu"
  "Iceland,is"
  "Israel,il"
  "Italy,it"
  "Japan,jp"
  "Kyrgyzstan,kg"
  "Cambodia,kh"
  "Kazakhstan,kz"
  "Laos,la"
  "Latin America,latam"
  "Lithuania,lt"
  "Latvia,lv"
  "Maori,mao"
  "Montenegro,me"
  "Macedonia,mk"
  "Malta,mt"
  "Mongolia,mn"
  "Norway,no"
  "Poland,pl"
  "Portugal,pt"
  "Romania,ro"
  "Russia,ru"
  "Serbia,rs"
  "Slovenia,si"
  "Slovakia,sk"
  "Spain,es"
  "Sweden,se"
  "Switzerland,ch"
  "Syria,sy"
  "Tajikistan,tj"
  "Sri Lanka,lk"
  "Thailand,th"
  "Turkey,tr"
  "Taiwan,tw"
  "Ukraine,ua"
  "United Kingdom,gb"
  "Uzbekistan,uz"
  "Vietnam,vn"
  "Korea,kr"
  "Ireland,ie"
  "Pakistan,pk"
  "Maldives,mv"
  "South Africa,za"
  "Esperanto,epo"
  "Nepal,np"
  "Nigeria,ng"
  "Ethiopia,et"
  "Senegal,sn"
  "Turkmenistan,tm"
  "Mali,ml"
  "Tanzania,tz"
)
country_list=()
code_list=()

for item in "${options[@]}"; do
    IFS=, read country code <<<"$item"
    country_list+=("$country")
    code_list+=("$code")
done

# Use zenity to create the dropdown menu
selected_option=$(zenity --list --title="Choose a New Keyboard Layout" --column="Options" "${country_list[@]}")

index_of() {
  local search_element="$1"
  local i=0
  while [ "$i" -lt "${#country_list[@]}" ]; do
    if [ "${country_list[$i]}" == "$search_element" ]; then
      echo "$i"
      return 0 # Element found, exit function
    fi
    ((i++))
  done
  echo "-1" # Element not found, return -1
  return 1
}

index=$(index_of $selected_option)
keyboard_code=${code_list[$index]}

setxkbmap $keyboard_code