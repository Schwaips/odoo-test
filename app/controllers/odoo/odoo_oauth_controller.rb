module Odoo
  class OdooOauthController < ApplicationController
    def odoo_authorization
      puts "############################"
      puts "request referer"
      puts request.referer
      uid_odoo = Odoo::OdooConnector.call if request.referer.include? "localhost"
      
      redirect_to about_path(uid: uid_odoo)
    end
  end
end
