class EntriesController < ApplicationController
  def index
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry.create(entry_params)
    redirect_to @entry
  end

  private

  def entry_params
    params.require(:entry).permit(:content, :image)
  end
end
