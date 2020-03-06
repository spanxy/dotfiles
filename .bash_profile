if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

PATH="${HOME}/bin:/usr/local/bin:/usr/local/sbin:$PATH"

umask 077
