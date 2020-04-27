# Define all the queries in the project
module Types
  class QueryType < Types::BaseObject
    # 1 - Adding users
    field :users, [Types::UserType], null: false

    # 1.1 Users Query
    def users
      User.all
    end

    # 2 - Adding one user
    field :user, Types::UserType, null: false do
      # Passing arguemts used to identify user
      argument :id, ID, required: true
    end

    # 2.1 - User Query
    def user(id:)
      User.find(id)
    end
  end
end