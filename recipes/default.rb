#
# Cookbook Name:: spf13-vim
# Recipe:: default
#
# Copyright 2014, Brand-Karma
#

node[:spf13_vim][:users].each do |current_user|
    bash "install spf13-vim" do
        cwd "/home/#{current_user}/"
        user "#{current_user}"
        code <<-EOH
            curl http://j.mp/spf13-vim3 -L -o spf13-install.sh
            /bin/bash spf13-install.sh
        EOH
        not_if "test -d ~/.spf13-vim-3"
    end
end
