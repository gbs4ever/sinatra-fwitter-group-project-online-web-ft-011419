require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
#  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use Rack::MethodOverride

use TweetsController
use UsersController 
<<<<<<< HEAD
run ApplicationController
=======
>>>>>>> d85312a3b3534a171b8d48706a00ddc5660efc02
