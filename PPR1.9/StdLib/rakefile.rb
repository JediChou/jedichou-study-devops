require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'tc_*.rb'
end
