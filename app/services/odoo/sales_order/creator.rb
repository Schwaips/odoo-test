module Odoo
  module SalesOrder
    class Creator < ApplicationOdoo
      def initialize
        super()
        @model = "sale.order"
        @data = set_data_order
      end

      def call
        product_id = Odoo::Products::Searcher.call(id: 30230)
        puts "############################"
        puts "product_id: #{product_id}"

        product_information = Odoo::Products::Searcher.call(id: product_id)
        puts "############################"
        puts "product_information: #{product_information}"

        sales_order_id = Odoo::ObjectCreator.call(model: @model, data: @data)

        puts "############################"
        puts "sales_order_id: #{sales_order_id}"
        sales_order_id
      end

      private

      def set_data_order
        {
          partner_id: 1,
          validity_date: DateTime.now.strftime('%Y-%m-%d %H:%M:%S'),
          order_line: [[0, 0, line_vals]]
        }
      end

      def line_vals
        {
          product_id: 30230, # this is 24 Stanley 50ml Montreal Original
          name: '24 Stanley 50ml Montreal Original',
          product_uom_qty: 10,
          price_unit: 30000
        }
      end
    end
  end
end
