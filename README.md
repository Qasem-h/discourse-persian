discourse-persian
======================

You need to modify your app.yml file to get it working. Find the section where after code hooks are listed:

```ruby
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
```

and add the required lines, so the final version will be:

```ruby
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
    - exec:
        cd: /tmp
        cmd:
          - git clone https://github.com/Qasem-h/discourse-persian.git
          - cp -rT discourse-persian/ /var/www/discourse/
          - rm -rf discourse-persian
```
```
cd /var/discourse
./launcher ssh app
./reload_persian.sh
exit
./launcher restart app
```

