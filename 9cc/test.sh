#!/bin/zsh
set -e

assert() {
  local expected="$1"
  local input="$2"

  echo "------- Compiling input: $input"
  ./9cc "$input" > tmp.s
  cat tmp.s
  echo "------ Assenbly generated above"

  cc -o tmp tmp.s

  [[ -x ./tmp ]] || { echo "❌ Executable not found: tmp"; exit 1; } 

  set +e
  ./tmp
  local exit_code="$?"
  set -e

  if [[ "$exit_code" -eq "$expected" ]]; then
    echo "$input => $exit_code ✅"
  else
    echo "$input => $expected expected, but got $exit_code ❌"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 21 "5+20-4"
echo "✅ All tests passed!"
