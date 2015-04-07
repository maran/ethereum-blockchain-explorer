class Transaction
  include Mongoid::Document

  field :from, type: String
  field :recipient, type: String
  field :tx_hash, type: String
  field :amount, type: String
  field :price, type: String
  field :gas_limit, type: String
  field :payload

  belongs_to :block

  def self.active_address_count
    (Transaction.distinct(:from) + Transaction.distinct(:recipient)).uniq.count
  end

  def stringify_payload
    self.payload.data.unpack("H*").first
  end

end
