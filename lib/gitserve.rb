module GitServe

  class InvalidRepositoryError < StandardError; end

  class << self

    def authorized_keys
      File.expand_path("~/.ssh/authorized_keys")
    end

    def user_list
      File.expand_path("~/.gitserve/users")
    end

    def repo_list
      File.expand_path("~/.gitserve/repos")
    end
  end
end
