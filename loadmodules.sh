MODULEDIR="./module-site"
MODULES="./modules"
DATE=$(date)

mkdir $MODULEDIR
cd $MODULEDIR

git clone https://github.com/ryuk156/ModuleSite.git

cd ModuleSite

rm -R modules

cd .. 

cd ..

cp -r $MODULES  ./module-site/ModuleSite

cd ./module-site/ModuleSite

git config --global user.email "yp15601560@gmail.com"

git config --global user.name "ryuk156"


git add .

git commit -m "Modules push on $DATE"

git remote add origin https://github.com/ryuk156/ModuleSite.git

git push origin build_process










