cmd = "rails db:migrate"
ReturnValue = system(cmd)
system( "echo #{ReturnValue}" )