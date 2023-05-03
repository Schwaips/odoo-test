module Odoo
  module Stocks
    class Warehouses < ApplicationOdoo
      # 92, 60, 82, 50, 40,30 ==>  Virtual Locations/Scrap
      # 37 => Transit entre entrepot.Inter-warehouse transit
      # 4 fournisseur
      # 5 client partenaire
      # 2 partenaire.

      # 8 => AURAY/Stock
      # 68 => BAUD/Stock
      # 124 => CENTR/Stock
      # 52 => LABAS/Stock
      # 118 => VINCI/Stock
      # 42 => THEIX/Stock
      # 112 =>  STAVE/Stock
      # 22 => SENE/Stock
      # 106 => PONTI/Stock
      # 62 => PLOER/Stock
      # 32 => PLESC/Stock
      # 100 => LOCMI/Stock
      # 94 => LANDE/Stock 



      # 4 => Star-K
      # 84 => ZAPYO/Stock
      # 95 => LANDE/Entrée
      # 97 => LANDE/Sortie
      # 929 => LANDE/Stock/A1a
      # 930 => LANDE/Stock/A1b
      # 931 => LANDE/Stock/A1c
      # 932 => LANDE/Stock/A2a
      # 933 => LANDE/Stock/A2b
      # 934 => LANDE/Stock/A2c
      # 935 => LANDE/Stock/A3a
      # 936 => LANDE/Stock/A3b
      # 937 => LANDE/Stock/A3c
      # 938 => LANDE/Stock/A4a
      # 939 => LANDE/Stock/A4b
      # 940 => LANDE/Stock/A4c

      def call
        models = XMLRPC::Client.new2("#{@url}/xmlrpc/2/object")
        models.proxy
        execute_location = models.execute_kw(@db, @uid, @password, 'stock.location','search_read',[[]], {fields: %w(id name complete_name display_name),limit: 100})
        puts "############################"
        puts "execute_location: #{execute_location}"
        execute_location
      end
    end
  end
end
