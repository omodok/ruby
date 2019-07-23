cmd = "rails new book_store --skip-bundle" 
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )