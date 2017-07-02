#!/usr/bin/env bash
#
# Copyright (c) 2015-2017 Vegard IT GmbH, http://vegardit.com
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH

#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
function -alloc-mem() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... MEMORY_IN_MB"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-alloc-mem() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _MEMORY_IN_MB
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... MEMORY_IN_MB"
                echo
                echo "Allocates the given amount of RAM."
                echo
                echo "Requirements:"
                echo "  + Command 'python' must be available."
                echo
                echo "Parameters:"
                echo -e "  \033[1mMEMORY_IN_MB\033[22m (required, integer: 1-?)"
                echo "      Amount of RAM in MB to allocate."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_MEMORY_IN_MB ]]; then
            _MEMORY_IN_MB=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ $_MEMORY_IN_MB ]]; then
        if [[ ! "$_MEMORY_IN_MB" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_MEMORY_IN_MB' for parameter MEMORY_IN_MB is not a numeric value."; return 64; fi
        if [[ $_MEMORY_IN_MB -lt 1 ]]; then echo "$__fn: Error: Value '$_MEMORY_IN_MB' for parameter MEMORY_IN_MB is too low. Must be >= 1."; return 64; fi
    else
        echo "$__fn: Error: Parameter MEMORY_IN_MB must be specified."; return 64
    fi

    if ! hash "python" &>/dev/null; then echo "$__fn: Error: Required command 'python' not found on this system."; return 64; fi

    ######### alloc-mem ######### START

echo -n "Allocating ${_MEMORY_IN_MB} MB of memory (may take a moment)..."
python -c "
a='1'*1024*1024*${_MEMORY_IN_MB}
print('DONE')
raw_input('Press enter to exit...')
"

    ######### alloc-mem ######### END
}
function __complete-alloc-mem() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}alloc-mem -- ${BASH_FUNK_PREFIX:--}alloc-mem

function -memfree() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... [MEMORY_UNIT]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-memfree() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _MEMORY_UNIT
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... [MEMORY_UNIT]"
                echo
                echo "Prints the free memory (in KB by default)."
                echo
                echo "Parameters:"
                echo -e "  \033[1mMEMORY_UNIT\033[22m (default: 'KB', one of: [KB,MB,GB])"
                echo "      The memory unit of the printed value."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                echo "Examples:"
                echo -e "$ \033[1m$__fn \033[22m"
                echo "1036560"
                echo -e "$ \033[1m$__fn MB\033[22m"
                echo "1012"
                echo -e "$ \033[1m$__fn GB\033[22m"
                echo "1"
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn \033[22m"
                __stdout="$($__fn )"; __rc=$?
                echo "$__stdout"
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[0-9]+$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn MB\033[22m"
                __stdout="$($__fn MB)"; __rc=$?
                echo "$__stdout"
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[0-9]+$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn GB\033[22m"
                __stdout="$($__fn GB)"; __rc=$?
                echo "$__stdout"
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[0-9]+$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_MEMORY_UNIT && ${#__params[@]} > 0 ]]; then
            _MEMORY_UNIT=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ ! $_MEMORY_UNIT ]]; then _MEMORY_UNIT="KB"; fi

    if [[ $_MEMORY_UNIT ]]; then
        if [[ $_MEMORY_UNIT != 'KB' && $_MEMORY_UNIT != 'MB' && $_MEMORY_UNIT != 'GB' ]]; then echo "$__fn: Error: Value '$_MEMORY_UNIT' for parameter MEMORY_UNIT is not one of the allowed values [KB,MB,GB]."; return 64; fi
    fi

    ######### memfree ######### START

local totalMem=$(awk '/MemFree/ {print $2}' /proc/meminfo)
local totalMemUnit=$(awk '/MemFree/ {print $3}' /proc/meminfo)

case ${totalMemUnit} in
    [Kk][Bb])
        local memTotalKB=$totalMem
        ;;
    [Mm][Bb])
        local memTotalKB=$(( totalMem * 1024 ))
        ;;
    [Gg][Bb])
        local memTotalKB=$(( totalMem * 1024 * 1024 ))
        ;;
    *)
        echo "Error: Unsupported memory unit ${totalMemUnit} encountered."
        return 1
        ;;
esac

case $_MEMORY_UNIT in
    KB)
        echo $memTotalKB
        ;;
    MB)
        echo $(( memTotalKB / 1024 ))
        ;;
    GB)
        echo $(( memTotalKB / 1024 / 1024 ))
        ;;
esac

    ######### memfree ######### END
}
function __complete-memfree() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}memfree -- ${BASH_FUNK_PREFIX:--}memfree

function -meminfo() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-meminfo() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Prints memory information from /proc/meminfo."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                echo "Examples:"
                echo -e "$ \033[1m$__fn \033[22m"
                echo "MemTotal:       24689452 kB
