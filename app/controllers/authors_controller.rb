#require "prawn"

class AuthorsController < ApplicationController
  USERS = { "lifo" => "world" }
  before_action :authenticate, only: :index

  def author_index
    @authors = Author.all
    #render inline: "<% @authors.each do |p| %><p><%= p.name %></p><% end %>"
    #render plain: "OK"
    #render html: helpers.tag.strong('Not Found')
    #render json: @authors
    #render xml: @authors
    #render body: "raw"
    #render file: "#{Rails.root}/app/views/authors/404.html.erb", layout: false
    #render formats: :xml
    #render formats: [:json, :xml]
    #render variants: [:mobile, :desktop]
    #render layout: "inventory"
  end

  # def upload
  #     uploaded_file = params[:picture]
  #     File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
  #       file.write(uploaded_file.read)
  #     end
  # end

  def download_pdf
    author = Author.find(params[:id])
    send_data generate_pdf(author),
              filename: "#{author.name}.pdf",
              type: "application/pdf"
  end

  def new
    @authors = Author.new
  end

  def create
    @authors = Author.new(author_params)
    
    if @authors.save
      redirect_to author_index_authors_path
    else
      flash[:danger] = 'Something went wrong.'
      render :author_new
    end
  end

  def edit
    @authors = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render :author_index
    end
  end

  def destroy
    @author = Author.find(params[:author_id])
    @author.destroy

    redirect_to author_index_authors_path
  end


  def book_index
    @books = Book.all
  end

  def book_new
    @books = Book.new
  end

  def book_create
    @books = Book.new(book_params)
    
    if @books.save
      redirect_to book_index_authors_path
    else
      flash[:danger] = 'Something went wrong.'
      render :book_new
    end
  end

  def book_edit
    @books = Book.find(params[:id])
  end

  def book_update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :book_index
    end
  end

  def book_destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to book_index_authors_path
  end


  def supplier_index
    @suppliers = Supplier.all
  end

  def supplier_new
    @suppliers = Supplier.new
  end

  def supplier_create
    @suppliers = Supplier.new(supplier_params)
    
    if @suppliers.save
      redirect_to supplier_index_authors_path
    else
      flash[:danger] = 'Something went wrong.'
      render :supplier_new
    end
  end

  def supplier_edit
    @suppliers = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to @suppliers
    else
      render :supplier_index
    end
  end

  def supplier_update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to @suppliers
    else
      render :supplier_index
    end
  end

  def supplier_destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    redirect_to supplier_index_authors_path
  end


  def account_index
    @accounts = Account.all
  end

  def account_new
    @accounts = Account.new
  end

  def account_create
    @accounts = Account.new(account_params)
    
    if @accounts.save
      redirect_to account_index_authors_path
    else
      flash[:danger] = 'Something went wrong.'
      render 'account_new'
    end
  end

    def account_edit
    @accounts = Account.find(params[:id])
  end

  def account_update
    @account = Account.find(params[:id])

    if @account.update(account_params)
      redirect_to @account
    else
      render :account_index
    end
  end

  def account_destroy
    @account = Account.find(params[:id])
    @account.destroy

    redirect_to account_index_authors_path
  end


  private
  def author_params
    params.require(:author).permit(:name)
  end

  def book_params
    params.require(:book).permit(:author_id, :published_at)
  end

  def supplier_params
    params.require(:supplier).permit(:name)
  end

  def account_params
    params.require(:account).permit(:account_number, :supplier_id)
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

  def generate_pdf(author)
      Prawn::Document.new do
        text author.name, align: :center
        #text "Address: #{client.address}"
        text "Email: #{author.email}"
      end.render
    end

end
