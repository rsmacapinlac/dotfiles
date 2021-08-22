
unmailboxes *
set imap_user = "ritchie@macapinlac.com"
set smtp_url = "smtp://ritchie@macapinlac.com@smtp.gmail.com:587/"

set from = "ritchie@macapinlac.com"
set realname = "Ritchie"
set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"

set ssl_starttls = yes
set ssl_force_tls = yes

set header_cache = ~/.mutt/macapinlac.com/cache/headers
set message_cachedir = ~/.mutt/macapinlac.com/cache/bodies
set certificate_file = ~/.mutt/macapinlac.com/certificates

# source "gpg -d ~/.mutt/passwd.macapinlac.com.gpg |"
source ~/.mutt/pwd.account.macapinlac.com
