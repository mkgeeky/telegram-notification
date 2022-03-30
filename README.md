## What is this?

A simple bash file to send notifications to telegram :muscle:

## Needs

- A Telegram bot [Guide](https://core.telegram.org/bots#3-how-do-i-create-a-bot)
- The bots ID (**Look for "_Use this token to access the HTTP API:_" in the message from _BotFather_**)
- Your own telegram ID [Guide](https://www.alphr.com/telegram-find-user-id/)

## Installation

* Clone this repo to your server
`git clone https://github.com/mkgeeky/telegram-notification.git`
* Rename **notification_sample.sh** to **notification.sh**
`mv notification_sample.sh notification.sh`
* Make notification.sh executeable
`chmod +x /PathTo/notification.sh`
* Edit notification.sh with the IDs from above
<br>TELEGRAM_BOT_ID = BOT ID
<br>TELEGRAM_USER_ID = YOUR ID

### rTorrent
Add following line to .rtorrent.rc

`method.set_key = event.download.finished,notify_me,"execute=/PathTo/notification.sh,rtorrent,$d.name="`

Then restart rtorrent

### autobrr
* Under your **Filters** go to **Actions** and create a new action.
* Select **Exec**
* Call in whatever you want.
* In **Command** add **/PathTo/notification.sh**
* In **Arguments** add **autobrr {{ .TorrentName }}**
* Remember to click **save** :grin:

From now on: everything rtorrent has finished download OR autobrr graps a torrent - you get a notification in Telegram :slightly_smiling_face:
