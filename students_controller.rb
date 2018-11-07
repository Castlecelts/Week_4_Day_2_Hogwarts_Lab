require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/hogwarts' do
  @student_list = Student.all()
  erb(:index)
end

# new
get '/hogwarts/new' do
  @houses = House.all()
  erb(:new)
end
# create
post '/hogwarts' do
  @new_student = Student.new( params )
  @new_student.save
  erb(:create)
end
# show
get '/hogwarts/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end
# edit
get '/hogwarts/:id/edit' do
  @houses = House.all()
  @student = Student.find(params[:id])
  erb(:edit)
end
# update
post '/hogwarts/:id' do
  student = Student.new( params )
  student.update
  redirect to 'hogwarts/' + params[:id]
end

# destroy
post '/hogwarts/:id/delete' do
  @student = Student.find( params[:id] )
  @student.delete
  erb(:delete)
  # redirect to 'hogwarts'
end
