require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test/lib"
  t.ruby_opts << "-rhelper"
  t.test_files = FileList['test/**/test_*.rb']
end

task "build" => "date_epoch"
task "date_epoch" do
  ENV["SOURCE_DATE_EPOCH"] = IO.popen(%W[git -C #{__dir__} log -1 --format=%ct], &:read).chomp
end

ENV['RUBYOPT'] = "-w"

require 'rake/extensiontask'
Rake::ExtensionTask.new("mathn/complex")
Rake::ExtensionTask.new("mathn/rational")

task :default => [:compile, :test]
