class OrdersController < ApplicationController
    
   before_filter :authenticate_user! 
   before_filter :should_have_phone , only: [:new,:create]
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
    notice =  "order cancelation sent to designer"
    if @order.cancel
       @order.update_attributes(:cancel=>false)
       notice = "order cacneletion has been canceld"
    else
   @order.update_attributes(:cancel=>true)
 end
   redirect_to current_user, :notice =>notice
  end

  def new
   @order = current_user.orders.build
  end



  private

    def correct_user
      @order = current_user.orders.find_by_id(params[:id])
      redirect_to root_url if @order.nil?
    end

    def should_have_phone
      if (current_user.phone.nil? || current_user.phone.blank?) 
        flash[:notice] = "You Need To Enter Valid Phone In Order To Create Orders"
        redirect_to edit_user_registration_path(current_user)
      end
    end
end
