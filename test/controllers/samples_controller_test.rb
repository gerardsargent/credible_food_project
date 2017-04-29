require 'test_helper'

class SamplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sample = samples(:one)
  end

  test "should get index" do
    get samples_url
    assert_response :success
  end

  test "should get new" do
    get new_sample_url
    assert_response :success
  end

  test "should create sample" do
    assert_difference('Sample.count') do
      post samples_url, params: { sample: { actinobacteria: @sample.actinobacteria, actinobacteria_dilution: @sample.actinobacteria_dilution, actinobacteria_dilution: @sample.actinobacteria_dilution, actinobacteria_length_cm: @sample.actinobacteria_length_cm, actinobacteria_mean: @sample.actinobacteria_mean, actinobacteria_micrograms: @sample.actinobacteria_micrograms, actinobacterial_standard_deviation: @sample.actinobacterial_standard_deviation, amoebae: @sample.amoebae, amoebae_dilution: @sample.amoebae_dilution, amoebae_mean: @sample.amoebae_mean, amoebae_protozoa: @sample.amoebae_protozoa, amoebae_standard_deviation: @sample.amoebae_standard_deviation, bacterial_dilution: @sample.bacterial_dilution, bacterial_mean: @sample.bacterial_mean, bacterial_number: @sample.bacterial_number, bacterial_size_shape: @sample.bacterial_size_shape, bacterial_standard_deviation: @sample.bacterial_standard_deviation, ciliates: @sample.ciliates, ciliates_dilution: @sample.ciliates_dilution, ciliates_mean: @sample.ciliates_mean, ciliates_protozoa: @sample.ciliates_protozoa, ciliates_standard_deviation: @sample.ciliates_standard_deviation, fb_biomass_ratio: @sample.fb_biomass_ratio, flagellate: @sample.flagellate, flagellate_dilution: @sample.flagellate_dilution, flagellate_mean: @sample.flagellate_mean, flagellate_protozoa: @sample.flagellate_protozoa, flagellate_standard_deviation: @sample.flagellate_standard_deviation, fungal_strands_cm: @sample.fungal_strands_cm, fungi: @sample.fungi, fungi_calculation: @sample.fungi_calculation, fungi_colour: @sample.fungi_colour, fungi_diameter: @sample.fungi_diameter, fungi_dilution: @sample.fungi_dilution, fungi_mean: @sample.fungi_mean, fungi_micrograms: @sample.fungi_micrograms, fungi_standard_deviation: @sample.fungi_standard_deviation, gps: @sample.gps, micrograms: @sample.micrograms, nematodes: @sample.nematodes, nematodes_dilution: @sample.nematodes_dilution, nematodes_mean: @sample.nematodes_mean, nematodes_protozoa: @sample.nematodes_protozoa, no_bacteria_per_gram: @sample.no_bacteria_per_gram, oomycetes: @sample.oomycetes, oomycetes_calculation: @sample.oomycetes_calculation, oomycetes_colour: @sample.oomycetes_colour, oomycetes_diameter: @sample.oomycetes_diameter, oomycetes_dilution: @sample.oomycetes_dilution, oomycetes_mean: @sample.oomycetes_mean, oomycetes_micrograms: @sample.oomycetes_micrograms, oomycetes_number_per_gram: @sample.oomycetes_number_per_gram, oomycetes_standard_deviation: @sample.oomycetes_standard_deviation, reading_number: @sample.reading_number, sample_date: @sample.sample_date, sample_id: @sample.sample_id, user_id: @sample.user_id } }
    end

    assert_redirected_to sample_url(Sample.last)
  end

  test "should show sample" do
    get sample_url(@sample)
    assert_response :success
  end

  test "should get edit" do
    get edit_sample_url(@sample)
    assert_response :success
  end

  test "should update sample" do
    patch sample_url(@sample), params: { sample: { actinobacteria: @sample.actinobacteria, actinobacteria_dilution: @sample.actinobacteria_dilution, actinobacteria_dilution: @sample.actinobacteria_dilution, actinobacteria_length_cm: @sample.actinobacteria_length_cm, actinobacteria_mean: @sample.actinobacteria_mean, actinobacteria_micrograms: @sample.actinobacteria_micrograms, actinobacterial_standard_deviation: @sample.actinobacterial_standard_deviation, amoebae: @sample.amoebae, amoebae_dilution: @sample.amoebae_dilution, amoebae_mean: @sample.amoebae_mean, amoebae_protozoa: @sample.amoebae_protozoa, amoebae_standard_deviation: @sample.amoebae_standard_deviation, bacterial_dilution: @sample.bacterial_dilution, bacterial_mean: @sample.bacterial_mean, bacterial_number: @sample.bacterial_number, bacterial_size_shape: @sample.bacterial_size_shape, bacterial_standard_deviation: @sample.bacterial_standard_deviation, ciliates: @sample.ciliates, ciliates_dilution: @sample.ciliates_dilution, ciliates_mean: @sample.ciliates_mean, ciliates_protozoa: @sample.ciliates_protozoa, ciliates_standard_deviation: @sample.ciliates_standard_deviation, fb_biomass_ratio: @sample.fb_biomass_ratio, flagellate: @sample.flagellate, flagellate_dilution: @sample.flagellate_dilution, flagellate_mean: @sample.flagellate_mean, flagellate_protozoa: @sample.flagellate_protozoa, flagellate_standard_deviation: @sample.flagellate_standard_deviation, fungal_strands_cm: @sample.fungal_strands_cm, fungi: @sample.fungi, fungi_calculation: @sample.fungi_calculation, fungi_colour: @sample.fungi_colour, fungi_diameter: @sample.fungi_diameter, fungi_dilution: @sample.fungi_dilution, fungi_mean: @sample.fungi_mean, fungi_micrograms: @sample.fungi_micrograms, fungi_standard_deviation: @sample.fungi_standard_deviation, gps: @sample.gps, micrograms: @sample.micrograms, nematodes: @sample.nematodes, nematodes_dilution: @sample.nematodes_dilution, nematodes_mean: @sample.nematodes_mean, nematodes_protozoa: @sample.nematodes_protozoa, no_bacteria_per_gram: @sample.no_bacteria_per_gram, oomycetes: @sample.oomycetes, oomycetes_calculation: @sample.oomycetes_calculation, oomycetes_colour: @sample.oomycetes_colour, oomycetes_diameter: @sample.oomycetes_diameter, oomycetes_dilution: @sample.oomycetes_dilution, oomycetes_mean: @sample.oomycetes_mean, oomycetes_micrograms: @sample.oomycetes_micrograms, oomycetes_number_per_gram: @sample.oomycetes_number_per_gram, oomycetes_standard_deviation: @sample.oomycetes_standard_deviation, reading_number: @sample.reading_number, sample_date: @sample.sample_date, sample_id: @sample.sample_id, user_id: @sample.user_id } }
    assert_redirected_to sample_url(@sample)
  end

  test "should destroy sample" do
    assert_difference('Sample.count', -1) do
      delete sample_url(@sample)
    end

    assert_redirected_to samples_url
  end
end
