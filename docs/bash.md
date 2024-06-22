- start browsing large file
  - from top to bottom: `less <fileName>`
  - from bottom to top: `less +G <fileName>`
- print lines
  - all: `cat <fileName>` || `head <fileName>` || `tail <fileName>`
  - first 5: `head -n 5 <fileName>`
  - last 5: `tail -n 5 <fileName>`


```bash
# find
find .  # recursively list all files in current directory
# -maxdepth 1   # for subdirectory depth, 1 = only current directory, 2 == current directory and it's direct sub-directories, etc
# -type f   - find only files
# -size -20k  - '-' represents less than, '+' represents larger than, 'k' == kilo-bytes, 'M' == mega-bytes
# -delete  - delete files

find . -type f -size +20M -delete  # delete files >20MB from current directory recursively
find . -maxdepth 1 -type f -size -20k # list files <20kb from current directory 

find . -type f -exec du -sh {} \;  # print files alonwith file-size
find . -type f -exec du -sh {} \ | grep 343;  # filter list with grep 




# ------------------ collect file names --------------------------------------------------   
find . -type f -size +7M | awk -F'/' '{print substr($NF, 1, length($NF)-4)}'
find . -type f | awk -F'/' '{print substr($NF, 1, length($NF)-4)}'
# 1. output of find cmd (find . -type f)
#./153.gif
#./116.gif

# 2. |: This is a pipe symbol (|), which takes the output from the find command and passes it as input to awk.
# 3. awk -F'/': This sets the field separator (-F) for awk to /, so it will split each line of input at each /.
# 4. '{print substr($NF, 1, length($NF)-4)}':
#   $NF refers to the last field in the line (which, after splitting by /, will be the filename like 153.gif).
#   substr($NF, 1, length($NF)-4): This extracts a substring starting from the first character (1) of $NF and with a length that is 4 characters 
#       less than the total length of $NF. This effectively removes the last 4 characters (.gif in this case).
#   So, awk will print only the part of the filename you're interested in (e.g., 153 from ./153.gif).

# ---------------------------------------------------------------------------------------------------------------------------------- 
```




