module Resolvers
  class UserResolver < GraphQL::Schema::Resolver
    type [Types::UserType], null: false

    argument :id, Int, required: false

    def resolve(**kwargs)
      if kwargs[:id]
        [User.find(kwargs[:id])]
      else
        User.all
      end
    end
  end
end
