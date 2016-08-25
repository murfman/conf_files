#!/usr/bin/env fish

# lock screen with icon and blurring
# requires scrot, imagemagick and i3lock
# 25.05.2016 - skr0tm at protonmail dot com

set icon $HOME/.xlock/icon.png
set tmp '/tmp/scrot.png'

trap finish SIGHUP SIGINT SIGTERM

function screen
 scrot $tmp
end

function blur_image
  screen
  if test -e $tmp
    echo 'Picture taken...'
    convert $tmp -blur 0x8 -define filter:sigma=2 $tmp
    echo "Blurrin' reality..."
    convert $tmp $icon -gravity center -composite -matte $tmp
    echo "Adding icon..."
    return 0
  else
    return 1
  end
end

function finish
  echo "Cleaning up..."
  rm $tmp
  echo "Cleaned up, exiting"
end


function locking
    echo "Locking!"
    i3lock -u -i $tmp
end

blur_image
if test $status -eq 0
  echo "Image succesfully converted!"
  locking;
  finish
else
  echo "Something went wrong..."
end
