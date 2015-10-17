class PaymentDecorator < BaseDecorator
  include ActionView::Helpers::NumberHelper

  def formatted_amount
    number_with_precision(self.amount, precision: 2)
  end

end