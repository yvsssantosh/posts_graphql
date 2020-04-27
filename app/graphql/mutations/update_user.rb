class Mutations::UpdateUser < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(id:, name: nil, email: nil)
        user = User.find(id)
        if email == nil
            email = user.email
        end
        if name == nil
            name = user.name
        end
        if user.update(name: name, email: email)
            {
                user: user,
                errors: []
            }
        else
            {
                user: user,
                errors: user.errors.full_messages
            }
        end
    end
end