require "rails_helper"

RSpec.describe Search do  
  let!(:book1) { create(:book) }
  let(:empty_params) { { query: "" } }
  let(:empty_query_instance) { Search.new(empty_params) }
  let!(:book2) { create(:book, :new_title) }  
  let(:search_params) { { query: book2.title } }  
  let(:search_instance) { Search.new(search_params) }  
     
  before { BooksIndex.reset }

  describe "#search" do
    context "with existent query" do
      subject { search_instance.search }

      it "returns search results based on the query" do
      
      expect(subject).not_to be_empty
      expect(subject.count).to eq(1)
    end
  end

    context "without a query" do
      subject { empty_query_instance.search }
      
      it "returns all books" do
        
        expect(subject).not_to be_empty
        expect(subject.count).to eq(2)
      end
    end
  end
end
