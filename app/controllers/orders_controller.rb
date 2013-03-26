class OrdersController < ApplicationController
    
   before_filter :authenticate_user! 
   before_filter :correct_user,   only: :destroy

   def create
    @order = current_user.orders.build(params[:order])
    if @order.save
      flash[:success] = "Order created!"
      redirect_to current_user
    else
      render 'orders/new'
    end

  end

  def edit
  end

  def destroy
   @order.destroy
   redirect_to current_user, :notice => "order deleted"
  end

  def new
   @order = current_user.orders.build
  end


  private

    def correct_user
      @order = current_user.orders.find_by_id(params[:id])
      redirect_to root_url if @order.nil?
    end
end
