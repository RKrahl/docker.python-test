# .bashrc

unalias -a
alias la='env LC_COLLATE=C ls -la -N --color=tty -T 0'
alias ll='env LC_COLLATE=C ls -l -N --color=tty -T 0'

if [ -f .prereq ]
then
    for v in 2.7 3.3 3.4 3.5 3.6 3.7 3.8
    do
	sudo pip$v install -r .prereq
    done
fi
