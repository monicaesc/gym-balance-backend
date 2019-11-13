class BalanceController < ApplicationController

  # def index
  #   @balance = Balance.all
  # end

  def new
    @klasses = Klasses.new
  end

  def edit
      @klasses = Klasses.find(params[:id])
    end

    def update
      klasses = Klasses.find(params[:id])
      klasses.update(klasses_params)
      redirect_to klasses
    end

  def show
    @klasses = Klasses.find(params[:id])
  end

  def status
    @klasses = Klass.all
    render json: {klasses: @klasses}
  end

  def findmyklasses
    puts "1111111"
    @user = User.find(params[:user_id])
    render json: { my_klasses: @user.klasses }, status: :ok
  end  

  private
    def balance_params
      params.require(:balance).permit(:name, :date, :description)
    end
end
