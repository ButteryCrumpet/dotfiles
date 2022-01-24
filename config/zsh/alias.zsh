# Run sudo with user path (bit hacky)
alias sudo='sudo -E env "PATH=$PATH"'

# Move up dirs
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# ls variants
alias l='ls -FAh'
alias la='ls -lAFh'
alias lt='ls -lFAht'
alias lr='ls -RFAh'

# copy to clipboard
alias ccpy='xclip -selection c'
alias cpst='xclip -out -selection c'

# fuzzy
## open
alias fzopen='nvim $(fzf)'
## delete
alias fzrm='rm $(fzf)'

## python -> python3
alias python='python3'

# File helpers
# echo file line
eln() {
  sed -n "$1{p;q}" $2
}

elnb() {
  awk "{ if(NR > ${2}) exit; else if (NR >= ${1}) print;}" $3
}

dotenvar() {
  grep $1 ${2:-".env"} | awk -F '=' '{ gsub(/"/, "", $2); print $2 }'
}
