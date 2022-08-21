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

---- Connects to "imap1.mail.server", as user "user1" with "secret1" as
-- password is saved in a text
status, password = pipe_from('pass Email/ritchie@macapinlac.com')
account = IMAP {
    server = 'imap.gmail.com',
    username = 'ritchie@macapinlac.com',
    password = password, 
    ssl = "tls1"
}

------------------
----  Rules     --
------------------

-- https://syshero.org/2016-06-19-imapfilter-cleaning-up-your-mailbox-and/
-- remove meeting invites older than 90 days
cal_delete_older  = 90
messages = account["[Gmail]/All Mail"]:contain_field("sender", "calendar-notification@google.com") * account["[Gmail]/All Mail"]:is_older(cal_delete_older)
messages:move_messages(account["[Gmail]/Trash"])

-- Newsletters
newsletters = account.INBOX:contain_to('ritchie+newsletter@macapinlac.com') +
              account.INBOX:contain_to('ritchie+newsletters@macapinlac.com') +
              account.INBOX:contain_from('carl@carlpullein.com') +
              account.INBOX:contain_from('crew@morningbrew.com')

newsletters:move_messages(account['zzz - Automated/Newsletters'])

-- ESS related
ess_volunteer = account.INBOX:contain_from('no-reply@onvolunteers.com')
ess_volunteer:move_messages(account['ESS/Volunteer Emails'])

-- ess_grade6  = account['ESS']:contain_bcc('grade6_parents@ess.vancouver.bc.ca')
-- ess_grade6:move_messages(account['ESS/Classroom News/Grade 6 - Mackenzee'])

-- shopping / promotions
shopping    = account.INBOX:contain_to('ritchie+promotions@macapinlac.com') +
              account.INBOX:contain_to('ritchie+promotion@macapinlac.com') +
              -- Ollie Quinn
              account.INBOX:contain_from('latest@email.oqspecs.com')

shopping:move_messages(account['zzz - Automated/Shopping'])

-- Village at Walker Lakes related
villagewl   = account.INBOX:contain_from('Pagnihotri@kdmmgmt.ca')
villagewl:move_messages(account['zzz - Village at Walker Lakes/KDM Management'])

-- random banking stuff (sometimes important)
banking     = account.INBOX:contain_from('NO_REPLY@communications.bpi.com.ph')
banking:move_messages(account['zzz - Automated/Banking'])

-- Jobs!
jobs        = account.INBOX:contain_from('jobs-noreply@linkedin.com') +
              account.INBOX:contain_from('hello@creativeclass.co')

jobs:move_messages(account['zzz - Automated/Jobs'])
-- Ugh, just delete it!
ugh         = account.INBOX:contain_from('e-service@acmsmail.china-airlines.com')
ugh:delete_messages()
