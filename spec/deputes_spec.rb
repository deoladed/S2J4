# frozen_string_literal: true

require_relative '../lib/deputes'

describe "the deputes method" do

	it "should return an array" do
		expect(deputes).is_a?(Array)
	end

	it "should return an array, and the array is not nil" do
		expect(deputes).not_to be_nil
	end

	it "should return a hash in the array" do
		expect(deputes[1]).is_a?(Hash)
	end

	it "the hashes in the array should have a name, surname and a mail" do
		expect(deputes[-1]["first_name"]).to eq("Matthias")
		expect(deputes[-1]["last_name"]).to eq("Fekl ")
		expect(deputes[-1]["email"]).to eq("mfekl@assemblee-nationale.fr")
	end
end


		