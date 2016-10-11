# -*- encoding : utf-8 -*-

module BingAdsApi

	# Public : Define a campaign
	#
	# Author:: jlopezn@neonline.cl
	#
	# Examples
	#   campaign = BingAdsApi::Campaign.new(
	#     :budget_type => BingAdsApi::Campaign::DAILY_BUDGET_STANDARD,
	#     :conversion_tracking_enabled => "false",
	#     :daily_budget => 2000,
	#     :daylight_saving => "false",
	#     :description => name + " first description",
	#     :monthly_budget => 5400,
	#     :name => name + " first name",
	#     :status => BingAdsApi::Campaign::PAUSED,
	#     :time_zone => BingAdsApi::Campaign::SANTIAGO)
	#   # => <BingAdsApi::Campaign>
	class Campaign < BingAdsApi::DataObject
		include BingAdsApi::TimeZone
		include BingAdsApi::BudgetLimitType
		include BingAdsApi::CampaignStatus
		include BingAdsApi::PricingModel


		attr_accessor :id,
			:budget_type,
			:conversion_tracking_enabled,
			:daily_budget,
			:daylight_saving,
			:description,
			:monthly_budget,
			:name,
			:status,
			:time_zone,
			:url_custom_parameters

		def initialize(attributes={})
			super(attributes)
			set_custom_attributes(attributes)
		end

		private

			def set_custom_attributes(attributes)
				custom_params = attributes[:url_custom_parameters].
					fetch(:parameters, {}).
					fetch(:custom_parameter, [])
				custom_params = [custom_params] if custom_params.is_a?(Hash)
				self.url_custom_parameters = custom_params
			end

			# Internal: Retrieve the ordered array of keys corresponding to this data
			# object.
			#
			# Author: alex.cavalli@offers.com
			def get_key_order
				super.concat(BingAdsApi::Config.instance.
					campaign_management_orders['campaign'])
			end

	end
end
