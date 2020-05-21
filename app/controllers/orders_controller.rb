class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:product_id])

    # stripes api controller method
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @product.brand,

        amount: (@product.price * 100).to_i,
        currency: 'aud',
        quantity: 1
      }],
      mode: 'payment',

      # This is the redirect after a succesful or canceld purchase
      success_url: 'http://localhost:3000/orders/complete',
      cancel_url: 'http://localhost:3000/orders/cancel'
    )
    puts @session
  end

  def cancel; end

  def complete; end
end
