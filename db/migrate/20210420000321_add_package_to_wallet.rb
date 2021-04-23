class AddPackageToWallet < ActiveRecord::Migration[5.0]
  def change
    change_table :wallets do |t|
      t.string :package
    end
  end
end
