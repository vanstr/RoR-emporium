class CatalogController < ApplicationController
  before_filter :initialize_cart
  def index
    @page_title = "Book List"
    @books = Book.paginate(:page => params[:page],
                           :order => "books.id desc",
                           :include => [:authors, :publisher], :per_page => 10)
  end

  def show
    @book = Book.find(params[:id]) rescue nil
    return render(:text => "Not found", :status => 404) unless @book
    @page_title = @book.title
  end

  def search
  end

  def latest
    @page_title = "Latest Books"
    @books = Book.latest
  end
end
