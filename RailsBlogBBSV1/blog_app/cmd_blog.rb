cmd = "rails g model blog" 
ReturnValue = system(cmd)
system( "echo #{ReturnValue}" )