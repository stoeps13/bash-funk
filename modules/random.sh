#!/usr/bin/env bash
#
# Copyright 2015-2020 by Vegard IT GmbH (https://vegardit.com)
# SPDX-License-Identifier: Apache-2.0
#
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH

#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
# documentation: https://github.com/vegardit/bash-funk/tree/master/docs/random.md
#

function -entropy-available() {
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
function __impl-entropy-available() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
      for __arg in "$@"; do
      case "$__arg" in
         --) __noMoreFlags=1; __args+=("--") ;;
         -|--*) __args+=("$__arg") ;;
         -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
         *) __args+=("$__arg") ;;
      esac
   done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Determines if enough entropy bits are available perform a non-blocking read from /dev/random. Exit code 1 indicates entropy pool is not sufficiently filled."
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
            echo "/proc/sys/kernel/random/entropy_avail: 64
/proc/sys/kernel/random/read_wakeup_threshold: 2429"
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
            __regex="^(.*: Warning: Kernel parameter.*|.*: [0-9]+)$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [(.*: Warning: Kernel parameter.*|.*: [0-9]+)]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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

####### entropy-available ####### START
if [[ ! -e /proc/sys/kernel/random/read_wakeup_threshold ]]; then
    echo "$__fn: Warning: Kernel parameter /proc/sys/kernel/random/read_wakeup_threshold is not present, assuming sufficient entropy is available."
    return 0
fi

local avail=$(cat /proc/sys/kernel/random/entropy_avail)
local required=$(cat /proc/sys/kernel/random/read_wakeup_threshold)
echo "/proc/sys/kernel/random/entropy_avail: $avail"
echo "/proc/sys/kernel/random/read_wakeup_threshold: $required"
(( avail > required ))
####### entropy-available ####### END
}
function __complete-entropy-available() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}entropy-available -- ${BASH_FUNK_PREFIX:--}entropy-available

function -fill-entropy() {
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
      echo; echo "Usage: $__fn [OPTION]... [DURATION]"
      echo; echo "Type '$__fn --help' for more details."
   fi

   eval $opts

   return $rc
}
function __impl-fill-entropy() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _DURATION
   [ -t 1 ] && __interactive=1 || true
      for __arg in "$@"; do
      case "$__arg" in
         --) __noMoreFlags=1; __args+=("--") ;;
         -|--*) __args+=("$__arg") ;;
         -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
         *) __args+=("$__arg") ;;
      esac
   done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]... [DURATION]"
            echo
            echo "Fills /dev/random with pseudo-random values from /dev/urandom."
            echo
            echo "Requirements:"
            echo "  + Command 'rngd' must be available."
            echo "  + Sudo 'rngd' is required."
            echo
            echo "Parameters:"
            echo -e "  \033[1mDURATION\033[22m (default: '1', integer: 1-?)"
            echo "      Number of seconds the entropy pool will be filled."
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
            echo "Available entropy bits before: 1000
Generating for 1 second(s)...
Available entropy bits after: 1013"
            echo -e "$ \033[1m$__fn 2\033[22m"
            echo "Available entropy bits before: 1013
Generating for 2 second(s)...
Available entropy bits after: 1039"
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
            __regex="^Available entropy bits before: [0-9]+.*$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [Available entropy bits before: [0-9]+.*]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 2\033[22m"
            __stdout="$($__fn 2)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^Available entropy bits before: [0-9]+.*$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [Available entropy bits before: [0-9]+.*]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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
      if [[ ! $_DURATION && ${#__params[@]} > 0 ]]; then
         _DURATION=$__param
         continue
      fi
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

   if [[ ! $_DURATION ]]; then _DURATION="1"; fi

   if [[ $_DURATION ]]; then
      if [[ ! "$_DURATION" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_DURATION' for parameter DURATION is not a numeric value."; return 64; fi
      if [[ $_DURATION -lt 1 ]]; then echo "$__fn: Error: Value '$_DURATION' for parameter DURATION is too low. Must be >= 1."; return 64; fi
   fi

   if ! hash "rngd" &>/dev/null; then echo "$__fn: Error: Required command 'rngd' not found on this system."; return 64; fi
   if ! hash "sudo" &>/dev/null; then echo "$__fn: Error: Required command 'sudo' not found on this system."; return 64; fi
   if ! sudo -l -- rngd &>/dev/null; then echo "$__fn: Error: User $USER misses required sudo permission for 'rngd'"; return 64; fi

####### fill-entropy ####### START
echo -n "Available entropy bits before: "
cat /proc/sys/kernel/random/entropy_avail

echo "Generating for ${_DURATION} seconds..."
if rngd --help | grep -q -- --timeout; then
    sudo rngd -r /dev/urandom -o /dev/random -f --timeout ${_DURATION}
else
    ${BASH_FUNK_PREFIX:--}timeout ${_DURATION} sudo rngd -r /dev/urandom -o /dev/random -f
fi

echo -n "Available entropy bits after: "
cat /proc/sys/kernel/random/entropy_avail
####### fill-entropy ####### END
}
function __complete-fill-entropy() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}fill-entropy -- ${BASH_FUNK_PREFIX:--}fill-entropy

function -random-number() {
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
      echo; echo "Usage: $__fn [OPTION]... RANGE"
      echo; echo "Type '$__fn --help' for more details."
   fi

   eval $opts

   return $rc
}
function __impl-random-number() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _RANGE
   [ -t 1 ] && __interactive=1 || true
      for __arg in "$@"; do
      case "$__arg" in
         --) __noMoreFlags=1; __args+=("--") ;;
         -|--*) __args+=("$__arg") ;;
         -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
         *) __args+=("$__arg") ;;
      esac
   done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

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
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
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
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 1-1\033[22m"
            __stdout="$($__fn 1-1)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^1$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [1]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 1-5\033[22m"
            __stdout="$($__fn 1-5)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[1-5]$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[1-5]]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 200-299\033[22m"
            __stdout="$($__fn 200-299)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[2-3][0-9][0-9]$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[2-3][0-9][0-9]]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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

####### random-number ####### START
shuf -i ${_RANGE} -n 1
####### random-number ####### END
}
function __complete-random-number() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}random-number -- ${BASH_FUNK_PREFIX:--}random-number

