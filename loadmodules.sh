MODULEDIR="./module-site"
MODULES="./modules"
DATE=$(date)

git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)
brew install git
brew install hub


mkdir $MODULEDIR
cd $MODULEDIR

git clone https://github.com/ryuk156/ModuleSite.git

cd ModuleSite

rm -R modules

cd .. 

cd ..

cp -r $MODULES  ./module-site/ModuleSite












