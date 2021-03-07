module RatingsHelper
  def rating_form_header(f)
    out = ''
    if @book
      out << 'Book: ' + @book.title
    else
      out << (f.label  'Book:')
      out << (f.select :book_id, @books)
    end
    out.html_safe
  end
end
