import datetime


# Load autoconfig.yml
config.load_autoconfig()


today = datetime.datetime.now()

def bind_chained(key, *commands):
    config.bind(key, ' ;; '.join(commands))

# Keys binding
bind_chained(',,', 'open https://wiki.archlinux.org/')
bind_chained(',m', 'open https://mail.google.com/')
bind_chained(',d', 'open https://drive.google.com/drive/my-drive')
bind_chained(',w', 'open https://web.whatsapp.com/')

# Open google desktop


bind_chained(',c',
             'tab-only',
             'open https://mail.google.com/',
             'open -t https://web.whatsapp.com/',
             'reload',
             'open -t https://drive.google.com/drive/my-drive',
             'open -t https://calendar.google.com/calendar/r/week',
             'open -t https://calendar.google.com/calendar/r/month',
             'open -t https://www.evernote.com/Home.action?login=true',
             'open -t https://trello.com/eyalshukrun/boards',
            )
