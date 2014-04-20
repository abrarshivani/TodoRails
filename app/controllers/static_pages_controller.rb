class StaticPagesController < ApplicationController

	def master
		render 'master'
	end

	def index
		render 'lists'
	end

	def task
		render 'tasks'
	end

end
