class PaypalsController < ApplicationController

  def update
    ppr = PayPal::Recurring.new(
      return_url: 'http://localhost:3000/paypal_confirm',
      cancel_url: root_url,
      description: 'VEA wallet recharge',
      amount: payment_params['amount'] || 0,
      currency: 'AUD'
    )

    @response = ppr.checkout
    if @response.valid?
      @uni = University.find_by(token: payment_params[:token])
      if @uni.wallet.nil?
        @uni.build_wallet(start_date: DateTime.now).save
      end

      @uni.wallet.paypal_carts.create(
        token: @response.params[:TOKEN],
        amount: payment_params[:wallet][:temp_amount],
        end_date: payment_params[:wallet][:end_date]
      )
      redirect_to @response.checkout_url, status: 302
    else
      @response.errors.inspect
    end
  end

  def verify_payment
    cart = PaypalCart.fresh.find_by(token: params['token'])
    if params['token'].present?
      update_walet(cart)
      redirect_to(controller: :university, action: :search, token: cart.wallet.payee.token)
    else
      render json: 'Payment transaction was un-successful'
    end
  end

  private

  def payment_params
    params.require(:university).permit(:token, wallet: [:temp_amount, :start_date, :end_date])
  end

  def update_walet(cart)
    cart.wallet.update(amount: cart.amount, end_date: calculate_expiry_date(cart))
  end

  def calculate_expiry_date(cart)
    end_date = cart.wallet.end_date || DateTime.now
    additional_days = cart.amount/1.6
    end_date + additional_days.days
  end
end