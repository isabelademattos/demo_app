class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:udapte]

  def index
    @locals = Local.all
  end

  def show; end

  def new
    @local = Local.new
  end

  def edit; end

  def create
    @local = @user.locals.build(local_params)

    respond_to do |format|
      if @local.save
        format.html { redirect_to user_path(@user), notice: 'Local was successfully created.' }
        format.json { render action: 'show', status: :created, location: @local }
      else
        format.html { render action: 'new' }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = @local.user

    respond_to do |format|
      if @local.update_attributes(local_params)
        format.html { redirect_to user_path(@user), notice: 'Local was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @local = @user.locals.find(params[:id])
    @local.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user)}
      format.json { head :no_content }
    end
  end

  private
    def set_local
      @local = Local.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def local_params
      params.require(:local).permit(:address, :number, :compl, :district, :city, :state, :zip, :user_id)
    end
end
