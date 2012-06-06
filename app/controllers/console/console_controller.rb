class Console::ConsoleController < ApplicationController
  layout 'console'

  http_basic_authenticate_with name: 'swi', password: 'h3110s0m3'

  def clear_all_cache
    CacheUtil.invalidate_caches
    redirect_to :back
  end
end
