ncurses <img alt='Maintenance status' src="https://img.shields.io/badge/maintained%3F-no!-red.svg?style=flat"><img src="http://elliottcable.s3.amazonaws.com/p/8x8.png"><a target="_blank" href="https://rubygems.org/gems/elliottcable-ncurses"><img alt='RubyGem downloads' src="https://img.shields.io/gem/dt/elliottcable-ncurses.svg?style=flat"></a><img src="http://elliottcable.s3.amazonaws.com/p/8x8.png"><a target="_blank" href="license.txt"><img alt='Open-source licensing details' src="https://img.shields.io/badge/license-LGPL_v2.1-blue.svg?style=flat"></a><img src="http://elliottcable.s3.amazonaws.com/p/8x8.png"><a target="_blank" href="http://ell.io/IRC"><img alt='Chat on Freenode' src="https://img.shields.io/badge/chat-IRC-blue.svg"></a><img src="http://elliottcable.s3.amazonaws.com/p/8x8.png"><a target="_blank" href="http://twitter.com/ELLIOTTCABLE"><img alt='Twitter followers' src="https://img.shields.io/twitter/follow/ELLIOTTCABLE.svg?style=flat&label=followers&color=blue"></a>
=======
This is a RubyGem installation of Tobias Herzke's [ncurses-ruby][].
It has been modified slightly in various ways, and is intended to continue the
life of the otherwise apparently defunct project.

Since it is now on [GitHub][], feel free to fork and contribute to the project, it
would be much appreciated.

  [ncurses-ruby]: http://ncurses-ruby.berlios.de/
                  "ncurses-ruby's homepage"
  [GitHub]:       http://github.com/
                  "GitHub, code sharing site extraordinaire"

Installation
------------
The simplest way to install this gem is via GitHub's gem repository. First,
you have to add this repository to your RubyGem sources, if you haven't
already:
    
    gem sources -a http://gems.github.com
    
Next, you can simply install the gem directly from my repository:
    
    gem install elliottcable-ncurses
    
There have been reports of the gem failing to build on some systems. This will
be investigated in more detail at a later date, but for now, I’ll provide the
`./configure` line I know to work on my Mac OS X 10.6 Snow Leopard system:
    
    ./configure --prefix=/usr/local \
      --without-cxx --without-cxx-binding --without-ada --without-progs --without-curses-h \
      --with-shared --without-debug \
      --enable-widec --enable-const --enable-ext-colors --enable-sigwinch --enable-wgetch-events \
    && make
    
Contributing
------------
If you're more interested in the project, and desire to work with its sources,
you can clone them using [git][]:
    
    git clone git://github.com/elliottcable/ncurses.git elliottcable-ncurses
    
There are rake tasks for compiling and building the source, using [Echoe][].
You'll need to install it to build and compile this gem:
    
    gem install echoe
    rake package:compile # Compiles the C extensions into lib/
    rake package:package # Packages the RubyGem into pkg/
    rake package:install # Packages the RubyGem and `sudo gem install`s it
    rake -T              # To list other tasks
    
There are no specs as of yet (ncurses-ruby never had any, and I don't
currently have the time to write an entire test suite for this), so I'd ask
that you take the archaic method of making sure whatever you add/change works:
run it/use it in a bunch of different ways. d-:

If you're really awesome, you could write said test suite!

  [git]:    http://git-scm.com/
            "git, the fast version control system"
  [echoe]:  http://github.com/fauna/echoe/
            "Echoe, a better RubyGem packaging tool"

Todo
----
- Wrap all the methods listed as "not wrapped" in the original ncurses-ruby
  TODO file
- Write a test / spec suite
- Clean up the code

Attribution
-----------
Contributions to this project by GitHub members, including myself
([elliottcable][]) can be [tracked on GitHub][impact].

The vast majority of the work in this project was done by the original
ncurses-ruby authors. Their names can be found in the original ncurses-ruby
THANKS file. The contents of that file follow:

- Tobias Herzke
- Simon Kaczor
- Akinori Musha
- Jan Becvar
- Juergen Daubert
- Doug Kearns
- Hiroshi Sainohira
- Andreas Schwarz
- Simon Strandgaard
- Paul Duncan
- Tim Sutherland

  [impact]:       http://github.com/elliottcable/ncurses/graphs/impact
                  "GitHub's 'impact' graph for this project"
  [elliottcable]: http://github.com/elliottcable/
                  "elliottcable on GitHub"
