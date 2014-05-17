class StaticPagesController < ApplicationController

	def master
		render 'master'
	end

	def login
		render 'login'
	end
	
	def list
		render 'lists'
	end

	def task
		render 'tasks'
	end

end
