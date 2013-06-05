class ChangeCouponNameToCoupons < ActiveRecord::Migration
  def up
    change_column :coupons, :coupon_name, :string, limit: 50
    change_column :coupons, :coupon_msg, :string, limit: 200
    change_column :categories, :category_name, :string, limit: 50
    change_column :entities, :entity_name, :string, limit: 50
    change_column :entities, :entity_email, :string, limit: 70
    change_column :users, :name, :string, limit: 80
    change_column :users, :email, :string, limit: 70
  end

  def down
  end
end
