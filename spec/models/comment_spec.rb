require 'spec_helper'

describe Comment do

    it 'belongs to one article only' do
        should belong_to(:article)
    end

    describe 'create and add comments to an article' do

        let(:article) { Article.create(title: 'The best way to learn Ruby', text: 'The best way to learn Ruby is to use TDD.') }
        # let(:article) { build(:article) }

        it 'is valid with a commenter and body comment' do
            expect(article.comments.create(commenter: 'Benson', body: 'What a great article!')).to be_valid
        end

        it 'has 3 comments in the database when 3 valid comments are created' do
            bob = article.comments.create(commenter: 'Bob', body: 'thats bloody marvelous')
            mick = article.comments.create(commenter: 'Mick', body: 'not baddd hey')
            jeff = article.comments.create(commenter: 'Jeff', body: 'ripper story mate!')

            expect(article.comments.count).to eq(3)
        end

        it 'has no comments in the database if none are showing on the screen' do
            expect(article.comments.count).to eq(0)
        end

    end

end







