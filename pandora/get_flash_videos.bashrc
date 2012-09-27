export PS1='\w\$ '
umask 022

export PATH=$(pwd)/bin:$PATH
export PERL5LIB=$(pwd)/lib/perl5
export LD_LIBRARY_PATH=$(pwd)/lib
export HOME=$(pwd)

alias gfv="get_flash_videos"

mkdir -p .get_flash_videos
cp -r -u defaults/* .get_flash_videos

mkdir -p downloads
cd downloads

echo 'Run `get_flash_videos --help` for more info'
echo
echo 'Shortcuts:'
echo '  gfv - alias for get_flash_videos'
echo '  gfvc - wrapper script that passes contents of clipboard as last argument'

