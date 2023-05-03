module Odoo
  module Partners
    class Creator
      require "xmlrpc/client"

      def initialize
        @data = set_data_res_partner
      end

      def call
        ObjectCreator.call(model: "res.partner", data: set_data_res_partner)
      end

      private

      def set_data_res_partner
        {
          name: "Nicolas",
          street: "Calle 1",
          city: "Bogota",
          zip: "110111",
          country_id: 49,
          email: "testexternalAPI"
        }
      end
    end
  end
end

