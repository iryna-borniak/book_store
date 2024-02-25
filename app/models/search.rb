class Search
  def initialize(attributes)
    @attributes = attributes
  end

  def search
    if @attributes[:query].present?
      BooksIndex.query(query_string: {fields: [:title], query: @attributes[:query], default_operator: "and"}).records
    else
      Book.ordered_by_title
    end
  end
end
