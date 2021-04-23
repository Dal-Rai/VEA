class PaypalsController < ApplicationController

  def update
    ppr = PayPal::Recurring.new(
      return_url: 'http://localhost:3000/paypal_confirm',
      cancel_url: root_url,
      description: 'VEA wallet recharge',
      amount:  CONSTANTS[package] || 0,
      currency: 'AUD'
    )

    @response = ppr.checkout
    if @response.valid?
      payee = current_user.present? ? current_user : University.find_by(token: payment_params[:token])
      form = PaypalForm.new(payee, package, @response)
      form.save_wallet
      redirect_to @response.checkout_url, status: 302
    else
      @response.errors.inspect
    end
  end

  def verify_payment
    cart = PaypalCart.fresh.find_by(token: params['token'])
    if params['token'].present?
      update_walet(cart)
      if current_user.present?
        redirect_to(controller: :users, action: :show, id: current_user, type: 'profile')
      else
        redirect_to(controller: :university, action: :search, token: cart.wallet.payee.token)
      end
    else
      render json: 'Payment transaction was un-successful'
    end
  end

  private

  def payment_params
    if current_user.nil?
      params.require(:university).permit(:token)
    end
  end

  def update_walet(cart)
    cart.wallet.update(amount: cart.amount, end_date: calculate_expiry_date(cart))
  end

  def calculate_expiry_date(cart)
    end_date = cart.wallet.end_date || DateTime.now
    additional_days = cart.amount/1.6
    end_date + additional_days.days
  end

  def package
    params[:radio]
  end
end