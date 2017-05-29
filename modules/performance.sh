#!/bin/bash
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

    [[ -p /dev/stdout ]] && local _in_pipe=1 || local _in_pipe=
    [ -t 1 ] && local _in_subshell= || local _in_subshell=1
    local fn=${FUNCNAME[0]}
    [[ $_in_pipe || $_in_subshell ]] && local hint= || local hint="

Usage: $fn [OPTION]...

Type '$fn --help' for more details."
    local arg optionWithValue params=() _help _selftest
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: $fn [OPTION]..."
                echo 
                echo "Prints the number of processors."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [$fn]..."
                echo -e "$ \e[1m$fn --help\e[22m"
                local regex stdout rc
                stdout=$($fn --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                echo "--> OK"
                echo "Testing function [$fn]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "$fn: invalid option: '$arg'"
                echo Type \'$fn --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        echo "$fn: Error: too many parameters: '$param'$hint"
        return 1
    done
    unset param params leftoverParams
    
    
    
    
    ######################################################

cat /proc/cpuinfo | grep processor | wc -l

}
function _-cpu-count() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-cpu-count -- ${BASH_FUNK_PREFIX:-}-cpu-count

function -perftest() {

    [[ -p /dev/stdout ]] && local _in_pipe=1 || local _in_pipe=
    [ -t 1 ] && local _in_subshell= || local _in_subshell=1
    local fn=${FUNCNAME[0]}
    [[ $_in_pipe || $_in_subshell ]] && local hint= || local hint="

Usage: $fn [OPTION]...

Type '$fn --help' for more details."
    local arg optionWithValue params=() _help _selftest
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: $fn [OPTION]..."
                echo 
                echo "Performs a CPU speed test using openssl utilizing all available processors."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [$fn]..."
                echo -e "$ \e[1m$fn --help\e[22m"
                local regex stdout rc
                stdout=$($fn --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                echo "--> OK"
                echo "Testing function [$fn]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "$fn: invalid option: '$arg'"
                echo Type \'$fn --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        echo "$fn: Error: too many parameters: '$param'$hint"
        return 1
    done
    unset param params leftoverParams
    
    
    
    
    ######################################################

openssl speed rsa1024 -multi $(cat /proc/cpuinfo | grep processor | wc -l)

}
function _-perftest() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-perftest -- ${BASH_FUNK_PREFIX:-}-perftest

function -test-performance() {

    [[ -p /dev/stdout ]] && local _in_pipe=1 || local _in_pipe=
    [ -t 1 ] && local _in_subshell= || local _in_subshell=1
    local fn=${FUNCNAME[0]}
    [[ $_in_pipe || $_in_subshell ]] && local hint= || local hint="

Usage: $fn [OPTION]...

Type '$fn --help' for more details."
    local arg optionWithValue params=() _help _selftest
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: $fn [OPTION]..."
                echo 
                echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                return 0
              ;;
    
            --selftest)
                echo "Testing function [$fn]..."
                echo -e "$ \e[1m$fn --help\e[22m"
                local regex stdout rc
                stdout=$($fn --help); rc=$?
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                echo "--> OK"
                echo "Testing function [$fn]...DONE"
                return 0
              ;;
    
    
    
            -*)
                echo "$fn: invalid option: '$arg'"
                echo Type \'$fn --help\' for usage.
                return 1
              ;;
    
            *)
                case $optionWithValue in
                    *)
                        params+=("$arg")
                esac
              ;;
        esac
    done
    unset arg optionWithValue
    
    for param in "${params[@]}"; do
        echo "$fn: Error: too many parameters: '$param'$hint"
        return 1
    done
    unset param params leftoverParams
    
    
    
    
    ######################################################

${BASH_FUNK_PREFIX:-}-cpu-count --selftest && echo || return 1
${BASH_FUNK_PREFIX:-}-perftest --selftest && echo || return 1
}
function _-test-performance() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-test-performance -- ${BASH_FUNK_PREFIX:-}-test-performance

function -help-performance() {

    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-cpu-count\e[0m  -  Prints the number of processors."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-perftest\e[0m  -  Performs a CPU speed test using openssl utilizing all available processors."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-test-performance\e[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}

