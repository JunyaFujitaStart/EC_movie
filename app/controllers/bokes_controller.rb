class BokesController < ApplicationController

  def index
    @img_url = Boke.last(9)
    
    @messages = Message.all
    
    # @xxxx = Message.xxxx
    # Message.yyyy
    # @zzzz = Message.zzzz
    
    # @img_url = @bokete_img.split("\n")
  end

  def show
    @params = params[:id]
    
    @message = Message.new
    
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
    
    @img_url = Boke.last(9)
    
    redirect_to bokes_path
  end
  
  def show2
    @params = params[:id]
    
    @random_images=Boke.first(9)
    
    @random_image=[]
    @i=1
    9.times do 
      @random_image[@i]=Boke.where( 'id >= ?', rand(Boke.first.id..Boke.last.id) ).first.image_url
      @i+=1
    end
    @i = 1
  end
  
  

  def new
    @message = Message.new
  end

  def create
     @message = Message.new(message_params)

    if @message.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def edit
    set_message
  end

  def update
    set_message

    if @message.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message は更新されませんでした'
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

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end