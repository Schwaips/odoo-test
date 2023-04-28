module Odoo
  class OdooOauthController < ApplicationController
    def odoo_authorization
      uid_odoo = Odoo::OdooConnector.call

      redirect_to about_path(uid: uid_odoo)
    end
  end
end
