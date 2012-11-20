module GitServe
  class User
    def self.exist?(name)
      File.read( GitServe.user_lib ) =~ /#{name}/
    end
  end
end
