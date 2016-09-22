module CampaignsHelper

	def game_system_options(campaign)
    options_for_select([["Select Game System",'']] + (@game_systems ? @game_systems.map { |game_system| [game_system.name, game_system.id] }:[[]]), selected: campaign[:game_system_id])
	end

end
