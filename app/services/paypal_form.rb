class PaypalForm < SimpleDelegator
  attr_accessor(
    :payee,
    :package,
    :response,
    :prev_package
  )

  def initialize(payee, package, response)
    @payee = payee
    @response = response
    @package = package
  end

  def save_wallet
    @prev_package = payee.wallet&.package
    if payee.wallet.nil?
      payee.build_wallet(start_date: DateTime.now, package: package).save
    else
      payee.wallet.update(package: package)
    end

    payee.wallet.paypal_carts.create(
      token: @response.params[:TOKEN],
      amount: CONSTANTS[package],
      end_date: end_date
    )
  end

  def end_date
    unless prev_package.nil?
      if basic_uni_package.include?(prev_package) && prev_package.include?(payee.wallet.package)
        same_package
      elsif premium_uni_package.include?(prev_package) && prev_package.include?(payee.wallet.package)
        same_package
      else
        different_package
      end
    end
  end

  def basic_uni_package
    ['basic_uni_quarterly', 'basic_uni_half_yearly', 'basic_uni_yearly', 'basic_stud_quarterly',
      'basic_stud_half_yearly', 'basic_stud_yearly']
  end

  def premium_uni_package
    ['premium_uni_quarterly', 'premium_uni_half_yearly', 'premium_uni_yearly','premium_stud_quarterly',
      'premium_stud_half_yearly', 'premium_stud_yearly']
  end

  def same_package
    previous_cart = payee.wallet.paypal_carts.first
    start_date = previous_cart.end_date > DateTime.now ? previous_cart.end_date : DateTime.now
    start_date + CONSTANTS[package+"_duration"].months
  end

  def different_package
    DateTime.now + CONSTANTS[package+"_duration"].months
  end
end