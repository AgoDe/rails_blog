require 'rails_helper'

RSpec.describe Category, type: :model do
    describe "Validations" do

        it "is valid with valid attributes" do
            @category = Category.new(name: "sports")
            expect(@category).to be_valid
        end

        it "name should be present" do
          @category = Category.new(name: " ")
          expect(@category).to_not be_valid
        end

        it "name should be unique" do
          Category.create!(:name=>"Foo")
          category = Category.new(:name=>"Foo")
          expect(category).to_not be_valid
          category.errors[:name].should include("has already been taken")
        end

        it "name should not be too long" do
          @category = Category.new(name: "a" * 26)
          expect(@category).to_not be_valid
        end

        it "name should not ben too short" do
          @category = Category.new(name: "aa")
          expect(@category).to_not be_valid
        end
    end

end
