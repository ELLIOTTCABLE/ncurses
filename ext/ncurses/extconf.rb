#!/usr/bin/env ruby

# ncurses-ruby is a ruby module for accessing the FSF's ncurses library
# (C) 2002, 2004 Tobias Peters <t-peters@users.berlios.de>
# (C) 2005 Tobias Herzke
#
# This module is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
#
# This module is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this module; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA

# $Id: extconf.rb,v 1.11 2005/02/26 22:51:45 t-peters Exp $

require 'mkmf'

$CFLAGS  += ' -g'
$CXXFLAGS = $CFLAGS

# Add paths for NetBSD.
$CFLAGS  += ' -I/usr/pkg/include'
$LDFLAGS += ' -L/usr/pkg/lib'

have_header('unistd.h')

# ===================
# = Ncurses headers =
# ===================
%w(ncursesw ncursesw/ncursesw ncursesw/cursesw ncursesw/curses cursesw).each do |h|
  break if @have_ncursesw_header = have_header("#{h}.h")
end
STDERR.puts 'WARNING: Ncurses widechar headers missing! Did you configure ncurses with `--enable-widec`? We will attempt to build without widech support!' unless @have_ncursesw_header

%w(ncurses ncurses/ncurses ncurses/curses curses).each do |h|
  break if @have_ncurses_header = have_header("#{h}.h")
end unless @have_ncursesw_header
raise 'Ncurses headers missing. Have you installed ncurses?' unless @have_ncursesw_header or @have_ncurses_header

# ===================
# = Ncurses library =
# ===================
# We don't want to accidentally link against non-widech libraries if we don't
# have a widech Ncurses, or vice versa. So we only look for the relevant ones.
if @have_ncursesw_header
  %w(ncursesw pdcursesw).each do |lib|
    break if @have_ncursesw_library = have_library(lib, 'wmove')
  end
  raise 'Ncurses widech library missing, but ncurses widech headers present. Have you installed ncurses properly,  with `--enable-widec`?' unless @have_ncursesw_library
else
  %w(ncurses pdcurses).each do |lib|
    break if @have_ncurses_library = have_library(lib, 'wmove')
  end
  raise 'Ncurses library missing. Have you installed ncurses properly?' unless @have_ncurses_library
end

# =============
# = Functions =
# =============
%w(newscr TABSIZE ESCDELAY keybound curses_version tigetstr getwin putwin
ungetmouse mousemask wenclose mouseinterval wmouse_trafo mcprint has_key 
delscreen define_key keyok resizeterm use_default_colors use_extended_names
wresize attr_on attr_off attr_set chgat color_set filter intrflush mvchgat
mvhline mvvline mvwchgat mvwhline mvwvline noqiflush putp qiflush scr_dump
scr_init scr_restore scr_set slk_attr_off slk_attr_on slk_attr slk_attr_set
slk_color tigetflag tigetnum use_env vidattr vid_attr wattr_on wattr_off
wattr_set wchgat wcolor_set getattrs).each {|func| have_func(func) }

puts 'checking which debugging functions to wrap...'
%w(_tracef _tracedump _nc_tracebits _traceattr _traceattr2 _tracechar
_tracechtype _tracechtype2 _tracemouse).each {|func| have_func(func) }

puts 'checking for other functions that appeared after ncurses version 5.0...'
%w(assume_default_colors attr_get).each {|func| have_func(func) }

# ===================
# = Other libraries =
# ===================
# We don't want to accidentally link against non-widech libraries if we don't
# have a widech Ncurses, or vice versa. So we only look for the relevant ones.
if @have_ncursesw_header
  puts 'checking for the panel library...'
  %w(panelw ncursesw/panelw ncursesw/panel).each do |h|
    have_library('panelw', 'panel_hidden') and break if have_header("#{h}.h")
  end

  puts 'checking for the form library...'
  %w(formw ncursesw/formw ncursesw/form).each do |h|
    have_library('formw', 'new_form') and break if have_header("#{h}.h")
  end

  puts 'checking for the menu library...'
  %w(menuw ncursesw/menuw ncursesw/menu).each do |h|
    have_library('menuw', 'new_menu') and break if have_header("#{h}.h")
  end
else
  puts 'checking for the panel library...'
  %w(panel ncurses/panel).each do |h|
    have_library('panel', 'panel_hidden') and break if have_header("#{h}.h")
  end

  puts 'checking for the form library...'
  %w(form ncurses/form).each do |h|
    have_library('form', 'new_form') and break if have_header("#{h}.h")
  end

  puts 'checking for the menu library...'
  %w(menu ncurses/menu).each do |h|
    have_library('menu', 'new_menu') and break if have_header("#{h}.h")
  end
end

create_makefile('ncurses')
