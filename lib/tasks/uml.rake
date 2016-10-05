# rake uml:generate
namespace :uml do
  desc "Generate a uml diagram based on Active Record models in /gorails/uml_gorails.pdf"
  task :generate do
	exec("rake erd filename='uml_gorails'")
  end
end