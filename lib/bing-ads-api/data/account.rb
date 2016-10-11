module BingAdsApi
	class Account < BingAdsApi::DataObject
		include BingAdsApi::AccountLifeCycleStatuses

		attr_accessor :id, :account_type, :name, :number, :pause_reason, :country_code, :currency_type,
			:parent_customer_id, :account_life_cycle_status, :time_zone, :forward_compatibility_map,
			:time_stamp

		TZ_MAPPING = {
			"AbuDhabiMuscat" => "Asia/Muscat",
			"Adelaide" => "Australia/Adelaide",
			"Alaska" => "America/Anchorage",
			"Almaty_Novosibirsk" => "Asia/Almaty",
			"AmsterdamBerlinBernRomeStockholmVienna" => "Europe/Berlin",
			"Arizona" => "America/Phoenix",
			"AstanaDhaka" => "Asia/Dhaka",
			"AthensBuckarestIstanbul" => "Asia/Istanbul",
			"AtlanticTimeCanada" => "Canada/Atlantic",
			"AucklandWellington" => "Pacific/Auckland",
			"Azores" => "Atlantic/Azores",
			"Baghdad" => "Asia/Baghdad",
			"BakuTbilisiYerevan" => "Asia/Baku",
			"BangkokHanoiJakarta" => "Asia/Bangkok",
			"BeijingChongqingHongKongUrumqi" => "Asia/Shanghai",
			"BelgradeBratislavaBudapestLjubljanaPrague" => "Europe/Budapest",
			"BogotaLimaQuito" => "America/Bogota",
			"Brasilia" => "America/Sao_Paulo",
			"Brisbane" => "Australia/Brisbane",
			"BrusselsCopenhagenMadridParis" => "Europe/Paris",
			"Bucharest" => "Europe/Bucharest",
			"BuenosAiresGeorgetown" => "America/Argentina/Buenos_Aires",
			"Cairo" => "Africa/Cairo",
			"CanberraMelbourneSydney" => "Australia/Sydney",
			"CapeVerdeIsland" => "Atlantic/Cape_Verde",
			"CaracasLaPaz" => "America/Caracas",
			"CasablancaMonrovia" => "Africa/Casablanca",
			"CentralAmerica" => "America/Mexico_City",
			"CentralTimeUSCanada" => "America/Chicago",
			"ChennaiKolkataMumbaiNewDelhi" => "Asia/Kolkata",
			"ChihuahuaLaPazMazatlan" => "America/Chihuahua",
			"Darwin" => "Australia/Darwin",
			"EasternTimeUSCanada" => "America/New_York",
			"Ekaterinburg" => "Asia/Yekaterinburg",
			"FijiKamchatkaMarshallIsland" => "Pacific/Fiji",
			"Greenland" => "America/Godthab",
			"GreenwichMeanTimeDublinEdinburghLisbonLondon" => "Europe/London",
			"GuadalajaraMexicoCityMonterrey" => "America/Mexico_City",
			"GuamPortMoresby" => "Pacific/Guam",
			"HararePretoria" => "Africa/Harare",
			"Hawaii" => "	Pacific/Honolulu",
			"HelsinkiKyivRigaSofiaTallinnVilnius" => "Europe/Helsinki",
			"Hobart" => "Australia/Hobart",
			"IndianaEast" => "America/Indiana/Indianapolis",
			"InternationalDateLineWest" => "Etc/GMT+12",
			"IrkutskUlaanBataar" => "Asia/Ulaanbaatar",
			"IslandamabadKarachiTashkent" => "Asia/Tashkent",
			"Jerusalem" => "Asia/Jerusalem",
			"Kabul" => "Asia/Kabul",
			"Kathmandu" => "Asia/Kathmandu",
			"Krasnoyarsk" => "Asia/Krasnoyarsk",
			"KualaLumpurSingapore" => "Singapore",
			"KuwaitRiyadh" => "Asia/Kuwait",
			"MagadanSolomonIslandNewCaledonia" => "Asia/Magadan",
			"MidAtlantic" => "America/Goose_Bay",
			"MidwayIslandand_Samoa" => "Pacific/Pago_Pago",
			"MoscowStPetersburgVolgograd" => "Europe/Moscow",
			"MountainTime_US_Canada" => "America/Denver",
			"Nairobi" => "Africa/Nairobi",
			"Newfoundland" => "America/St_Johns",
			"Nukualofa" => "Pacific/Tongatapu",
			"OsakaSapporoTokyo" => "Asia/Tokyo",
			"PacificTimeUSCanadaTijuana" => "America/Los_Angeles",
			"Perth" => "Australia/Perth",
			"Rangoon" => "Asia/Rangoon",
			"Santiago" => "America/Santiago",
			"SarajevoSkopjeWarsawZagreb" => "Europe/Warsaw",
			"Saskatchewan" => "America/Regina",
			"Seoul" => "Asia/Seoul",
			"SriJayawardenepura" => "Asia/Colombo",
			"Taipei" => "Asia/Taipei",
			"Tehran" => "Asia/Tehran",
			"Vladivostok" => "Asia/Vladivostok",
			"WestCentralAfrica" => "Africa/Lagos",
			"Yakutsk" => "Asia/Yakutsk"
		}

		def iana_time_zone
			TZ_MAPPING[self.time_zone]
		end

		private

		def get_key_order
			super.concat(BingAdsApi::Config.instance.
				customer_management_orders['account'])
		end
	end
end
