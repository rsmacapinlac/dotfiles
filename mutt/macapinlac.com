color status green default
set from = "ritchie@macapinlac.com"
set realname = "Ritchie Macapinlac"

set smtp_url = "smtp://ritchie\@macapinlac.com@smtp.gmail.com:587"
set imap_user = "ritchie@macapinlac.com"

set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
