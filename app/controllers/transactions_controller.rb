# class TransactionsController < ApplicationController
#   before_action :authenticate_user!
#   def new
#     gon.client_token = generate_client_token
#   end

#   def create
#     @result = Braintree::Transaction.sale(
#               amount: "100.00",
#               payment_method_nonce: params[:payment_method_nonce])
#     if @result.success?
#       redirect_to root_url, notice: "Congratulations! Your transaction has been successfully!"
#     else
#       flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
#       gon.client_token = generate_client_token
#       render :new
#     end
#   end
#   #client token to be sent to brain tree
#   #call it out at payment page, using generate_client_token
#   private
#     def generate_client_token
#     	Braintree::ClientToken.generate
#     end
# end