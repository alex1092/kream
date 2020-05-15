class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])

    # 

    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: [{
        name: @product.brand,
        
        # seller: @product.user.username,
        # images: @product.image,
        amount: (@product.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
      }],
      mode: "payment",
      # success_url: "https://example.com/success?session_id={CHECKOUT_SESSION_ID}",
      # cancel_url: "https://example.com/cancel",

      success_url: "http://localhost:3000/orders/complete",
      cancel_url: "http://localhost:3000/orders/cancel",

      # success_url: Rails.application.credentials.dig(:stripe, :success_url),
      # cancel_url:  Rails.application.credentials.dig(:stripe, :cancel_url),
    )
    puts @session
  end

  def cancel
  end

  def complete
  end

end
