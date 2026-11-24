function fish_prompt
    set -l dir (string replace -r "^$HOME" "~" $PWD)
    printf '%s %s$%s ' "$dir" (set_color white --bold) (set_color normal)
end
