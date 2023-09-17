class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :set_book,only:[:show, :destroy]

  def show
    # 描画方法の記載　レンダリング
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
    # 描画するテンプレートを探す、テンプレートをもとに最終的なHTMLを生成する
    # RAILS_ROOT/app/views/コントローラ名/アクション名.html.erb
    # render :show
    respond_to do |format|
      format.html do |html|
        html.mobile {resirect_to profile_path}
      end
      format.json{render json: @book}
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html {redirect_to "/"}
      format.json {head :no_contact}
     end
  end

   private

   def set_book
     @book = Book.find(params[:id])
   end
end
