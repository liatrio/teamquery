if [ -e /webapp/prod/teamquery/TeamQuery/tmp/pids/server.pid ];
then
  echo "Server is currently running, stopping server..."
  sudo kill -9 $(cat /webapp/prod/teamquery/TeamQuery/tmp/pids/server.pid)
  sudo rm -f /webapp/prod/teamquery/TeamQuery/tmp/pids/server.pid
else
  echo "Server is not currently running..."
fi

echo "Pulling from repo"
#sudo su - centos -c "(cd /webapp/prod/teamquery/TeamQuery; git reset --hard HEAD)"
sudo su - centos -c "(cd /webapp/prod/teamquery/TeamQuery; git pull)"

echo "Checking for dependency updates"
sudo su - centos -c "(cd /webapp/prod/teamquery/TeamQuery; bundle install)"

echo "Migrating db"
sudo su - centos -c "(cd /webapp/prod/teamquery/TeamQuery; rake db:migrate)"

sudo su -c "(cd /webapp/prod/teamquery/TeamQuery; /home/centos/.rbenv/shims/rails s -d -b 0.0.0.0 -p 80 -e production)"
echo "Started server in prod screen"
