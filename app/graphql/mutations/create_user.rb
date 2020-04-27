class Mutations::CreateUser < Mutations::BaseMutation
    # accepting arguments
    argument :name, String, required: true
    argument :email, String, required: true

    # Fields to return after object creation
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    # # The magic resolve method
    # Its not any magic but when we have arguments specified,
    # we need to override this method with the arguments as params,
    # after which we run operations like saving,etc
    def resolve(name:, email:)
        user = User.new(name: name, email: email)
        if user.save
            {
                user: user,
                errors: []
            }
        else
            {
                user: nil,
                errors: users.errors.full_messages
            }
        end
    end
end

class Mutations::DeleteUser < Mutations::BaseMutation
    argument :id, ID, required: true
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(id:)
        user = User.find(id)
        if user.destroy
            {
                user: user,
                errors: []
            }
        else
            {
                user: nil,
                errors: users.errors.full_messages
            }
        end
    end
end