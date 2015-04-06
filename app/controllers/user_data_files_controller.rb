class UserDataFilesController < ApplicationController
  before_action :set_user_data_file, only: [:show, :edit, :update, :destroy]

  # GET /user_data_files
  # GET /user_data_files.json
  def index
    @user_data_files = UserDataFile.all
  end

  # GET /user_data_files/1
  # GET /user_data_files/1.json
  def show
  end
  
  # GET /user_data_files/new
  def new
    @user_data_file = UserDataFile.new
  end

  # GET /user_data_files/1/edit
  def edit
  end

  # POST /user_data_files
  # POST /user_data_files.json
  def create

    @user_data_file ||= UserDataFile.new
    @user_data_file.avatar = params[:file]

    @user_data_file.uploaded_file = params[:file]
    @user_data_file.save!
    @user_data_file.zipfile = params[:file]
   

    if @user_data_file.save
        flash[:notice] = "Thank you for your submission..."
        redirect_to :action => "new"
    else
        flash[:error] = "There was a problem submitting your attachment."
        render :action => "new"
    end
  end
  


  def download
    send_file "public/uploads/user_data_file/AllData.zip", :type => 'application/zip', :disposition => 'attachment'
    # send_data(@user_data_file, filename: @user_data_file.filename)
  end

  # PATCH/PUT /user_data_files/1
  # PATCH/PUT /user_data_files/1.json
  def update
    respond_to do |format|
      if @user_data_file.update(user_data_file_params)
        format.html { redirect_to @user_data_file, notice: 'User data file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_data_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_data_files/1
  # DELETE /user_data_files/1.json
  def destroy
    @user_data_file.destroy
    respond_to do |format|
      format.html { redirect_to user_data_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_data_file
      @user_data_file = UserDataFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_data_file_params
      params.require(:user_data_file).permit(:filename)
    end
end
