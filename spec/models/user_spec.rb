require 'spec_helper'

describe User do
    context "should be invalid users" do
        describe "wrong name" do
            it "should have errors if name is nil" do
                expect(FactoryGirl.build :user, name: nil).to have(2).error_on(:name)
            end
            it "should have errors if name is blank" do
                expect(FactoryGirl.build :user, name: '').to have(2).error_on(:name)
            end
            it "should have errors if name is too short" do
                expect(FactoryGirl.build :user, name: 'foo bar').to have(1).error_on(:name)
            end
            it "should have errors if name is too long" do
                expect(FactoryGirl.build :user, name: ->{'foo bar'*20}).to have(1).error_on(:name)
            end
        end
        describe "wrong email" do
            it "should have errors if email is nil" do
                expect(FactoryGirl.build :user, email: nil).to have(2).error_on(:email)
            end
            it "should have errors if email is blank" do
                expect(FactoryGirl.build :user, email: '').to have(2).error_on(:email)
            end
            it "should have errors if email is not unique" do
                FactoryGirl.create :user, email: 'foo@bar.com'
                expect(FactoryGirl.build :user, email: 'foo@bar.com').to have(1).error_on(:email)
            end
            it "should have errors if email is not in the correct format" do
                expect(FactoryGirl.build :user, email: 'foo').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@.').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@com').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@.com').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@.com').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: '.foo.@.com').to have(1).error_on(:email)
            end
        end
        describe "wrong birthday" do
            it "should have error if user is to young" do
                birthday = lambda{ Time.now.to_date }
                expect(FactoryGirl.build :user, birthday: birthday.call).to have(1).error_on(:birthday)
                young_person = lambda{ birthday.call - 9.years }
                expect(FactoryGirl.build :user, birthday: young_person.call).to have(1).error_on(:birthday)
            end
            it "should have errors if birthday is not present" do
                expect(FactoryGirl.build :user, birthday: nil).to have(2).error_on(:birthday)
                expect(FactoryGirl.build :user, birthday: '').to have(2).error_on(:birthday)
            end
        end
        it "gcm_device_id"
        it "likes"
    end

    context "should be valid users because" do
        describe "valid name and email" do
            it "should be valid" do
                expect(FactoryGirl.build :user).to be_valid
                expect(FactoryGirl.build :user, email: 'foo@bar.com').to be_valid
                expect(FactoryGirl.build :user, name: 'foo bar example').to be_valid
            end
        end
        describe "valid birthday" do
            it "should be valid if is at least 10 years old" do
                birthday = lambda{ (Time.now - 11.years).to_date }
                expect(FactoryGirl.build :user, birthday: birthday.call).to be_valid
                old_person = lambda{ Time.now.to_date - 10.years }
                expect(FactoryGirl.build :user, birthday: old_person.call).to be_valid
            end
        end
    end

    context "should have entities as likes" do
        describe "user has_many entities" do
            it "can has_many entities" do
                expect( FactoryGirl.create(:user_with_likes).entities ).to have(20).records
                expect( FactoryGirl.create(:user_with_likes, number_of_likes: 1).entities ).to have(1).record
            end
        end
    end

    context "should have coupons to redeem" do
        describe "user has many coupons" do
            it "can has_many coupons" do
                expect( FactoryGirl.create(:user_with_coupons).coupons ).to have(20).records
                expect( FactoryGirl.create(:user_with_coupons, number_of_coupons: 1).coupons ).to have(1).record
            end
        end
    end
end
