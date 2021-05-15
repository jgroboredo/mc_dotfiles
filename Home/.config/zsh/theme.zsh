# PROMPT="%~$ "
PS1='%1~$ '

# ZSH_DISABLE_COMPFIX=true

# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"

POWERLEVEL10K_PROMPT_ON_NEWLINE=true
POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(virtualenv user dir_writable dir vcs) # os_icon
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs)

if [[ $DISPLAY ]] && [ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
elif [[ $DISPLAY ]] && [ -f ~/.powerlevel10k/powerlevel10k.zsh-theme ]; then
    source ~/.powerlevel10k/powerlevel10k.zsh-theme
fi
