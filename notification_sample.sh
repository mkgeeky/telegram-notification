#!/bin/bash
# mkgeeky -> https://github.com/mkgeeky/telegram-notification
die() { echo "$*" 1>&2 ; exit 1; }
LOGFILE="notification.log"
log() { echo "[`date +"%Y-%m-%d %T"`]: $*" >> $LOGFILE; }

TELEGRAM_USER_ID=
TELEGRAM_BOT_ID=

Client=$1
TorrentName=$2

if [ -z "$TorrentName" ]
then
  die "Empty TorrentName"
fi
if [ -z "$TELEGRAM_BOT_ID" ] && [ -z "$TELEGRAM_USER_ID" ]
then
  die "Go your settings once again"
fi

if [ "$Client" = "autobrr" ]
then
  TEXT="autobrr has grapped: $TorrentName"
  log "$TEXT"
fi
if [ "$Client" = "rtorrent" ]
then
  TEXT="rtorrent has finished downloading: $TorrentName"
  log "$TEXT"
fi

if [ -n "$TEXT" ] && [ -n "$TELEGRAM_BOT_ID" ] && [ -n "$TELEGRAM_USER_ID" ]
then
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_ID/sendMessage" -d chat_id=$TELEGRAM_USER_ID -d text="$TEXT"
fi
