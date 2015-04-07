class Block
  include Mongoid::Document

  has_many :transactions

  field :block_hash, type: String
  field :parent_hash, type: String
  field :uncle_hash, type: String
  field :coin_base, type: String
  field :root, type: String
  field :tx_hash, type: String
  field :receipt_hash, type: String
  field :number, type: Integer
  field :nonce, type: String
  field :storage_size, type: String
  field :mix_digest, type: String
  field :difficulty, type: Integer
  field :gas_limit, type: Integer
  field :gas_used, type: Integer
  field :time, type: Integer
  field :tx_amount, type: Integer
  field :processed, type: Boolean, default: false

  def parent
    Block.find_by(block_hash: self.parent_hash) rescue nil
  end

  def date
    Time.at(self.time)
  end
end
