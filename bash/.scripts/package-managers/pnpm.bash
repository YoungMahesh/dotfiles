export PNPM_HOME="/home/mahesh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm self-update

# check path of pnpm: echo $PNPM_HOME
# pnpm -v
# which pnpm
# alias pn='pnpm'

