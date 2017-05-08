# if superuser make the username green
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="blue"; fi

RVM_SYMBOL_COLOR="%{$fg[magenta]%}"
RVM_RESULT_COLOR="%{$fg[pink]%}"

function rvm_prompt_info() {
  ruby_version=$(~/.rvm/bin/rvm-prompt v g s 2> /dev/null) || return
  if [ -z $ruby_version ]; then; return; fi
  echo " $RVM_SYMBOL_COLOR"‹"$RVM_RESULT_COLOR$ruby_version$RVM_SYMBOL_COLOR"›"%{$reset_color%}"
}

#PROMPT="%{$fg[$NCOLOR]%}%n%{$reset_color%}@%M %30<...<%~%<<%{$reset_color%} \$(rvm_prompt_info)\$(git_prompt_info) %(!.#.$) "
PROMPT="%{$fg[$NCOLOR]%}%n%{$reset_color%}@%M :: %2~%{$reset_color%}\$(rvm_prompt_info)\$(git_prompt_info) %(!.#.$) "

GIT_SYMBOL_COLOR="%{$fg[magenta]%}"
GIT_BRANCH_COLOR="%{$fg[green]%}"
#GIT_INFO_PROMPT="$GIT_SYMBOL_COLOR(%{$reset_color%}git$GIT_SYMBOL_COLOR)"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}-$GIT_SYMBOL_COLOR"["$GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_SYMBOL_COLOR"]"%{$reset_color%}"
