class SearchController < ApplicationController

#story 1

#if you want this story to run, replace the local in the view with an ivar

  # def index
  #   student_data = Faraday.get "http://hogwarts-it.herokuapp.com/api/v1/house/#{params[:house]}?api_key=alohamora"
  #   student_house_json = JSON.parse(student_data.body, symbolize_names: true)
  #   @students = student_house_json[:data][0][:attributes][:students]
  # end

  #the faraday request and the parse should be pushed into private methods at the very least
  #and into a service and facade
  #instance variable should also be a render local
  #will revisit after finishing second story
  def index
    render locals: {
      facade: StudentFacade.new(params[:house])
    }
  end
end
