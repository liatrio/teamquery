if [ -e /webapp/dev/teamquery/TeamQuery/tmp/pids/server.pid ];
then
  echo "Dev server is currently running, stopping server..."
  sudo kill -9 $(cat /webapp/dev/teamquery/TeamQuery/tmp/pids/server.pid)
  sudo rm -f /webapp/dev/teamquery/TeamQuery/tmp/pids/server.pid
else
  echo "Dev server is not currently running..."
fi
if [ -e /webapp/prod/teamquery/TeamQuery/tmp/pids/server.pid ];
then
  echo "Prod server is currently running, stopping server..."
  sudo kill -9 $(cat /webapp/prod/teamquery/TeamQuery/tmp/pids/server.pid)
  sudo rm -f /webapp/prod/teamquery/TeamQuery/tmp/pids/server.pid
else
  echo "Prod server is not currently running..."
fi
