require 'spec_helper'

describe User do
    context "should be invalid users without" do
        it "name"
        it "email"
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
