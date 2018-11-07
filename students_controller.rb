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

# update

# destroy
