# MPD FTW
# This function will invoke a meny that lets you select What kind of search you wish to do.
# It's an easy shortcut for the other methods, in case you're lazy to type them ;)
fm() {
  local list
  list=$(echo 'Any' && echo 'Genre' && echo 'Artist' && echo 'Albums' && echo 'Clear Playlist')
  rm -f /tmp/fileTypes
  echo $list > /tmp/fileTypes

  type=$(cat /tmp/fileTypes | \
    fzf-tmux --query="" --reverse --select-1 --exit-0 ) || return 1
  case `echo $type` in
    'Genre') fmg ${@};;
    'Artist') fmaa ${@};;
    'Albums') fma ${@};;
    'Clear Playlist') fmc;;
    *) fms ${@};;
  esac
  rm -f /tmp/fileTypes
}

# Search for any Song
fms() {
  local song
  song=$(mpc ${@} search any "" | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0) || return 1
  mpc ${@} clear;
  [ -n "$song" ] && mpc ${@} add """$song"""; mpc ${@} play; mpc ${@} next
  echo $FMOPTS
  # fm
}

# Search Genres
fmg() {
  local genre
  genre=$(mpc ${@} list genre | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0) || return 1
  mpc ${@} clear;
  [ -n "$genre" ] && mpc ${@} search genre $genre | mpc ${@} insert; mpc ${@} play
  fm
}

# Search Artists
fmaa() {
  local artist
  artist=$(mpc ${@} list artist | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0) || return 1
  mpc ${@} clear;
  [ -n "$artist" ] && mpc ${@} search artist $artist | mpc ${@} insert; mpc ${@} play
  fm
}

# Search Albums
fma() {
  local albums
  album=$(mpc ${@} list album | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0) || return 1
  mpc ${@} clear;
  [ -n "$album" ] && mpc ${@} search album $album | mpc ${@} insert; mpc ${@} play
  fm
}

# Clear the playlist and invoke the fm()
fmc() {
  mpc ${@} clear
  fm
}
