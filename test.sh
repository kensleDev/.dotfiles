
PRINT() {
  echo "-----"
  echo "-> $1"
  echo "-----"
}

ERR() {
  PRINT "-> Err! file: $2 line: $3 -> $1
}

install_homebrew() {
  { 
    false
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" &&
  } || { 
    ERR "instal : Homebrew" $__EXCEPTION_SOURCE__ $__EXCEPTION_LINE__
  }
}

