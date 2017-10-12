class Library
  def initialize
    @inventory = Inventory.new
    @users = []
    @budget = 0
  end

  # Library does not communicate with Book
  # Rather, it communicates with Inventory and User only. 
  def check_out_book(book, user)
    if @users.include?(user) && @inventory.include?(book)
      @inventory.mark_as_borrowed_by(book, user)
    else
      puts "Something has gone wrong. Please refer to a librarian."
    end
  end
end

class Inventory
  def initialize
    @books = {}
  end

  def add_book(book)
    @books[book.id] = { book: book, borrowed_by: nil}
  end

  def mark_as_borrowed_by(book, user)
    @books[book.id][:borrowed_by] = user
  end

  def generate_id
    # omitted
  end
end

class Book
  attr_reader :title, :author, :serial, :id

  def initialize(title, author, serial, id)
    @title = title
    @author = author
    @serial = serial
    @id = id
  end
end
