# -*- coding: utf-8 -*-
# У вас должна быть настроена авторизация ssh по сертификатам

set :application, "bsuir"
set :default_environment, {
  'PATH' => "/usr/local/bin:/usr/bin:/bin:/usr/games:/var/lib/gems/1.8/bin"
}
# настройка системы контроля версий и репозитария, по умолчанию - git, если используется иная система версий, нужно изменить значение scm
set :scm, :git
set :repository,  "git://github.com/Dreamfa11/bsuir-project.git"

set :user, "hosting_dreamfall"
set :use_sudo, false
set :deploy_to, "/home/hosting_dreamfall/projects/bsuir"

role :web, "lithium.locum.ru"   # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"   # This may be the same as your `Web` server
role :db,  "lithium.locum.ru", :primary => true # This is where Rails migrations will run

# эта секция для того, чтобы вы не хранили доступ к базе в системе контроля версий. Поместите dayabase.yml в shared,
# чтобы он копировался в нужный путь при каждом выкладывании новой версии кода
# так лучше с точки зрения безопасности, но если не хотите - прсото закомментируйте этот таск

after "deploy:update_code", :run_bundler
after "deploy:update_code", :copy_database_config
after "deploy:update_code", :copy_app_config
after "deploy:update_code", :precompile_assets

task :precompile_assets, roles => :app do
  run "cd #{release_path} && bundle exec rake assets:precompile"
end

task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

task :run_bundler, :roles => :web do
  run "cd #{release_path} && bundle install --deployment --path ~/.gem"
end

task :copy_app_config, roles => :app do
  db_config = "#{shared_path}/app_config.yml"
  run "cp #{db_config} #{release_path}/config/app_config.yml"
end

set :unicorn_rails, "/var/lib/gems/1.8/bin/unicorn_rails"
set :unicorn_conf, "/etc/unicorn/bsuir.dreamfall.rb"
set :unicorn_pid, "/var/run/unicorn/bsuir.dreamfall.pid"

# - for unicorn - #
namespace :deploy do
  task :migrate, :roles => :db, :only => { :primary => true } do
    migrate_env = fetch(:migrate_env, "")
    migrate_target = fetch(:migrate_target, :latest)

    directory = case migrate_target.to_sym
      when :current then current_path
      when :latest  then latest_release
      else raise ArgumentError, "unknown migration target #{migrate_target.inspect}"
      end

    run "cd #{directory} && bundle exec #{rake} RAILS_ENV=#{rails_env} #{migrate_env} db:migrate"
  end
  desc "Start application"
  task :start, :roles => :app do
    run "bundle exec #{unicorn_rails} -Dc #{unicorn_conf}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || bundle exec #{unicorn_rails} -Dc #{unicorn_conf}"
  end
end
