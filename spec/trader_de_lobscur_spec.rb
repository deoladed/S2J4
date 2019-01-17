# frozen_string_literal: true

require_relative '../lib/trader_de_lobscur'

describe "the crypto_scrapper method" do


	it "should return an array" do
		expect(crypto_scrapper).is_a?(Array)
	end

	it "should return a hash in the array" do
		expect(crypto_scrapper[rand(300)]).is_a?(Hash)
	end

	it "should return a hash, and the hash is not nil" do
		expect(crypto_scrapper).not_to be_nil
	end

	it "a crypto shouldnt be nil nor zero" do
		expect(crypto_scrapper[0]["BTC"]).not_to be_nil
		expect(crypto_scrapper[0]["BTC"]).not_to be_zero
		expect(crypto_scrapper[2]["ETH"]).not_to be_nil
		expect(crypto_scrapper[2]["ETH"]).not_to be_zero
		expect(crypto_scrapper[7]["LTC"]).not_to be_nil
		expect(crypto_scrapper[7]["LTC"]).not_to be_zero
	end
end
