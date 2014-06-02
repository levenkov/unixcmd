#!/usr/bin/ruby19

require 'gtk2'
require 'open3'

require_relative './panel.rb'
require_relative './version.rb'
require_relative './config.rb'


class CmdWnd < Gtk::Window
    @vbox
    @btnpanel
    @panes
    @left
    @right

    def left() @left end
    def right() @right end

    def initialize
        super

        set_title APP_NAME + ' ' + APP_VERSION

        set_border_width 5

        @vbox = Gtk::VBox.new
        @panes = Gtk::HPaned.new
        @left = CmdPanelWidget.new
        @right = CmdPanelWidget.new

        @panes.pack1 @left, true, true
        @panes.pack2 @right, true, true

        @vbox.pack_start @panes, true

        add @vbox

        signal_connect('destroy') { destroy }

        self.focus_chain = [@left, @right]

        set_default_size 1024, 768 
        show_all
    end

    def curpanel
        return @left if self.focus.parent.parent.parent == @left
        @right
    end

    def otherpanel
        return @left if self.focus.parent.parent.parent == @right
        @right
    end

    def selected_file
        curpanel().path + curpanel().selection[0]
    end

    def destroy
        Gtk.main_quit
    end
end


GLib::Thread.init
Gdk::Threads.init
Gdk::Threads.enter

Gtk::AccelMap.add_entry '<unixcmd>/panel/reload',   Gdk::Keyval::GDK_F2, nil 

Gtk::AccelMap.add_entry '<unixcmd>/file/view',   Gdk::Keyval::GDK_F3, nil 
Gtk::AccelMap.add_entry '<unixcmd>/file/edit',   Gdk::Keyval::GDK_F4, nil 
Gtk::AccelMap.add_entry '<unixcmd>/file/copy',   Gdk::Keyval::GDK_F5, nil 
Gtk::AccelMap.add_entry '<unixcmd>/file/move',   Gdk::Keyval::GDK_F6, nil 
Gtk::AccelMap.add_entry '<unixcmd>/file/mkdir',  Gdk::Keyval::GDK_F7, nil 
Gtk::AccelMap.add_entry '<unixcmd>/file/remove', Gdk::Keyval::GDK_F8, Gdk::Window::SHIFT_MASK 

Gtk::AccelMap.add_entry '<unixcmd>/test/print_selection', Gdk::Keyval::GDK_F11, nil 

Gtk::AccelMap.add_entry '<unixcmd>/file/info', Gdk::Keyval::GDK_Return, Gdk::Window::MOD1_MASK

Gtk::AccelMap.add_entry '<unixcmd>/app/quit', Gdk::Keyval::GDK_F4, Gdk::Window::MOD1_MASK


require_relative './cmd.rb'


$wnd = CmdWnd.new
$wnd.add_accel_group $accels

Gtk.main

Gdk::Threads.leave