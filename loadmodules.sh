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











