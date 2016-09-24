module CharacterHelper

	def campaign_options(character)
	    options_for_select([["No Campaign",'']] + (@campaigns ? @campaigns.map { |campaign| [campaign.name, campaign.id] }:[[]]), selected: character[:campaign_id])
	end

end
