#!/bin/bash
# A simple script to reload translations from github

cd /tmp
git clone https://github.com/Qasem-h/discourse-persian.git
cp -rT discourse-persian/ /var/www/discourse/
cp -f discourse-persian/reload_persian.sh /root/reload_persian.sh
chmod +x /root/reload_persian.sh
rm -rf discourse-persian
cd /var/www/discourse
sudo -u discourse RAILS_ENV=production bundle exec rake assets:clobber assets:precompile
