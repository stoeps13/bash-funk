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
function -random-number() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... RANGE"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-random-number() {
    local __arg __optionWithValue __params=() __in_subshell __in_pipe __fn=${FUNCNAME[0]/__impl/} _help _selftest _RANGE
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... RANGE"
                echo
                echo "Generates a random number of the given range. The range is inclusive."
                echo
                echo "Parameters:"
                echo -e "  \033[1mRANGE\033[22m (required, pattern: \"[1-9][0-9]*-[1-9][0-9]*\")"
                echo "      The numeric range LOW-HIGH, e.g. 1-5."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                echo "Examples:"
                echo -e "$ \033[1m$__fn 1-1\033[22m"
                echo "1"
                echo -e "$ \033[1m$__fn 1-5\033[22m"
                echo "4"
                echo -e "$ \033[1m$__fn 200-299\033[22m"
                echo "253"
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn 1-1\033[22m"
                __stdout=$($__fn 1-1); __rc=$?
                echo $__stdout
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^1$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [1]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn 1-5\033[22m"
                __stdout=$($__fn 1-5); __rc=$?
                echo $__stdout
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[1-5]$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[1-5]]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn 200-299\033[22m"
                __stdout=$($__fn 200-299); __rc=$?
                echo $__stdout
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[2-3][0-9][0-9]$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[2-3][0-9][0-9]]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
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
        if [[ ! $_RANGE ]]; then
            _RANGE=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ $_RANGE ]]; then
        if [[ ! "$_RANGE" =~ ^[1-9][0-9]*-[1-9][0-9]*$ ]]; then echo "$__fn: Error: Value '$_RANGE' for parameter RANGE does not match required pattern '[1-9][0-9]*-[1-9][0-9]*'."; return 64; fi
    else
        echo "$__fn: Error: Parameter RANGE must be specified."; return 64
    fi

    ######### random-number ######### START

shuf -i ${_RANGE} -n 1

    ######### random-number ######### END
}
function __complete-random-number() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}random-number -- ${BASH_FUNK_PREFIX:--}random-number

function -random-string() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... LENGTH [CHARS]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-random-string() {
    local __arg __optionWithValue __params=() __in_subshell __in_pipe __fn=${FUNCNAME[0]/__impl/} _help _selftest _LENGTH _CHARS
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... LENGTH [CHARS]"
                echo
                echo "Prints a random string of the given length containing the given characters."
                echo
                echo "Parameters:"
                echo -e "  \033[1mLENGTH\033[22m (required, integer: 1-?)"
                echo "      Length of the string to generate."
                echo -e "  \033[1mCHARS\033[22m (default: '[:graph:]')"
                echo "      String to choose random characters from."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                echo "Examples:"
                echo -e "$ \033[1m$__fn 12 0-9\033[22m"
                echo "686026902293"
                echo -e "$ \033[1m$__fn 8 a-zA-Z\033[22m"
                echo "ECtQptCz"
                echo -e "$ \033[1m$__fn 10 [:alnum:]\033[22m"
                echo "w2TZ8fHaRw"
                echo -e "$ \033[1m$__fn 10 [:alnum:][:punct:]\033[22m"
                echo "4pH?+40D):"
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn 12 0-9\033[22m"
                __stdout=$($__fn 12 0-9); __rc=$?
                echo $__stdout
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[0-9]{12}$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]{12}]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn 8 a-zA-Z\033[22m"
                __stdout=$($__fn 8 a-zA-Z); __rc=$?
                echo $__stdout
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[a-zA-Z]{8}$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[a-zA-Z]{8}]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn 10 [:alnum:]\033[22m"
                __stdout=$($__fn 10 [:alnum:]); __rc=$?
                echo $__stdout
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[[:alnum:]]{10}$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[[:alnum:]]{10}]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo -e "$ \033[1m$__fn 10 [:alnum:][:punct:]\033[22m"
                __stdout=$($__fn 10 [:alnum:][:punct:]); __rc=$?
                echo $__stdout
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                __regex="^[[:alnum:][:punct:]]{10}$"
                if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[[:alnum:][:punct:]]{10}]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
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
        if [[ ! $_LENGTH ]]; then
            _LENGTH=$__param
            continue
        fi
        if [[ ! $_CHARS ]]; then
            _CHARS=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done

    if [[ ! $_CHARS ]]; then _CHARS="[:graph:]"; fi

    if [[ $_LENGTH ]]; then
        if [[ ! "$_LENGTH" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_LENGTH' for parameter LENGTH is not a numeric value."; return 64; fi
        if [[ $_LENGTH -lt 1 ]]; then echo "$__fn: Error: Value '$_LENGTH' for parameter LENGTH is too low. Must be >= 1."; return 64; fi
    else
        echo "$__fn: Error: Parameter LENGTH must be specified."; return 64
    fi

    ######### random-string ######### START

env LC_CTYPE=C tr -dc "$_CHARS" < /dev/urandom | fold -w ${_LENGTH} | head -n 1

    ######### random-string ######### END
}
function __complete-random-string() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}random-string -- ${BASH_FUNK_PREFIX:--}random-string

function -test-random() {
    local opts="" opt rc __fn=${FUNCNAME[0]}
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
    for opt in nullglob extglob nocasematch nocaseglob; do
        shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    __impl$__fn "$@" && rc=0 || rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-random() {
    local __arg __optionWithValue __params=() __in_subshell __in_pipe __fn=${FUNCNAME[0]/__impl/} _help _selftest
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    for __arg in "$@"; do
        case $__arg in

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
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> \033[32mOK\033[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
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

    ######### test-random ######### START

${BASH_FUNK_PREFIX:--}random-number --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}random-string --selftest && echo || return 1

    ######### test-random ######### END
}
function __complete-test-random() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-random -- ${BASH_FUNK_PREFIX:--}test-random


function -help-random() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}random-number RANGE\033[0m  -  Generates a random number of the given range. The range is inclusive."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}random-string LENGTH [CHARS]\033[0m  -  Prints a random string of the given length containing the given characters."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-random\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( random-number random-string test-random )
