module Resolvers
  class PostResolver < GraphQL::Schema::Resolver
    type [Types::PostType], null: false

    argument :user_id, Int, required: false

    def resolve(**kwargs)
      if kwargs[:user_id]
        Post.where(user: kwargs[:user_id]).all
      else
        Post.all
      end
    end
  end
end
