class KlassesController < ApplicationController
#  before_action :authorize_request, except: :create
#  before_action :find_user, except: %i[create index]

  def index
    @klasses = Klass.all
    render json: {klasses: @klasses}, status: :ok
  end


  private
end
