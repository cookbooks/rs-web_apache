#
# Cookbook Name:: web_apache
# Attributes:: apache
#
# Copyright (c) 2009 RightScale Inc
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#
# Recommended attributes
#
set_unless[:apache][:contact] = "root@localhost"

#
# Optional attributes
#
# Turning off Keepalive to prevent conflicting HAproxy
set_unless[:apache][:keepalive] = "Off" 
# Turn on generation of "full" apache status
set_unless[:apache][:extended_status] = "On"
#  worker = multithreaded
#  prefork = single-threaded (use for php)
set_unless[:apache][:mpm] = "prefork"
# Security: Configuring Server Signature
set_unless[:apache][:serversignature] = "Off "
# DISTRO specific config dir
case platform
when "ubuntu", "debian"
  set[:apache][:config_subdir] = "apache2"
when "centos", "fedora", "suse"
  set[:apache][:config_subdir] = "httpd"
end

set_unless[:web_apache][:ssl_enable] = false
set_unless[:web_apache][:ssl_certificate] = nil
set_unless[:web_apache][:ssl_certificate_chain] = nil
set_unless[:web_apache][:ssl_key] = nil
set_unless[:web_apache][:ssl_passphrase] = nil

# Used to be called php/code/destination
set[:web_apache][:docroot] = "/home/webapp/#{web_apache[:application_name]}"
