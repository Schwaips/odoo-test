module Odoo
  class ObjectsController < ApplicationController
    def index
      @odoo_object = Odoo::ObjectRetriever.call
      @application_odoo = ApplicationOdoo.new

      # redirect_to about_path(data: @odoo_object, uid: @application_odoo.uid)
    end

    def create_sales_order
      @sale_order_id = Odoo::SalesOrder::Creator.call
      # @application_odoo = ApplicationOdoo.new

      @sale_order = Odoo::SalesOrder::Searcher.call(id: @sale_order_id)
    end
  end
end
