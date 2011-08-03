export PS1='\w\$ '
umask 022

export PATH=$(pwd)/bin:$PATH
export PERL5LIB=$(pwd)/lib/perl5
export LD_LIBRARY_PATH=$(pwd)/lib
export HOME=$(pwd)

if [ ! -d .get_flash_videos ] ; then
    cp -r defaults .get_flash_videos
fi

mkdir -p downloads
cd downloads

echo 'Run `get_flash_videos --help` for more info'
