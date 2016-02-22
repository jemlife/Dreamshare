class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def new
    @entry = current_user.entries.build
<<<<<<< HEAD
=======


>>>>>>> entry-categories
  end

  def create
    @entry = current_user.entries.build(entry_params)

<<<<<<< HEAD
=======

>>>>>>> entry-categories
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
      flash[:success] = "Entry deleted"
      redirect_to  entries_path
    else
      render :destroy
    end

  end

  private

  def entry_params
<<<<<<< HEAD
    params.require(:entry).permit(:content, :image)
=======
    params.require(:entry).permit(:content, :image, :entry_id)
>>>>>>> entry-categories
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
