class SaleOrder
  include ActiveModel::Validations

  def find_by(id)
    Odoo::SalesOrder::Searcher.call(id: id)
  end
end
