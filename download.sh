#!/bin/bash

# Note: download link is not available anymore!!
# Source http://www.gamebase64.com/game.php?id=23152&d=42
$dlfile="KALLEKOT_23152_01.zip"

wget ftp://8bitfiles.net/gamebase_64/Games/k/$dlfile
unzip $dlfile -d src
rm $dlfile
