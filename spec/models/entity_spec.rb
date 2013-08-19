require 'spec_helper'

describe Entity do
  context "should be invalid entities" do
    describe "wrong email" do
        it "should have errors if email is nil" do
            pending
        end
        it "should have errors if email is blank" do
            pending
        end
        it "should have errors if email is not in the correct format" do
            pending
        end
    end
    describe "wrong name" do
        it "should have errors if name is nil" do
            expect(FactoryGirl.build :entity, entity_name: nil).to have(2).error_on(:entity_name)
        end
        it "should have errors if name is blank" do
            expect(FactoryGirl.build :entity, entity_name: '').to have(2).error_on(:entity_name)
        end
        it "should have errors if name is too short" do
            expect(FactoryGirl.build :entity, entity_name: 'f').to have(1).error_on(:entity_name)
        end
        it "should have errors if name is too long" do
            expect(FactoryGirl.build :entity, entity_name: ->{'foo bar'*30}).to have(1).error_on(:entity_name)
        end
        it "should have errors if name is not unique" do
            FactoryGirl.create :entity, entity_name: 'foo bar'
            expect(FactoryGirl.build :entity, entity_name: 'foo bar').to have(1).error_on(:entity_name)
        end
    end
    describe "wrong telephone" do
    end
  end
  context "should be valid entities" do
    
  end
end
