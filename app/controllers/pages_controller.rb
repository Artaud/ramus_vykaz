class PagesController < ApplicationController
	def statistika
		@projekt = Projekt.first
		@projekts = Projekt.all
		# @sum = Projekt.sum_by_month(5,2015)
	end
end
