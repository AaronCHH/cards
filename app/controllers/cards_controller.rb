class CardsController < ApplicationController
  def index
    @cards = Card.all
    # render html: "<h1>hello 123</h1>".html_safe
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params["id"])
  end

  def update
    @card = Card.find(params["id"])

    clean_params = params.require("card").permit(:title, :content)

    if @card.update(clean_params)
      redirect_to "/"
    else
      render :edit
    end
  end

  def destroy
    @card = Card.find(params["id"])
    @card.destroy
    redirect_to "/"
  end

  def create
    # clean_params = params["card"].permit(:title, :content)
    clean_params = params.require("card").permit(:title, :content)

    # 寫入資料
    @card = Card.new(clean_params)
    # @card = Card.new(title: "ccc", content: "ddd")

    if @card.save
      redirect_to "/"
    else
      render :new # borrow new.index.erb to render
      # redirect_to "/cards/new"
    end
  end
end
