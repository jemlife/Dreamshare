class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all
    @entries = Entry.search(params[:search])
    @entries = Entry.only_public
    @entries = Entry.only_private

  end


  def new
    @entry = current_user.entries.build
  end

  def create
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      flash[:success] = "Entry successfully created. "
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
    params.require(:entry).permit(:content, :image, :dream_category, :country, :published)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
