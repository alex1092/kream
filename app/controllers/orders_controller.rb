class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])

    # Rails.application.credentials.dig(:stripe, :secret_key)

    Stripe.api_key = 'sk_test_gHtLtEw1C4u1ow3oj6j4dEfS00gGLVjd2p'
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
      success_url: "https://example.com/success?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: "https://example.com/cancel",

      # success_url: "http://http://localhost:3000/orders/complete",
      # cancel_url: "http://http://localhost:3000/orders/cancel",
    )
    puts @session
  end

end
