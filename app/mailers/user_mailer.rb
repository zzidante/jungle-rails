class UserMailer < ApplicationMailer

  def confirmed_purchase(order)
    @order = order
    mail(to: @order.email, subject: @order.id)
  end

end
