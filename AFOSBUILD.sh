make build

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Make build... PASS!"
else
  # houston we have a problem
  exit 1
fi

strip micro

cp -Rf micro /opt/ANDRAX/bin

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Copy PACKAGE... PASS!"
else
  # houston we have a problem
  exit 1
fi

chown -R andrax:andrax /opt/ANDRAX/bin
chmod -R 755 /opt/ANDRAX/bin
