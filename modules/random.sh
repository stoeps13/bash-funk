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

function -random-number() {

    [[ -p /dev/stdout ]] && local _in_pipe=1 || local _in_pipe=
    [ -t 1 ] && local _in_subshell= || local _in_subshell=1
    local fn=${FUNCNAME[0]}
    [[ $_in_pipe || $_in_subshell ]] && local hint= || local hint="

Usage: $fn [OPTION]... RANGE

Type '$fn --help' for more details."
    local arg optionWithValue params=() _help _selftest _RANGE
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: $fn [OPTION]... RANGE"
                echo 
                echo "Generates a random number of the given range. The range is inclusive."
                echo 
                echo "Parameters:"
                echo -e "  \e[1mRANGE\e[22m (required)"
                echo "      The numeric range LOW-HIGH, e.g. 1-5."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                echo "Examples:"
                echo -e "$ \e[1m$fn 1-1\e[22m"
                echo "1"
                echo -e "$ \e[1m$fn 1-5\e[22m"
                echo "4"
                echo -e "$ \e[1m$fn 200-299\e[22m"
                echo "253"
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
                echo -e "$ \e[1m$fn 1-1\e[22m"
                stdout=$($fn 1-1); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                regex="^1$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [1].$hint"; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m$fn 1-5\e[22m"
                stdout=$($fn 1-5); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                regex="^[1-5]$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[1-5]].$hint"; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m$fn 200-299\e[22m"
                stdout=$($fn 200-299); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                regex="^[2-3][0-9][0-9]$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[2-3][0-9][0-9]].$hint"; return 1; fi
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
        if [[ ! $_RANGE ]]; then
            _RANGE=$param
            continue
        fi
        echo "$fn: Error: too many parameters: '$param'$hint"
        return 1
    done
    unset param params leftoverParams
    
    
    if [[ $_RANGE ]]; then
        local regex="^[1-9][0-9]*-[1-9][0-9]*$"
        if [[ ! "$_RANGE" =~ $regex ]]; then echo "$fn: Error: Value '$_RANGE' for parameter RANGE does not match required pattern '[1-9][0-9]*-[1-9][0-9]*'.$hint"; return 1; fi
        unset regex
        true
    else
        echo "$fn: Error: Parameter RANGE must be specified.$hint"; return 1
    fi
    
    
    ######################################################

shuf -i ${_RANGE} -n 1

}
function _-random-number() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-random-number -- ${BASH_FUNK_PREFIX:-}-random-number

function -random-string() {

    [[ -p /dev/stdout ]] && local _in_pipe=1 || local _in_pipe=
    [ -t 1 ] && local _in_subshell= || local _in_subshell=1
    local fn=${FUNCNAME[0]}
    [[ $_in_pipe || $_in_subshell ]] && local hint= || local hint="

Usage: $fn [OPTION]... LENGTH [CHARS]

Type '$fn --help' for more details."
    local arg optionWithValue params=() _help _selftest _LENGTH _CHARS
    for arg in "$@"; do
        case $arg in
    
            --help)
                echo "Usage: $fn [OPTION]... LENGTH [CHARS]"
                echo 
                echo "Prints a random string of the given length containing the given characters."
                echo 
                echo "Parameters:"
                echo -e "  \e[1mLENGTH\e[22m (required)"
                echo "      Length of the string to generate."
                echo -e "  \e[1mCHARS\e[22m "
                echo "      String to choose random characters from."
                echo 
                echo "Options:"
                echo -e "\e[1m    --help\e[22m "
                echo "        Prints this help."
                echo -e "\e[1m    --selftest\e[22m "
                echo "        Performs a self-test."
                echo 
                echo "Examples:"
                echo -e "$ \e[1m$fn 12 0-9\e[22m"
                echo "686026902293"
                echo -e "$ \e[1m$fn 8 a-zA-Z\e[22m"
                echo "ECtQptCz"
                echo -e "$ \e[1m$fn 10 [:alnum:]\e[22m"
                echo "w2TZ8fHaRw"
                echo -e "$ \e[1m$fn 10 [:alnum:][:punct:]\e[22m"
                echo "4pH?+40D):"
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
                echo -e "$ \e[1m$fn 12 0-9\e[22m"
                stdout=$($fn 12 0-9); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                regex="^[0-9]{12}$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[0-9]{12}].$hint"; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m$fn 8 a-zA-Z\e[22m"
                stdout=$($fn 8 a-zA-Z); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                regex="^[a-zA-Z]{8}$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[a-zA-Z]{8}].$hint"; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m$fn 10 [:alnum:]\e[22m"
                stdout=$($fn 10 [:alnum:]); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                regex="^[[:alnum:]]{10}$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[[:alnum:]]{10}].$hint"; return 1; fi
                echo "--> OK"
                echo -e "$ \e[1m$fn 10 [:alnum:][:punct:]\e[22m"
                stdout=$($fn 10 [:alnum:][:punct:]); rc=$?
                echo $stdout
                if [[ $rc != 0 ]]; then echo "--> FAILED - exit code [$rc] instead of expected [0].$hint"; return 1; fi
                regex="^[[:alnum:][:punct:]]{10}$"
                if [[ ! "$stdout" =~ $regex ]]; then echo "--> FAILED - stdout [$stdout] does not match required pattern [[[:alnum:][:punct:]]{10}].$hint"; return 1; fi
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
        if [[ ! $_LENGTH ]]; then
            _LENGTH=$param
            continue
        fi
        if [[ ! $_CHARS ]]; then
            _CHARS=$param
            continue
        fi
        echo "$fn: Error: too many parameters: '$param'$hint"
        return 1
    done
    unset param params leftoverParams
    
    
    if [[ $_LENGTH ]]; then
        if [[ ! "$_LENGTH" =~ ^-?[0-9]*$ ]]; then echo "$fn: Error: Value '$_LENGTH' for parameter LENGTH is not a numeric value.$hint"; return 1; fi
        if [[ $_LENGTH -lt 1 ]]; then echo "$fn: Error: Value '$_LENGTH' for parameter LENGTH is too low. Must be >= 1.$hint"; return 1; fi
        true
    else
        echo "$fn: Error: Parameter LENGTH must be specified.$hint"; return 1
    fi
    if [[ $_CHARS ]]; then
        true
    fi
    
    
    ######################################################

cat /dev/urandom | env LC_CTYPE=C tr -dc "${_CHARS:-[:graph:]}" | fold -w ${_LENGTH} | head -n 1

}
function _-random-string() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-random-string -- ${BASH_FUNK_PREFIX:-}-random-string

function -test-random() {

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

${BASH_FUNK_PREFIX:-}-random-number --selftest && echo || return 1
${BASH_FUNK_PREFIX:-}-random-string --selftest && echo || return 1
}
function _-test-random() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in ${COMP_WORDS[@]}; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F _${BASH_FUNK_PREFIX:-}-test-random -- ${BASH_FUNK_PREFIX:-}-test-random

function -help-random() {

    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-random-number RANGE\e[0m  -  Generates a random number of the given range. The range is inclusive."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-random-string LENGTH [CHARS]\e[0m  -  Prints a random string of the given length containing the given characters."
    echo -e "\e[1m${BASH_FUNK_PREFIX:-}-test-random\e[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}

