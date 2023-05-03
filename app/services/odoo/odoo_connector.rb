module Odoo
  class OdooConnector < ApplicationOdoo
    require "xmlrpc/client"

    def call
      # @odoo

      common = XMLRPC::Client.new2("#{@url}/xmlrpc/2/common")
      # Verify the version of the server
      common_info = common.call('version')
      puts "############################"
      puts "common_info: #{common_info}"

      # Get the uid call the authenticate method with the database name, the username and the password
      # common.call('authenticate', db, username, password, {})
      # The server url is the instance’s domain (e.g. https://mycompany.odoo.com),
      # the database name is the name of the instance (e.g. mycompany).
      # The username is the configured user’s login as shown by the Change Password screen.

      uid = common.call('authenticate', @db, @username, @password, {})
      puts '############################'
      puts "uid: #{uid}"

      if uid
        puts "############################"
        puts "Connection successful"
      else
        puts "############################"
        puts "Connection failed"
      end

      uid
    end
  end
end
