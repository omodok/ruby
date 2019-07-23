cmd = "bundle install --path vendor/bundle"
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )
