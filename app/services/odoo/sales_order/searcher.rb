module Odoo
  module SalesOrder
    class Searcher < ApplicationOdoo
      require "xmlrpc/client"

      def initialize(id:)
        super()
        @model = "sale.order"
        @id = id
      end


      def call
        return "Id must be set, it is currently nil." if @id.nil?

        models = XMLRPC::Client.new2("#{@url}/xmlrpc/2/object").proxy

        execute_product = models.execute_kw(@db, @uid, @password, @model, 'search_read', [[['id','=', @id]]], {fields: %w(name amount_total client_order_ref)})
        puts "############################"
        puts "execute_model: #{execute_product}"
        execute_product
      end
    end
  end
end