MemFree:        13713796 kB
MemAvailable:   16143004 kB
..."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn \033[22m"
                __stdout="$($__fn )"; __rc=$?
                echo "$__stdout"
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^.*MemTotal.*MemFree.*$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [.*MemTotal.*MemFree.*]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    ######### meminfo ######### START

cat /proc/meminfo

    ######### meminfo ######### END
}
function __complete-meminfo() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}meminfo -- ${BASH_FUNK_PREFIX:--}meminfo

function -memtotal() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... [MEMORY_UNIT]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-memtotal() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _MEMORY_UNIT
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]... [MEMORY_UNIT]"
                echo
                echo "Prints the total memory (in KB by default)."
                echo
                echo "Parameters:"
                echo -e "  \033[1mMEMORY_UNIT\033[22m (default: 'KB', one of: [KB,MB,GB])"
                echo "      The memory unit of the printed value."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                echo "Examples:"
                echo -e "$ \033[1m$__fn \033[22m"
                echo "1036560"
                echo -e "$ \033[1m$__fn MB\033[22m"
                echo "1012"
                echo -e "$ \033[1m$__fn GB\033[22m"
                echo "1"
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn \033[22m"
                __stdout="$($__fn )"; __rc=$?
                echo "$__stdout"
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[0-9]+$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn MB\033[22m"
                __stdout="$($__fn MB)"; __rc=$?
                echo "$__stdout"
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[0-9]+$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn GB\033[22m"
                __stdout="$($__fn GB)"; __rc=$?
                echo "$__stdout"
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[0-9]+$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_MEMORY_UNIT && ${#__params[@]} > 0 ]]; then
            _MEMORY_UNIT=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ ! $_MEMORY_UNIT ]]; then _MEMORY_UNIT="KB"; fi

    if [[ $_MEMORY_UNIT ]]; then
        if [[ $_MEMORY_UNIT != 'KB' && $_MEMORY_UNIT != 'MB' && $_MEMORY_UNIT != 'GB' ]]; then echo "$__fn: Error: Value '$_MEMORY_UNIT' for parameter MEMORY_UNIT is not one of the allowed values [KB,MB,GB]."; return 64; fi
    fi

    ######### memtotal ######### START

local totalMem=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
local totalMemUnit=$(awk '/MemTotal/ {print $3}' /proc/meminfo)

case ${totalMemUnit} in
    [Kk][Bb])
        local memTotalKB=$totalMem
        ;;
    [Mm][Bb])
        local memTotalKB=$(( totalMem * 1024 ))
        ;;
    [Gg][Bb])
        local memTotalKB=$(( totalMem * 1024 * 1024 ))
        ;;
    *)
        echo "Error: Unsupported memory unit ${totalMemUnit} encountered."
        return 1
        ;;
esac

case $_MEMORY_UNIT in
    KB)
        echo $memTotalKB
        ;;
    MB)
        echo $(( memTotalKB / 1024 ))
        ;;
    GB)
        echo $(( memTotalKB / 1024 / 1024 ))
        ;;
esac

    ######### memtotal ######### END
}
function __complete-memtotal() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}memtotal -- ${BASH_FUNK_PREFIX:--}memtotal

function -test-memory() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-memory() {
    local __args=() __arg __idx __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -t 1 ] && __interactive=1 || true
    
    for __arg in "$@"; do
        case "$__arg" in
            -|--*) __args+=("$__arg") ;;
            -*) for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
        esac
    done
    for __arg in "${__args[@]}"; do
        case "$__arg" in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo -e "    \033[1m--\033[22m"
                echo "        Terminates the option list."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                local __stdout __rc
                __stdout="$($__fn --help)"; __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --)
                __optionWithValue=--
              ;;
            -*)
                if [[ $__optionWithValue == '--' ]]; then
                        __params+=("$__arg")
                else
                    echo "$__fn: invalid option: '$__arg'"
                    return 64
                fi
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    ######### test-memory ######### START

${BASH_FUNK_PREFIX:--}alloc-mem --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}memfree --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}meminfo --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}memtotal --selftest && echo || return 1

    ######### test-memory ######### END
}
function __complete-test-memory() {
    local curr=${COMP_WORDS[COMP_CWORD]}
    if [[ ${curr} == -* ]]; then
        local options=" --help "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $curr))
    else
        COMPREPLY=($(compgen -o default -- $curr))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-memory -- ${BASH_FUNK_PREFIX:--}test-memory


function -help-memory() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}alloc-mem MEMORY_IN_MB\033[0m  -  Allocates the given amount of RAM."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}memfree [MEMORY_UNIT]\033[0m  -  Prints the free memory (in KB by default)."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}meminfo\033[0m  -  Prints memory information from /proc/meminfo."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}memtotal [MEMORY_UNIT]\033[0m  -  Prints the total memory (in KB by default)."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-memory\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( alloc-mem memfree meminfo memtotal test-memory )
