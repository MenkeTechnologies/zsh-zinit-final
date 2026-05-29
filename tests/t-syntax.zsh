#!/usr/bin/env zunit
#{{{                    MARK:Header
#**************************************************************
##### Purpose: zsh-zinit-final intentional-stub invariants.
#####          The plugin is empty by design — it exists as a
#####          carrier for `zinit ice atinit/atload`. These tests
#####          PIN that emptiness so the stub can never silently
#####          grow side effects.
#}}}***********************************************************

@setup {
    0="${${0:#$ZSH_ARGZERO}:-${(%):-%N}}"
    0="${${(M)0:#/*}:-$PWD/$0}"
    pluginDir="${0:h:A}"
}

@test 'plugin *.zsh parses cleanly' {
    for file in "$pluginDir/"*.zsh; do
        run zsh -n "$file"
        assert $state equals 0
    done
}

@test 'plugin defines NO functions when sourced' {
    run zsh -c '
        before=$(typeset -f | grep -c "^[a-zA-Z_][a-zA-Z0-9_-]* ()")
        source "'"$pluginDir"'/zsh-zinit-final.plugin.zsh"
        after=$(typeset -f | grep -c "^[a-zA-Z_][a-zA-Z0-9_-]* ()")
        echo "delta=$((after-before))"
    '
    assert $state equals 0
    assert "$output" contains "delta=0"
}

@test 'plugin defines NO aliases when sourced' {
    run zsh -c '
        before=$(alias | wc -l)
        source "'"$pluginDir"'/zsh-zinit-final.plugin.zsh"
        after=$(alias | wc -l)
        echo "delta=$((after-before))"
    '
    assert $state equals 0
    assert "$output" contains "delta=0"
}

@test 'plugin produces NO output when sourced' {
    run zsh -c 'source "'"$pluginDir"'/zsh-zinit-final.plugin.zsh"'
    assert $state equals 0
    [[ -z "$output" ]]
    assert $state equals 0
}
