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

  def move_to
    @email = Email.find(params[:id])

    respond_to do |format| 
      format.html { redirect_to galleries_path }
      format.json { head :no_content }
    end
    p @email
  end

end
