class PaypalForm < SimpleDelegator
  attr_accessor(
    :payee,
    :wallet_params,
    :response
  )

  def initialize(payee, wallet_params, response)
    @payee = payee
    @wallet_params = wallet_params
    @response = response
  end

  def save_wallet
    if payee.wallet.nil?
      payee.build_wallet(start_date: DateTime.now).save
    end

    payee.wallet.paypal_carts.create(
      token: @response.params[:TOKEN],
      amount: wallet_params[:wallet][:temp_amount],
      end_date: wallet_params[:wallet][:end_date]
    )
  end
end