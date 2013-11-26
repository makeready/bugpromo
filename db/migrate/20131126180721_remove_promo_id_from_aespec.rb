class RemovePromoIdFromAespec < ActiveRecord::Migration
  def change
    remove_column :ae_specs, :promo_id
  end
end
