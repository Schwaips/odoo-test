module Odoo
  class ObjectRetriever < ApplicationOdoo
    require "xmlrpc/client"

    def call

      models = XMLRPC::Client.new2("#{@url}/xmlrpc/2/object").proxy

      # get products with id 30230
      execute_product = models.execute_kw(@db, @uid, @password, 'product.template', 'search_read', [[["id", "=", 30230]]], {fields: ['name', 'display_name'], limit: 10})
      puts "############################"
      puts "execute_model: #{execute_product}"

      # get stocks for all warehouses
      execute_product_template = models.execute_kw(@db, @uid, @password, 'product.template', 'search_read', [[["id", "=", 30230]]], { fields: ["qty_available", "virtual_available", "outgoing_qty", "incoming_qty"], limit: 10 })
      # This one send a qty_available field, that returns the total stock of the product for all warehouses

      # get stocks per warehouse
      execute_stock_per_mag = models.execute_kw(@db, @uid, @password,
        'stock.quant',
        'search_read',
        [[
          ["location_id", "in", liste_locations_ids_to_look]
        ]], {
          fields: %w(id quantity available_quantity reserved_quantity product_id display_name location_id),
        }
      )


      locations_infos = models.execute_kw(@db, @uid, @password,
        'stock.location',
        'search_read',
        [[
          # ["location_id", "in", [8, 68, 124, 52, 94, 118, 42, 112, 22, 106, 62, 32, 100]]
        ]], {
          limit: 10,
          # fields: %w(id quantity available_quantity reserved_quantity product_id display_name location_id),
        }
      )
      # fields: %w(quantity available_quantity reserved_quantity product_id display_name location_id)

      # Stock.quant is the model that contains the stock per warehouse
      # This one send a available_quantity field, that returns the stock of the product for the warehouse
      # BE CAREFULL we must

      {
        products: execute_product,
        execute_product_template: execute_product_template,
        stock_per_stock_quant: execute_stock_per_mag,
        locations: locations_infos
        # stock_location: execute_stock_location
      }
    end


    def liste_locations_ids_to_look
      # 1 On regarde Lande

      # 2 on récupères tous les ids des childrens ( qui sont les emplacements enfant)
      # /!/ cette donnée est dynamique, les gens de chez vaphom peuvent changer ou créer des rangements comme ils souhaitent.
      emplacement_lande_stock = [
        929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994, 995, 996, 997, 998, 999, 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136, 1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151, 1152, 1153, 1154, 1155, 1156, 1157, 1158, 1159, 1160, 1161, 1162, 1163, 1164, 1165, 1166, 1167, 1168, 1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192
      ]
      # 3 on call Odoo pour savoir s'il y a du stock dans les
      # ids des emplacements récupére + les Emplacements NOM/Stock

      liste_warehouse = [8, 68, 124, 52, 94, 118, 42, 112, 22, 106, 62, 32, 100]
      liste_warehouse + emplacement_lande_stock
    end
  end
end
