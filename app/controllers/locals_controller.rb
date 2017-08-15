class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except: [:udapte]

  # GET /locals
  # GET /locals.json
  def index
    #@locals = Local.all
    #@user = User.find(params[:user_id]) 
    @local = @user.locals.find(params[:id])
  end

  # GET /locals/1
  # GET /locals/1.json
  def show
    #@user = User.find(params[:user_id]) 
    #@local = @user.locals.find(params[:id])
  end

  # GET /locals/new
  def new
    #@local = Local.new
    #@user = User.find(params[:user_id])
    @local = Local.new()
  end

  # GET /locals/1/edit
  def edit
    #@user = User.find(params[:user_id]) 
    #@local = @user.locals.find(params[:id])
  end

  # POST /locals
  # POST /locals.json
  def create
    #@local = Local.new(local_params)
    #@user = User.find(params[:user_id])
    @local = @user.locals.create(local_params)

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

  # PATCH/PUT /locals/1
  # PATCH/PUT /locals/1.json
  def update
    #@local = Local.find(params[:id])
    @user = @local.user

    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to user_path(@user), notice: 'Local was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    #@user = User.find(params[:user_id])
    @local = @user.locals.find(params[:id])
    @local.destroy
    #@local.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user)}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.  
    def local_params
      params.require(:local).permit(:address, :number, :compl, :district, :city, :state, :zip, :user_id)
    end
end
