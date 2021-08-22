unmailboxes *
set imap_user = "rsmacapinlac@boogienet.com"
set smtp_url = "smtp://rsmacapinlac@boogienet.com@smtp.gmail.com:587/"

set from = "rsmacapinlac@boogienet.com"
set realname = "Ritchie"
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"

set ssl_starttls = yes
set ssl_force_tls = yes

set header_cache = ~/.mutt/boogienet.com/cache/headers
set message_cachedir = ~/.mutt/boogienet.com/cache/bodies
set certificate_file = ~/.mutt/boogienet.com/certificates

# source "gpg -d ~/.mutt/passwd.boogienet.com.gpg |"
source ~/.mutt/pwd.account.boogienet.com
