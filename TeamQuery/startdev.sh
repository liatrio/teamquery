if [ -e /webapp/dev/teamquery/TeamQuery/tmp/pids/server.pid ];
then
  echo "Server is currently running, stopping server..."
  sudo kill -9 $(cat /webapp/dev/teamquery/TeamQuery/tmp/pids/server.pid)
  sudo rm -f /webapp/dev/teamquery/TeamQuery/tmp/pids/server.pid
else
  echo "Server is not currently running..."
fi

echo "Pulling from repo"
sudo su - centos -c "(cd /webapp/dev/teamquery/TeamQuery; git reset --hard HEAD)"
sudo su - centos -c "(cd /webapp/dev/teamquery/TeamQuery; git pull)"

echo "Checking for dependency updates"
sudo su - centos -c "(cd /webapp/dev/teamquery/TeamQuery; bundle install)"

echo "Migrating db"
sudo su - centos -c "(cd /webapp/dev/teamquery/TeamQuery; rake db:migrate)"

sudo su - centos -c "(cd /webapp/dev/teamquery/TeamQuery; rails s -d -b 0.0.0.0)"
echo "Started server in prod screen"
