require 'gli'

include GLI::App

program_desc 'Time to fuzz the web'

pre do |global_options,command,options,args|
  
end

desc 'Signal that the fuzzer should use hard-coded authentication for a specific application (e.g. dvwa). Optional'
flag ['custom-auth']

#Create a discover file and include it 
desc 'Output a comprehensive, human-readable list of all discovered inputs to the system. Techniques include both crawling and guessing.'
command :discover do |c|
  desc 'Newline-delimited file of common words to be used in page guessing and input guessing. Required.'
  c.flag ['common-words']
  


end

#Create a test file and include it
desc 'Discover all inputs, then attempt a list of exploit vectors on those inputs. Report potential vulnerabilities.'
command :test do |c|
	
  desc 'Newline-delimited file of common exploits to vulnerabilities. Required.'
  c.flag ['vectors']

  desc 'Newline-delimited file data that should never be leaked. Its assumed that this data is in the applications database (e.g. test data), but is not reported in any response. Required'
  c.flag ['sensitive']

  desc 'When off, try each input to each page systematically.  When on, choose a random page, then a random input field and test all vectors. Default: false.'
  c.flag ['random']

  desc ' Number of milliseconds considered when a response is considered "slow". Default is 500 milliseconds'
  c.flag ['slow']


end

exit run(ARGV)