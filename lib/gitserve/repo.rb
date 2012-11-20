module GitServe
  class Repo
    def self.exist?(repo)
      File.directory?(@repo) and File.directory?("#{@repo}/HEAD")
    end

    def self.is_repo?(repo)
      File.directory?(@repo) and File.directory?("#{@repo}/HEAD")
    end

    def add(repo)
      raise InvalidRepositoryError self.is_repo? repo
      name = Pathname.new(repo).basename
      line = "#{name} #{repo}: "
      File.open(GitServe.repo_list, 'a') {|f|
        f.puts line
      }
    end
  end
end
