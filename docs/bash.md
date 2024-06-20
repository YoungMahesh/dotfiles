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

find . -type f -size +20MB -delete  # delete files >20MB from current directory recursively
find . -maxdepth 1 -type f -size -20kb # list files <20kb from current directory 
```
