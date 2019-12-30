# .bashrc

unalias -a
alias la='env LC_COLLATE=C ls -la -N --color=tty -T 0'
alias ll='env LC_COLLATE=C ls -l -N --color=tty -T 0'

test -f .prereq  && allpip install -r .prereq

# Local Variables:
# mode: sh
# End:
