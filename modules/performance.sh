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
function -cpu-count() {
    local opts=""
    local opt
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

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-cpu-count() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Prints the number of processors."
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
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
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




    ######################################################
grep processor /proc/cpuinfo | wc -l
}
function __complete-cpu-count() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}cpu-count -- ${BASH_FUNK_PREFIX:--}cpu-count

function -perftest() {
    local opts=""
    local opt
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

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-perftest() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Performs a CPU speed test using openssl utilizing all available processors."
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
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
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




    ######################################################
openssl speed rsa1024 -multi $(cat /proc/cpuinfo | grep processor | wc -l)
}
function __complete-perftest() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}perftest -- ${BASH_FUNK_PREFIX:--}perftest

function -test-performance() {
    local opts=""
    local opt
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

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-performance() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
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
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
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




    ######################################################
${BASH_FUNK_PREFIX:--}cpu-count --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}perftest --selftest && echo || return 1
}
function __complete-test-performance() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-performance -- ${BASH_FUNK_PREFIX:--}test-performance


function -help-performance() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}cpu-count\033[0m  -  Prints the number of processors."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}perftest\033[0m  -  Performs a CPU speed test using openssl utilizing all available processors."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-performance\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( cpu-count perftest test-performance )
