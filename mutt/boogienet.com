color status blue default
set from = "rsmacapinlac@boogienet.com"
set realname = "Ritchie Macapinlac"

set smtp_url = "smtp://rsmacapinlac\@boogienet.com@smtp.gmail.com:587"

set imap_user = "rsmacapinlac@boogienet.com"
set imap_pass = ""
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
