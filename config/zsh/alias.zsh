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
