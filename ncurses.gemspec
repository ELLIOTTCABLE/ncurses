# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ncurses}
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tobias Herzke, Simon Kaczor, elliottcable"]
  s.date = %q{2009-03-17}
  s.description = %q{This wrapper provides access to the functions, macros, global variables and constants of the ncurses library.  These are mapped to a Ruby Module named "Ncurses":  Functions and external variables are implemented as singleton functions of the Module Ncurses.}
  s.email = ["t-peters@users.berlios.de", "skaczor@cox.net", "Ncurses@elliottcable.com"]
  s.extensions = ["ext/ncurses/extconf.rb"]
  s.extra_rdoc_files = ["README.markdown", "ext/ncurses/extconf.rb", "ext/ncurses/form_wrap.c", "ext/ncurses/form_wrap.h", "ext/ncurses/menu_wrap.c", "ext/ncurses/menu_wrap.h", "ext/ncurses/ncurses_wrap.c", "ext/ncurses/ncurses_wrap.h", "ext/ncurses/panel_wrap.c", "ext/ncurses/panel_wrap.h", "lib/ncurses/etc.rb", "lib/ncurses.rb"]
  s.files = ["README.markdown", "Rakefile.rb", "examples/example.rb", "examples/form.rb", "examples/form2.rb", "examples/hello_ncurses.rb", "examples/LICENSES_for_examples", "examples/rain.rb", "examples/read_line.rb", "examples/tclock.rb", "examples/test_scanw.rb", "ext/ncurses/extconf.rb", "ext/ncurses/form_wrap.c", "ext/ncurses/form_wrap.h", "ext/ncurses/menu_wrap.c", "ext/ncurses/menu_wrap.h", "ext/ncurses/ncurses_wrap.c", "ext/ncurses/ncurses_wrap.h", "ext/ncurses/panel_wrap.c", "ext/ncurses/panel_wrap.h", "lib/ncurses/etc.rb", "lib/ncurses.rb", "license.txt", ".manifest", "ncurses.gemspec"]
  s.homepage = %q{http://github.com/elliottcable/ncurses}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ncurses", "--main", "README.markdown"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{ncurses}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{This wrapper provides access to the functions, macros, global variables and constants of the ncurses library.  These are mapped to a Ruby Module named "Ncurses":  Functions and external variables are implemented as singleton functions of the Module Ncurses.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
    else
      s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
  end
end
