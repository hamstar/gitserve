module GitServe

  AUTHORIZED_KEYS = "~/.ssh/authorized_keys"

  module KeyFile
    def KeyFile.add(key, user, repo)
	  key_line = "command=\"/usr/bin/gitserve #{user} #{repo} rw\",no-port-forwarding,no-X11-forwarding,no-agent-forwarding,no-pty #{key}"
	  delete_key key if find_key key
      File.open( AUTHORIZED_KEYS, 'a') {|f|
  		f.puts key_line
	  }
    end
  
    def KeyFile.find( key )
      File.readlines( AUTHORIZED_KEYS ).each do |line|
	    return line if line.include? key
	  end
	
	  false
    end
  
    def KeyFile.delete( key )
      new_contents = File.read( AUTHORIZED_KEYS ).lines.reject { |line|
	    line.include? key
	  }.join "\n"
	
   	  File.open( AUTHORIZED_KEYS, "w" ) {|f|
	    f.write new_contents
  	  }
    end
  end
end
