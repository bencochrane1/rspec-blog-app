require 'spec_helper'


describe Article do


    it 'has a valid factory' do
        expect(build(:article)).to be_valid
    end


    it 'is valid with a title of 5+ characters and text of 20+ chars' do
        article = build(:article)

        expect(article.title).to be_a_kind_of(String)
        expect(article.text).to be_a_kind_of(String)

        expect(article.title.length).to be >= 5
        expect(article.text.length).to be >= 20

        expect(article).to be_valid
    end


    it 'is invalid without a title' do
        expect(build(:article, title: nil)).to have(2).errors_on(:title)
    end

    it 'is invalid without text that is at least 20 characters long' do
        expect(build(:article, text: nil)).to have(2).errors_on(:text)
    end

    it 'has many comments' do
        should have_many(:comments)
    end
end