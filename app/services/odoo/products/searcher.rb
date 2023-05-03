module Odoo
  module Products
    class Searcher < ApplicationOdoo
      require "xmlrpc/client"

      def initialize(id:)
        super()
        @model = "product.template"
        @id = id
      end

      def call
        models = XMLRPC::Client.new2("#{@url}/xmlrpc/2/object").proxy

        execute_product = models.execute_kw(@db, @uid, @password, @model,'search_read',[[['id','=', @id]]], {fields: %w(id name),limit: 1})
        puts "############################"
        puts "execute_model: #{execute_product}"
        execute_product
      end
    end
  end
end
