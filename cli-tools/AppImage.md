### AppImage shortcut on command-line

```
# put .AppImage file to ~/apps (you can choose any directory you want)

# make it executable
chmod +x <name>.AppImage

# create executable file in directory which part of $PATH
# e.g. put following code in ~/.local/bin/<name1>
!/bin/sh
/home/mahesh/apps/<name>.AppImage --no-sandbox

# make $PATH file executable
chmod +x ~/.local/bin/<name1>

# open new terminal window, run app
<name1>

# check path of app
which <name1>
```
