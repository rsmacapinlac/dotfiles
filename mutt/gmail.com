color status red default
set from = "rsmacapinlac@gmail.com"
set realname = "Ritchie Macapinlac"

set smtp_url = "smtp://rsmacapinlac\@gmail.com@smtp.gmail.com:587"
set imap_user = "rsmacapinlac@gmail.com"

set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
