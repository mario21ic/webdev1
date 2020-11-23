class ApplicationController < ActionController::Base
    @menu = Variable.all.where(tipo_variable: 'Menú')
end
