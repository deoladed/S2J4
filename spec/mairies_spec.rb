require_relative '../lib/mairies'

describe "the get_townhall_email method" do

	it "should return a hash" do
		expect(get_townhall_email(get_townhall_urls)).is_a?(Hash)
	end

	it "should return a hash, and the hash is not nil" do
		expect(get_townhall_email(get_townhall_urls)).not_to be_nil
	end

	it "should contain some emails" do
		expect(get_townhall_email(get_townhall_urls)["Wy-dit-joli-village"]).to eq("mairie.wy-dit-joli-village@wanadoo.fr")
		expect(get_townhall_email(get_townhall_urls)["Villaines-sous-bois"]).to eq("mairie@villaines-sous-bois.fr")
	end
end
