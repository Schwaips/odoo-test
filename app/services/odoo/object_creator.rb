module Odoo
  class ObjectCreator < ApplicationOdoo
    require "xmlrpc/client"

    def initialize(model:, data: {})
      super()
      @model = model
      @data = data
    end

    def call
      models = XMLRPC::Client.new2("#{@url}/xmlrpc/2/object").proxy
      # While most value types are what would expect (integer for Integer, string for Char or Text),
      # Date, Datetime and Binary fields use string values
      # One2many and Many2many use a special command protocol detailed in the documentation to the write method.
      created_id = models.execute_kw(
        @db,
        @uid,
        @password,
        @model,
        'create',
        [@data]
      )

        puts "############################"
        puts "created_id: #{created_id} from ObjectCreator"
        created_id
    end
  end
end
