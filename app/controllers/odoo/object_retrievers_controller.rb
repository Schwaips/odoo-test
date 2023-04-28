module Odoo
  class ObjectRetrieversController < ApplicationController
    def index
      @odoo_object = Odoo::OdooObjectRetriever.call
      @application_odoo = ApplicationOdoo.new

      # redirect_to about_path(data: @odoo_object, uid: @application_odoo.uid)
    end
  end
end
