module GitServe

  class << self

    def authorized_keys
      File.expand_path("~/.ssh/authorized_keys")
    end
  end
end