clear
echo "welcome to extension installer for phoenix. "
# For now this scripts uses, hard coded folder locations please change them as needed.

read -p "please enter the extension name " ext
rm -R temp
mkdir temp
cp brackets.extensions/brackets.extensions/downloads/$ext* temp/temp.zip
cd temp
mkdir $ext
cp temp.zip $ext/temp.zip
rm temp.zip
cd $ext
unzip temp.zip

if [ -e package.json ]
   then
      echo " "
      echo "simple package mode"
      echo " "
      rm temp.zip
      cd ..
      cd ..
   else
      echo " "
      echo "  complex package mode  "
      echo " "
      cd ..
      mv -R $ext/*/* $ext/
      rm  $ext/temp.zip
      cd ..    
fi

# copying files to phoenix folder
cp -R temp/$ext phoenix/src/extensions/default/

# add package info to json
head -n -2 phoenix/src/extensions/default/DefaultExtensions.json > temp.txt
echo "  "'"'$ext'"' >> temp.txt
echo "]" >> temp.txt
mv temp.txt phoenix/src/extensions/default/DefaultExtensions.json

# run the script again and again
./flash.sh
