```

# REMEMBER
# The -f flag makes pgrep search the full command line (including arguments), not just the process name.
# Without -f, pgrep only matches the process name (the executable name).

# pgrep <app-name> to list IDs of running processes by the app
pgrep firefox 

# get id of process containing search-pattern
# this is used during script creation, where we want to check if certain app is already running
pgrep -f <search-pattern>
pgrep -fc <search-pattern> # get count of processes which show on `-f`

# list all processes running which match with search-pattern
# this is used to 
#   1. check if certain process/app is running
#   2. get pattern-name for specific app as large as possible to eliminate other similar pattern names; this name will used
#   later on in script which launches/stops certain app on certain action 
pgrep -a <search-pattern>
pgrep -fa <search-pattern>

pgrep --help
```
