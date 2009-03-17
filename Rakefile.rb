($:.unshift File.expand_path(File.join( File.dirname(__FILE__), 'lib' ))).uniq!
require 'ncurses'

Summary = 'This wrapper provides access to the functions, macros, global variables and constants ' +
          'of the ncurses library.  These are mapped to a Ruby Module named "Ncurses":  ' +
          'Functions and external variables are implemented as singleton functions of the Module Ncurses.'

# =======================
# = Gem packaging tasks =
# =======================
begin
  require 'echoe'
  
  task :package => :'package:package'
  task :install => :'package:install'
  task :manifest => :'package:manifest'
  task :compile => :'package:compile'
  namespace :package do
    Echoe.new('ncurses', Ncurses::Version) do |g|
      g.author = ['Tobias Herzke', 'Simon Kaczor', 'elliottcable']
      g.email = ['t-peters@users.berlios.de', 'skaczor@cox.net', 'Ncurses@elliottcable.com']
      g.summary = Summary
      g.url = 'http://github.com/elliottcable/ncurses'
      g.development_dependencies = ['echoe >= 3.0.2']
      g.extension_pattern = 'ext/**/extconf.rb'
      g.manifest_name = 'MANIFEST'
      g.retain_gemspec = true
      g.rakefile_name = 'Rakefile.rb'
      g.ignore_pattern = /^\.git\/|^meta\/|\.gemspec/
    end
  end
  
rescue LoadError => e
  raise e unless e.message =~ /^no such file to load -- echoe$/
  desc 'You need the `echoe` gem to package Ncurses'
  task :package
end

# =========
# = Other =
# =========
desc 'Removes all producs'
task :clobber do
  File.open '.gitignore' do |gitignore|
    gitignore.each_line do |glob|
      glob.gsub! /#.*$/, ''
      `rm -rf #{File.expand_path(File.join( File.dirname(__FILE__), glob ))}` unless glob.empty?
    end
  end
end

desc 'Check everything over before commiting'
task :aok => [:'package:manifest', :'package:package', :'package:compile']

task :ci => []
