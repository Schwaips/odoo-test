class ApplicationOdoo < ApplicationService
  attr_accessor :uid

  def initialize
    @url = ENV["ODOO_URL"]
    @db = ENV["ODOO_DB"]
    @username = 'nicolas.guimier@drakkar.io'
    @password = ENV['ODOO_NICOLAS_KEY']
    @uid = 2
  end

  def set_uid
    if @uid.nil?
      @uid = Odoo::OdooConnector.call
    end
  end
end
