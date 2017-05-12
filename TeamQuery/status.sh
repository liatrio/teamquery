if [ -e /webapp/dev/teamquery/TeamQuery/tmp/pids/server.pid ];
then
  echo "Dev server is currently running"
else
  echo "Dev server is not currently running"
fi
if [ -e /webapp/prod/teamquery/TeamQuery/tmp/pids/server.pid ];
then
  echo "Prod server is currently running"
else
  echo "Prod server is not currently running"
fi
