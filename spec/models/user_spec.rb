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
            it "should have errors if email not has the correct format" do
                expect(FactoryGirl.build :user, email: 'foo').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@.').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@com').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@.com').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: 'foo@.com').to have(1).error_on(:email)
                expect(FactoryGirl.build :user, email: '.foo.@.com').to have(1).error_on(:email)
            end
        end
        it "birthday"
        it "gcm_device_id"
        it "likes"
        it "unique email"
        it "valid email format"
        it "valid name's length"
    end

    context "should be valid users because" do
        it "has valid name"
        it "has valid email"
        it "has valid birthday"
        it "has gcm_device_id"
        it "has likes"
        it "has a unique email"
        it "has a valid email format"
        it "has a valid name's length"
    end
end
