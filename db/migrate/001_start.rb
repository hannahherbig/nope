Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :username, :unique => true, :null => false
      String :password, :null => false
      Time :created_at, :null => false
    end

    create_table :statuses do
      primary_key :id
      foreign_key :user_id, :users
      String :text
      Time :created_at
    end
  end
end
