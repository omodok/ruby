cmd = "rails generate active_record:session_migration"
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )