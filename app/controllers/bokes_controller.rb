class BokesController < ApplicationController

  def index
    # sc1.pyで1ページ目スクレイピング開始
    
    @result = `python2 #{Rails.root}/app/controllers/sc1.py`

    @sc_url = @result.split('"').grep(/[jpg]/).select do |url|
                url.include?("jpg")
    end
    
    @img_url = []
    i=0
    @sc_url.each do |sc_url|
      @img_url[i] = "https:#{sc_url}"
      Boke.create(boke: '', image_url: @img_url[i] )
      i += 1
    end
    
    # sc1.pyで1ページ目スクレイピング終了
    # sc2.pyで2ページ目スクレイピング開始
    @result = `python2 #{Rails.root}/app/controllers/sc2.py`

    @sc_url = @result.split('"').grep(/[jpg]/).select do |url|
                url.include?("jpg")
    end
    
    i=10
    @sc_url.each do |sc_url|
      @img_url[i] = "https:#{sc_url}"
      Boke.create(boke: '', image_url: @img_url[i] )
      i += 1
    end
    # sc2.pyで2ページ目スクレイピング終了
    # sc3.pyで3ページ目スクレイピング開始
    @result = `python2 #{Rails.root}/app/controllers/sc3.py`

    @sc_url = @result.split('"').grep(/[jpg]/).select do |url|
                url.include?("jpg")
    end
    
    i=20
    @sc_url.each do |sc_url|
      @img_url[i] = "https:#{sc_url}"
      Boke.create(boke: '', image_url: @img_url[i] )
      i += 1
    end
    # sc3.pyで3ページ目スクレイピング終了
    
    
    
    @messages = Message.all
  end

  def show
    @params = params[:id]
    
    @message = Message.new
   
    @img_url = Boke.all.order(updated_at: "DESC")
  end
  
  def show2
    @params = params[:id]
    
    @random_image=Boke.where( 'id >= ?', rand(Boke.first.id..Boke.last.id) ).first.image_url
  end
  
  

  def new
    $new_boke_params = params[:img_url]
    
    @boke = Boke.new
  end

  def create
    @boke = Boke.new(boke_params)

    if @boke.save
      flash[:success] = 'ボケ が正常に投稿されました'
      @new_boke = Boke.last.update(image_url: $new_boke_params)
      redirect_to @boke
    else
      flash.now[:danger] = 'ボケ が投稿されませんでした'
      render :new
    end
  end

  def edit
    @params = params[:img_url]
    set_boke
  end

  def update
    @params = params[:id]
    set_boke

    if @boke.update(boke_params)
      flash[:success] = 'ボケ は正常に更新されました'
      redirect_to bokes_url
    else
      flash.now[:danger] = 'ボケ は更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_message
    @message.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to messages_url
  end
  
   private
   
  def set_boke
    @boke = Boke.find(params[:id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def boke_params
    params.require(:boke).permit(:boke)
  end
  
  def message_params
    params.require(:message).permit(:content)
  end
end