require_relative '../lib/trader_de_lobscur'

describe "the crypto_scrapper method" do

	it "should return a hash" do
		expect(crypto_scrapper).is_a?(Hash)
	end

	it "should return a hash, and the hash is not nil" do
		expect(crypto_scrapper).not_to be_nil
	end

	it "a crypto shouldnt be nil nor zero" do
		expect(crypto_scrapper["BTC"]).not_to be_nil
		expect(crypto_scrapper["BTC"]).not_to be_zero
		expect(crypto_scrapper["ETH"]).not_to be_nil
		expect(crypto_scrapper["ETH"]).not_to be_zero
		expect(crypto_scrapper["LTC"]).not_to be_nil
		expect(crypto_scrapper["LTC"]).not_to be_zero
	end
end