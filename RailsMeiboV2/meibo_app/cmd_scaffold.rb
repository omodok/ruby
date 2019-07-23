cmd = "rails generate scaffold meibo shimei:string jusyo:text denwa:string"
ReturnValue = system(cmd)
system( "echo #{ReturnValue}" )