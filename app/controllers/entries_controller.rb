class EntriesController < ApplicationController
  before_action :current_user, only: :destroy

  def index
    @entries = Entry.all
  end

  def new
    @entry = current_user.entries.build
  end

  def create
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      flash[:notice] = "Entry successfully created. "
      redirect_to entries_path
    else
      render :new
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def destroy
    @entry.destroy
    flash[:success] = "Entry deleted"
    redirect_to request.referrer || root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:content, :image)
  end
end
