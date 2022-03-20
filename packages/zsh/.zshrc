# if [ $UID -eq 0 ]; then
#     PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
# else
#     PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
# fi
#PS1='\[\e[34m\]\w \[\e[37m\]\$\[\e[0m\]'
PROMPT="%B%F{green}%n@[%*]%f%b:%B%F{blue}%~%f%b%# "

export PATH="$PATH":"$HOME/.pub-cache/bin":$HOME/.cargo/bin:$HOME/.nodebrew/current/bin:/usr/local/go/bin

CMAKE_PREFIX_PATH="/Users/meruneru/works/doctest/doctest/"

# Go
export GOPATH=$HOME/go
export PATH="$PATH":"$GOPATH"/bin

# Clangd
export PATH="$PATH":/usr/local/opt/llvm/bin


export QT_DIR=/Users/meruneru/Qt
export QT_VERSION=5.15.2
export QT_API=5.13.0

HISTSIZE=10000
HISTFILESIZE=10000

export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH":/Users/meruneru/program/atcoder/ac-library/

if [ -f ~/.zsh_aliases ]; then                                                                                                                                                    
    . ~/.zsh_aliases
fi
