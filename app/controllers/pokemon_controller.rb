class PokemonController < ApplicationController

	#couldn't get the create to work. For some reason, I keep getting an error saying that 
	# rails could not find a "new" method even though I specified the route. I figured this controller would
	# be able to inherit the new method frmo the application controller, but I might just have a routing error or something.
	def create
		@pokemon = Pokemon.new({:name => (params[:pokemon])[:name]})
		# @pokemon.name = :name
		@pokemon.level = 1
		@pokemon.health = 100
		@pokemon.trainer = current_trainer
	    if @pokemon.save
			redirect_to trainer_path(current_trainer)
		else
			redirect_to pokemon_new_path

			flash[:error] = @pokemon.errors.full_messages.to_sentence
		end
	end

	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save
    	redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		@pokemon.save
		if @pokemon.health <= 0
			@pokemon.destroy
		end
    	redirect_to trainer_path(current_trainer)
	end

end
