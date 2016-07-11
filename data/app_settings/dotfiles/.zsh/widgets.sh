function pbcopy-current-line {
  # zle vi-yank
  echo "$BUFFER" | tr -d '\n' | pbcopy
}

zle -N vi-yank-pbcopy1 pbcopy-current-line

bindkey '^[copycurrentline' vi-yank-pbcopy1
