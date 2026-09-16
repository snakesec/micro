
strip micro

if [ $(uname -m | grep 'x86_64') ]; then
  cp -Rf micro-x86_64 /opt/ANDRAX/bin/
else
  cp -Rf micro-aarch64 /opt/ANDRAX/bin/
fi

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Copy PACKAGE... PASS!"
else
  # houston we have a problem
  exit 1
fi

source /opt/AFOS/afos_shell_functions.sh

check_package_installed_apt "man-db"

if [ $? -eq 1 ]
then
  # Result is OK! Just continue...
  echo "Man already installed... PASS!"
else
  # Install man-db using apt
  apt update
  apt install --no-install-recommends -y man-db
fi

cp micro.1 /usr/share/man/man1/

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Copy man file... PASS!"
else
  # houston we have a problem
  exit 1
fi

mandb
