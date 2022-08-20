---------------
----  Options  --
-----------------
--
options.timeout = 120
options.subscribe = true
options.create = true
options.expunge = true

------------------
----  Accounts  --
------------------

-- Utility function to get IMAP password from file
function get_imap_password(file)
  local home = os.getenv("HOME")
  local file = home .. "/.imapfilter/" .. file
  local str = io.open(file):read()
  return str;
end

---- Connects to "imap1.mail.server", as user "user1" with "secret1" as
-- password is saved in a text
account = IMAP {
    server = 'rcentral503.webserversystems.com',
    username = 'rsmacapinlac@boogienet.com',
    password = get_imap_password(".boogienet.com"),
    ssl = "tls1"
}

account.INBOX:check_status()

------------------
----  Rules     --
------------------

-- Hosting Alerts
alerts = account.INBOX:contain_from('wordpress@alifewithgusto.com') +
         account.INBOX:contain_from('wordpress@boogienet.com')

alerts:move_messages(account['zzz - Automated.Hosting Plugin Alerts'])


-- Move for N8N Automations
weekly = account.INBOX:contain_from('support@boogienet.com') *
         account.INBOX:contain_subject('Weekly report for All Websites')

weekly:move_messages(account['zzz - Automations.Weekly'])

-- Ugh, just delete it!
-- ugh         = account.INBOX:contain_from('e-service@acmsmail.china-airlines.com')
-- ugh:delete_messages()
