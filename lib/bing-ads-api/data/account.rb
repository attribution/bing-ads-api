module BingAdsApi
	class Account < BingAdsApi::DataObject
		include BingAdsApi::AccountLifeCycleStatuses

		attr_accessor :id, :account_type, :name, :number, :pause_reason, :country_code, :currency_type,
			:parent_customer_id, :account_life_cycle_status, :time_zone, :forward_compatibility_map,
			:time_stamp

		private

		def get_key_order
			super.concat(BingAdsApi::Config.instance.
				customer_management_orders['account'])
		end
	end
end
