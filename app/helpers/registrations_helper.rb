module RegistrationsHelper
  def presence_buttons(registration)
    yes_class  = registration.presence? ? "btn btn-info mr-10" : "btn btn-default mr-10"
    no_class   = registration.presence? ? "btn btn-default" : "btn btn-danger"
    yes_button = button_tag("Sim", class: yes_class, value: 'yes')
    no_button  = button_tag("Não", class: no_class, value: 'no')
    yes_button + no_button
  end
end
