module AppearancesHelper

	def character_options
    options_for_select([["Select Character",'']] + (@characters ? @characters.map { |character| [character.name, character.id] }:[[]]))
	end

end