alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias firefox="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox -start-debugger-server"
alias pc=proxychains4

alias preview="fzf --preview 'bat --color always {}'"

alias cat="bat"
alias ping="prettyping --nolegend"
alias top="htop" # alias top and fix high sierra bug
alias difff="diff-so-fancy"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias ls="exa"

alias gcz="git cz"

alias scrcp="scrcpy -b 2M -m 1024"
