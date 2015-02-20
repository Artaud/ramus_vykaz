class PagesController < ApplicationController
	def statistika
		@projekts = Projekt.all
	end
end
