class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)

    if @memo.save
      redirect_to @memo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])

    if @memo.update(memo_params)
      redirect_to @memo
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def memo_params
      params.require(:memo).permit(:title, :body)
    end
end
