```
# list all processes running which match with search pattern
# this is used to 
#   1. check if certain process/app is running
#   2. get pattern-name for specific app as large as possible to eliminate other similar pattern names; this name will used
#   later on in script which launches/stops certain app on certain action 
pgrep -a <search-pattern>

# get id of process containing pattern
# this is used during script creation, where we want to check if certain app is already running
pgrep -f <search-pattern>

pgrep --help
```
