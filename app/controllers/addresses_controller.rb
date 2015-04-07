class AddressesController < ApplicationController
  def show
    @transactions = Transaction.or({recipient: params[:id]},{from: params[:id]})
  end
end
