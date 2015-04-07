class BlocksController < ApplicationController
  def index
    if params[:search].present?
      search(params)
    end
    @blocks = Block.desc(:time).page(params[:page]).per(20)
  end

  def show
    @block = Block.find(params[:id])
  end

  private
  # TODO: Move to it's own controller
  def search(params)
    block = Block.find_by(block_hash: /^(0x)?#{params[:search][:hash]}/)
    if block.present?
      redirect_to block_path(block) and return
    end
    tx = Transaction.find_by(tx_hash: /^(0x)?#{params[:search][:hash]}/)
    if tx.present?
      redirect_to transaction_path(tx) and return
    end
  end
end
