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

status, password = pipe_from('pass Email/rsmacapinlac@boogienet.com')
account = IMAP {
    server = 'rcentral503.webserversystems.com',
    username = 'rsmacapinlac@boogienet.com',
    password = password 
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
