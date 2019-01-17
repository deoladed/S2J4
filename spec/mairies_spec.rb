require_relative '../lib/mairies'

describe "the crypto_scrapper method" do

	it "should return a hash" do
		expect(get_townhall_email).is_a?(Hash)
	end

	it "should return a hash, and the hash is not nil" do
		expect(get_townhall_email).not_to be_nil
	end

	it "a crypto shouldnt be nil nor zero" do
		expect(get_townhall_email["Wy-dit-joli-village"]).to eq("mairie.wy-dit-joli-village@wanadoo.fr")
		expect(get_townhall_email["Villaines-sous-bois"]).to eq("mairie@villaines-sous-bois.fr")
	end
end