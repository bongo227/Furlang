#!/bin/bash
# alias.sh

# Call source setup.sh to setup the aliases in your terminal

alias build="go build -o build/compiler -tags 'llvm'"
alias buildn="go build -o build/compiler -tags 'nollvm'"
alias compile="build/compiler"
alias run="lli build/ben.ll"
alias ret="echo \$?"