module Odoo
  class OdooObjectRetriever < ApplicationOdoo
    require "xmlrpc/client"

    def call
      # puts "############################"
      # puts "uid: #{@uid} from OdooObjectRetriever"
      # puts @uid
      models = XMLRPC::Client.new2("#{@url}/xmlrpc/2/object").proxy
      # puts "############################"
      # puts "models: #{models}"

      # get products
      execute_product = models.execute_kw(@db, @uid, @password, 'product.template', 'search_read', [[]], {fields: ['name', 'display_name'], limit: 10})
      puts "############################"
      puts "execute_model: #{execute_product}"

      # get stocks
      # execute_stock = models.execute_kw(@db, @uid, @password, 'stock.report', 'search_read', [[]], { limit: 10})
      execute_stock = models.execute_kw(@db, @uid, @password, 'product.template', 'search_read', [[]], { limit: 10 })
      execute_stock_per_mag = models.execute_kw(@db, @uid, @password, 'product.product', 'search_read', [[["id", "=", 23230]]], { limit: 10 })

      # puts '############################'
      # puts "execute_stock: #{execute_stock}"


      puts "############################"
      puts "execute_stock_per_mag: #{execute_stock_per_mag}"

      {
        products: execute_product,
        stocks: execute_stock,
        stock_per_mag: execute_stock_per_mag
      }
    end
  end
end
