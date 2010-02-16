# Controller for (mostly) static content
class StaticController < ApplicationController
  caches_page :about, :faq, :get_involved

  # TODO: Once we've moved to Rails 3 we can move these redirects completely into the routes file
  def old_about
    redirect_to :action => "about"
  end
  
  def old_faq
    redirect_to :action => "faq"
  end
  
  def old_get_involved
    redirect_to :action => "get_involved"
  end
  
  def about
    @page_title = "About"
    
    @authorities = Authority.active.find(:all, :order => "full_name")
  end
  
  def faq
    @page_title = "Frequently asked questions"
  end
  
  def get_involved
    @page_title = "Get involved"
  end
end
