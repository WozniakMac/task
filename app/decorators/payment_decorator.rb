class PaymentDecorator < BaseDecorator
  def month
    payment_date ? payment_date.strftime("%B") : ''
  end

  def icon
    paid ? 'check' : 'times'
  end
end
