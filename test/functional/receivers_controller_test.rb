require 'test_helper'

class ReceiversControllerTest < ActionController::TestCase
  setup do
    @receiver = receivers(:one)
  end

  test "should create receiver" do
    assert_difference('Receiver.count') do
      post :create, {
                      "email" => @receiver.email,
                      "name" => @receiver.name,
                      "regId" => "abcd"
                    }
    end
  end

  # test "should update receiver" do 
  #   put :update, {"regId" => "abcd", "newregId" => "1234"}
  # end

  # test "should destroy receiver" do
  #   assert_difference('Receiver.count', -1) do
  #     delete :destroy, gcm_device_id: "","regId" => "abcd"
  #   end
  # end
end
