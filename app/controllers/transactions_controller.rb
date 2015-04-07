class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
  end
end
