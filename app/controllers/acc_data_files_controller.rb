class AccDataFilesController < ApplicationController
  def show
    @accdatafile = AccDataFile.find(params[:id])
  end

  def create
    return if params[:accdatafile].blank?

    @accdatafile = AccDataFile.new
    @accdatafile.uploaded_file = params[:accdatafile]

    if @accdatafile.save
        flash[:notice] = "Thank you for your submission..."
        redirect_to :action => "new"
    else
        flash[:error] = "There was a problem submitting your attachment."
        render :action => "new"
    end
  end

  def index
  	@accdatafiles = AccDataFile.all
  end

  def download
  	@accdatafile = AccDataFile.find(params[:id])
  	send_data(@accdatafile, filename: @accdatafile.filename)
  end

  def destroy
  	AccDataFile.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to acc_data_files_url }
      format.json { head :no_content }
    end
  end

end
