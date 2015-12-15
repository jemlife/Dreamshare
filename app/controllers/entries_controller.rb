class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

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
    if @entry.destroy
      flash[:notice] = "Entry deleted"
      redirect_to  root_path
    else
      render :destroy
    end

  end

  private

  def entry_params
    params.require(:entry).permit(:content, :image)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
