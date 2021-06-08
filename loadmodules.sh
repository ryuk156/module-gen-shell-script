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


git add .

git commit -m "Modules push on $DATE"

git remote add upstream https://github.com/ryuk156/ModuleSite.git

git push origin build_process










