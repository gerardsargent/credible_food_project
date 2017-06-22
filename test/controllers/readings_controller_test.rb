require 'test_helper'

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading = readings(:one)
  end

  test "should get index" do
    get readings_url
    assert_response :success
  end

  test "should get new" do
    get new_reading_url
    assert_response :success
  end

  test "should create reading" do
    assert_difference('Reading.count') do
      post readings_url, params: { reading: { client: @reading.client, cust_id: @reading.cust_id, date_collected: @reading.date_collected, date_observed: @reading.date_observed, location: @reading.location, lt_id: @reading.lt_id, observed_by: @reading.observed_by, organisation: @reading.organisation, other_notes: @reading.other_notes, plants_desired: @reading.plants_desired, plants_present: @reading.plants_present } }
    end

    assert_redirected_to reading_url(Reading.last)
  end

  test "should show reading" do
    get reading_url(@reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_reading_url(@reading)
    assert_response :success
  end

  test "should update reading" do
    patch reading_url(@reading), params: { reading: { client: @reading.client, cust_id: @reading.cust_id, date_collected: @reading.date_collected, date_observed: @reading.date_observed, location: @reading.location, lt_id: @reading.lt_id, observed_by: @reading.observed_by, organisation: @reading.organisation, other_notes: @reading.other_notes, plants_desired: @reading.plants_desired, plants_present: @reading.plants_present } }
    assert_redirected_to reading_url(@reading)
  end

  test "should destroy reading" do
    assert_difference('Reading.count', -1) do
      delete reading_url(@reading)
    end

    assert_redirected_to readings_url
  end
end
