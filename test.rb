package 'httpd' do
    action :install
end

service "httpd" do
  action :enable
end

file '/etc/motd' do
    owner 'root'
    group 'root'
    mode '0644'
    content 'Hello world'
end

timezone 'set_timezone' do
  timezone      'Europe/London'
  action        :set
end

user 'gary.brett' do
  comment 'Garys user account'
  uid 4321
  gid 'somegroup'
  home '/home/gary.brett'
  shell '/bin/bash'
  password '$GARYS_HASHED_PASSWORD'
end

cron 'test_test' do
  action :create
  minute '45'
  hour '5'
  weekday '*'
  user 'gary.brett'
  mailto 'gary.brett@somewhere.com'
  home '/hone/garybrett'
  command "/some/test/script.sh"
end
