class EmailsController < ApplicationController


  def destroy
    @email = Email.find(params[:id])
    # remove the files

    @email.destroy

    respond_to do |format| 
      format.html { redirect_to galleries_path }
      format.json { head :no_content }
    end
  end

end
