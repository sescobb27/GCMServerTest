require 'spec_helper'

describe Entity do
  context "should be invalid entities" do
    describe "wrong email" do
        it "should have errors if email is nil" do
            expect(FactoryGirl.build :entity, entity_email: nil).to have(3).error_on(:entity_email)
        end
        it "should have errors if email is blank" do
            expect(FactoryGirl.build :entity, entity_email: '').to have(3).error_on(:entity_email)
        end
        it "should have errors if email is not unique" do
            FactoryGirl.create :entity, entity_email: 'foo@bar.com'
            expect(FactoryGirl.build :entity, entity_email: 'foo@bar.com').to have(1).error_on(:entity_email)
        end
        it "should have errors if email is not in the correct format" do
            expect(FactoryGirl.build :entity, entity_email: 'foo').to have(2).error_on(:entity_email)
            expect(FactoryGirl.build :entity, entity_email: 'foo@').to have(2).error_on(:entity_email)
            expect(FactoryGirl.build :entity, entity_email: 'foo@.').to have(2).error_on(:entity_email)
            expect(FactoryGirl.build :entity, entity_email: 'foo@com').to have(2).error_on(:entity_email)
            expect(FactoryGirl.build :entity, entity_email: 'foo@.com').to have(2).error_on(:entity_email)
            expect(FactoryGirl.build :entity, entity_email: 'foo@.com').to have(2).error_on(:entity_email)
            expect(FactoryGirl.build :entity, entity_email: '.foo.@.com').to have(1).error_on(:entity_email)
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
        it "should have errors if telephone number is nil" do
            expect(FactoryGirl.build :entity, entity_telephone_number: nil).to have(2).error_on(:entity_telephone_number)
        end
        it "should have errors if telephone number is blank" do
            expect(FactoryGirl.build :entity, entity_telephone_number: '').to have(2).error_on(:entity_telephone_number)
        end
        it "should have errors if telephone number is not in the correct format" do
            expect(FactoryGirl.build :entity, entity_telephone_number: '999 999 999').to have(1).error_on(:entity_telephone_number)
        end
    end
    describe "invalid categories" do
        it "should have errors if doesn't have categories" do
            expect( FactoryGirl.create(:entity_with_categories).categories ).to have(1).error_on :categories
        end
    end
  end
  context "should be valid entities" do
    describe "valid entities" do
        it "valid entity" do
            expect(FactoryGirl.build :entity).to be_valid
        end
        it "valid name" do
            expect(FactoryGirl.build :entity, entity_name: 'San Carbon').to be_valid
        end
        it "valid telephone number" do
            expect(FactoryGirl.build :entity, entity_telephone_number: '9999999').to be_valid
            expect(FactoryGirl.build :entity, entity_telephone_number: '999-99-99').to be_valid
        end
        it "valid entity email" do
            expect(FactoryGirl.build :entity, entity_email: 'foo@bar.com').to be_valid
        end
    end
  end


  context "should have coupons" do
      describe "has_many coupons" do
          it "can create coupons" do
              expect( FactoryGirl.create(:entity_with_coupons).coupons ).to have(20).records
              expect( FactoryGirl.create(:entity_with_coupons, number_of_coupons: 1).coupons ).to have(1).record
          end
      end
  end

  context "should have users" do
      describe "has_many users" do
          it "has many users" do
              expect( FactoryGirl.create(:entity_with_users).users ).to have(20).records
              expect( FactoryGirl.create(:entity_with_users, number_of_users: 1).users ).to have(1).record
          end
      end
  end

  context "should have many categories" do
      describe "has_many categories" do
          it "has many categories" do
              expect( FactoryGirl.create(:entity_with_categories, number_of_categories: 3).categories ).to have(4).records
          end
      end
  end
end
