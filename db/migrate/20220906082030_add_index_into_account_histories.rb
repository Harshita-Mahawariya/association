class AddIndexIntoAccountHistories < ActiveRecord::Migration[6.1]
  def change
    remove_reference :account_histories, :account
    add_reference :account_histories, :account, index: { unique: true }, foreign_key: true
  end
end