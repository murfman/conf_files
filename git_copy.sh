#!/bin/bash

echo "*** Script for Git Push ***"
echo
echo "Run Time: $(date) @ $(hostname)"

# Define Variables
h1="/home/brian"
c1="/home/brian/src/conf_files"
cp="cp -u"

# Copying Files
echo "*** Copying Files ***"

# Single files
$cp $h1/src/git_copy.sh $c1
$cp $h1/.Xresources $c1
$cp $h1/Pictures/busy_scrot.png $c1
$cp $h1/Pictures/Wallpapers/wtf.jpg $c1
$cp $h1/Pictures/Wallpapers/ocean_waves.jpg $c1

# Directories
$cp -r $h1/.config/dunst $c1/config
$cp -r $h1/.config/i3 $c1/config
$cp -r $h1/.config/gsimplecal $c1/config
$cp -r $h1/.config/rofi-surfraw $c1/config
$cp -r $h1/.config/surfraw $c1/config
$cp -r $h1/.config/ranger $c1/config
$cp -r $h1/.config/hangups $c1/config
$cp -r $h1/.moc $c1
$cp -r $h1/.config/terminator $c1/config
$cp -r $h1/.config/zathura $c1/config
$cp -r $h1/.Xresources $c1
$cp -r $h1/.moc/config $c1/moc/config


sleep 2

# Git Operations
echo "*** Starting Git Stuff Now @ $(date) ***"
cd $h1/src/conf_files
git add .
sleep 1

# # Git commit Function
read -p "Enter the commit note (keep it brief)  " note
git commit -m "$note"
sleep 2

# # Git Push Command
git push origin master
sleep 3

# Finishing up
echo "*** I should be finished now. Ended at $(date) ***"
