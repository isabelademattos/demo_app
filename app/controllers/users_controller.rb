class UsersController < ApplicationController
  STATES = ['AC','AL','AM','AP','BA','CE','DF','ES','GO','MA','MG','MS','MT','PA','PB','PE','PI','PR','RJ','RN','RS','RO','RR','SC','SE','SP','TO'].freeze

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    params[:inicial_date] = Date.today.beginning_of_month unless params[:inicial_date]
    params[:final_date] = Date.today.end_of_month unless params[:final_date]
    @users = User.all
    @users = @users.filter_by_name(params[:name_search]) if params[:name_search]
    inicial_date = params[:inicial_date].to_date rescue nil
    final_date = params[:final_date].to_date rescue nil
    @users = @users.filter_by_initial_date(inicial_date) if inicial_date
    @users = @users.filter_by_final_date(final_date) if final_date
  end

  def show; end

  def new
    @user = User.new
    1.times { @user.locals.build }
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :birthdate, :gender, :email_messages, locals_attributes: [:id, :address, :number, :compl, :district, :city, :state, :zip, :_destroy])
    end
end






