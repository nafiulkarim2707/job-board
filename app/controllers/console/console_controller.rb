class Console::ConsoleController < ApplicationController
  layout 'console'

  http_basic_authenticate_with name: 'swi', password: 'h3110s0m3'


end
