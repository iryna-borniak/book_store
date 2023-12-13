class BooksIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      title: {
        tokenizer: "keyword",
        filter: ["lowercase"]
      }
    }
  }

  index_scope Book  
  field :title, analyzer: "title"
end
