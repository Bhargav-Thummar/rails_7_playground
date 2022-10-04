module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :users, [Types::UserType],
      null: false,
      description: "An fields added by the generator for Users"
    def users
      User.includes(:company)
    end

    field :user, Types::UserType,
    null: false,
    description: "An fields added by the generator for Users" do
      argument :id, ID
    end
    def user(id:)
      User.includes(:company).find(id)
    end

    # example
    # {
    #   userWithCompanyId(companyId: 1) {
    #     id
    #     email
    #     company {
    #       id
    #       name
    #     }
    #   }
    # }
    field :userWithCompanyId, Types::UserType,
    null: false,
    description: "An fields added by the generator for Users" do
      argument :companyId, ID
    end
    def userWithCompanyId(companyId:)
      User.includes(:company).find_by(company_id: companyId)
    end

    field :companies, [Types::CompanyType],
      null: false,
      description: "An fields added by the generator for Companies"
    def companies
      Company.all
    end
  end
end
