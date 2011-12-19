Sequel::Model.plugin :timestamps
Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :username, :unique => true, :null => false
      String :password, :null => false
      timestamp :created_at
      timestamp :updated_at
    end

    create_table :statuses do
      primary_key :id
      foreign_key :user_id, :users
      String :text
      timestamp :created_at
      timestamp :updated_at
    end
  end
end
