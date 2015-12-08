class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create(entry_params)
    if @entry.save
      flash[:notice] = "Entry successfully created. "
      redirect_to entries_path
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:content, :image)
  end
end
