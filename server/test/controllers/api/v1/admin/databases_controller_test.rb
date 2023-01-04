require "test_helper"

class Api::V1::Admin::DatabasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_admin_database = admin_databases(:one)
  end

  test "should get index" do
    get api_v1_admin_databases_url, as: :json
    assert_response :success
  end

  test "should create api_v1_admin_database" do
    assert_difference("Admin::Database.count") do
      post api_v1_admin_databases_url, params: { 
        api_v1_admin_database: { 
          hostname: @api_v1_admin_database.hostname, 
          name: @api_v1_admin_database.name, 
          password: @api_v1_admin_database.password_digest, 
          password_confirmation: @api_v1_admin_database.password_digest, 
          port: @api_v1_admin_database.port, 
          schema: @api_v1_admin_database.schema, 
          username: @api_v1_admin_database.username 
        } 
      }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_admin_database" do
    get api_v1_admin_database_url(@api_v1_admin_database), as: :json
    assert_response :success
  end

  test "should update api_v1_admin_database" do
    patch api_v1_admin_database_url(@api_v1_admin_database), params: { 
      api_v1_admin_database: { 
        hostname: @api_v1_admin_database.hostname, 
        name: @api_v1_admin_database.name, 
        password: @api_v1_admin_database.password_digest, 
        password_confirmation: @api_v1_admin_database.password_digest, 
        port: @api_v1_admin_database.port, 
        schema: @api_v1_admin_database.schema, 
        username: @api_v1_admin_database.username 
      } 
    }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_admin_database" do
    assert_difference("Admin::Database.count", -1) do
      delete api_v1_admin_database_url(@api_v1_admin_database), as: :json
    end

    assert_response :no_content
  end
end