function -random-string() {
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
      echo; echo "Usage: $__fn [OPTION]... LENGTH [CHARS]"
      echo; echo "Type '$__fn --help' for more details."
   fi

   eval $opts

   return $rc
}
function __impl-random-string() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _LENGTH _CHARS
   [ -t 1 ] && __interactive=1 || true
      for __arg in "$@"; do
      case "$__arg" in
         --) __noMoreFlags=1; __args+=("--") ;;
         -|--*) __args+=("$__arg") ;;
         -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
         *) __args+=("$__arg") ;;
      esac
   done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

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
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
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
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 12 0-9\033[22m"
            __stdout="$($__fn 12 0-9)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[0-9]{12}$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]{12}]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 8 a-zA-Z\033[22m"
            __stdout="$($__fn 8 a-zA-Z)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[a-zA-Z]{8}$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[a-zA-Z]{8}]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 10 [:alnum:]\033[22m"
            __stdout="$($__fn 10 [:alnum:])"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[[:alnum:]]{10}$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[[:alnum:]]{10}]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn 10 [:alnum:][:punct:]\033[22m"
            __stdout="$($__fn 10 [:alnum:][:punct:])"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[[:alnum:][:punct:]]{10}$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[[:alnum:][:punct:]]{10}]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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

####### random-string ####### START
local rc
env LC_CTYPE=C echo "012345678901234567890123456789" | tr -dc "$_CHARS" | head -c ${_LENGTH}

# https://stackoverflow.com/questions/19120263/why-exit-code-141-with-grep-q
rc=$?
(( rc == 141 )) && return 0 || return $rc
####### random-string ####### END
}
function __complete-random-string() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}random-string -- ${BASH_FUNK_PREFIX:--}random-string

function -test-random() {
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
function __impl-test-random() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
      for __arg in "$@"; do
      case "$__arg" in
         --) __noMoreFlags=1; __args+=("--") ;;
         -|--*) __args+=("$__arg") ;;
         -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
         *) __args+=("$__arg") ;;
      esac
   done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
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
            __optionWithValue="--"
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

####### test-random ####### START
${BASH_FUNK_PREFIX:--}entropy-available --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}fill-entropy --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}random-number --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}random-string --selftest && echo || return 1
####### test-random ####### END
}
function __complete-test-random() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-random -- ${BASH_FUNK_PREFIX:--}test-random


function -help-random() {
   local p="\033[1m${BASH_FUNK_PREFIX:--}"
   echo -e "${p}entropy-available\033[0m  -  Determines if enough entropy bits are available perform a non-blocking read from /dev/random. Exit code 1 indicates entropy pool is not sufficiently filled."
   echo -e "${p}fill-entropy [DURATION]\033[0m  -  Fills /dev/random with pseudo-random values from /dev/urandom."
   echo -e "${p}random-number RANGE\033[0m  -  Generates a random number of the given range. The range is inclusive."
   echo -e "${p}random-string LENGTH [CHARS]\033[0m  -  Prints a random string of the given length containing the given characters."
   echo -e "${p}test-random\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."
}
__BASH_FUNK_FUNCS+=( entropy-available fill-entropy random-number random-string test-random )
