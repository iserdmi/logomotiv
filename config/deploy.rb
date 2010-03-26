set :application, "Logomotiv"
set :repository,  "git@github.com:man2d/logomotiv.git"

set :scm, :git


set :branch, "master"
#set :scm_passphrase, "p@ssw0rd" #This is your custom users password
#set :user, "deployer"
default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true } 
set :repository,  "git@github.com:vanpelt/rails-app.git"
set :scm, "git"
set :scm_passphrase, "p@ssw0rd" #This is your custom users password
set :user, "deployer"

set :domain, "logomotiv.boozinga.ru"
role :web, "logomotiv.boozinga.ru"
#role :app, "logomotiv.boozinga.ru"
set :user, "logomotiv"
set :password, "81TYcbAi"
set :app_dir, "/Users/andreika/logomotiv"
#set :app_dir, "/var/www/#{user}/data/www/#{domain}" # /home/myuser/myproject/
set :deploy_to, "#{app_dir}/deploy"
set :use_sudo, false                          # Your HTTP server, Apache/etc
                          # This may be the same as your `Web` server
#role :db,  "mysql", :primary => true # This is where Rails migrations will run
#role :db,  "mysql"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
