module Types
  class MutationType < Types::BaseObject
    # Field and mutation type
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
  end
end
