class SearchController < ApplicationController
  def search
  	@book = Book.new
  	@content = params[:content]
  	@model = params[:model]
  	@how = params[:how]
  	@dates = search_for(@how, @model, @content)
  	if @model == 'user'
	  	render 'search_user'
	elsif @model == 'book'
	  	render 'search_book'
	end
  end

  private

  def match(model, content)
  	if model == "user"
  		User.where(name: content)
  	elsif model == "book"
  		Book.where(title: content)
  	end
  end

  def forward(model, content)
  	if model == "user"
  		User.where("name LIKE ?", "#{content}%")
  	elsif model == "book"
  		Book.where("title LIKE ?", "#{content}%")
  	end
  end

  def backward(model, content)
  	if model == "user"
  		User.where("name LIKE ?", "%#{content}")
  	elsif model == "book"
  		Book.where("title LIKE ?", "%#{content}")
  	end
  end

  def partical(model, content)
  	if model == "user"
  		User.where("name LIKE ?", "%#{content}%")
  	elsif model == "book"
  		Book.where("title LIKE ?", "%#{content}%")
  	end
  end

  def search_for(how, model, content)
  	case how
	when 'match'
		match(model, content)
	when 'forward'
		forward(model, content)
	when 'backward'
		backward(model, content)
	when 'partical'
		partical(model, content)
	end
  end

end
