require "test_helper"

class RentalBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get rental_books_update_url
    assert_response :success
  end
end
