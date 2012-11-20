require 'gitserve/repo'
require 'gitserve/user'

module GitServe
  class Options

    attr_reader :resource, :action, :name, :args, :repo, :git_action

    def initialize(resource=nil, action=nil, name=nil, *args=nil)
      @resource, @action, @name, @args = resource, action, name, args
    end

    def set_ssh_command(cmd)
      @git_action, @repo = cmd.split
    end

    def valid?
      valid_add_repo? or
      valid_del_repo? or
      valid_add_user? or
      valid_del_user? or
      valid_allow_access? or
      valid_check?
    end

    def valid_add_repo?
      @resource == "repo" and @action == "add" and !Repo.exist? @name
    end

    def valid_del_repo?
      @resource == "repo" and @action == "del" and Repo.exist? @name
    end

    def valid_add_user?
      @resource == "user" and @action == "add" and !User.exist? @name
    end

    def valid_del_user?
      @resource == "user" and @action == "del" and User.exist? @name
    end

    def valid_allow_access?
      @resource == "repo" and @action == "allow" and Repo.exist? @name
    end

    def valid_check_access?
      @resource == "repo" and @action == "check" and User.exist? @name and Repo.exist? @repo and valid_git_action?
    end

    def valid_git_action?
      ['git-receive-pack', 'git-upload-pack'].include? @git_action
    end
  end
end
