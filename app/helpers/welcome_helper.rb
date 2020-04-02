module WelcomeHelper  
  
  def total_items
    content_tag :div, class:'navigation__items' do
      content_tag :p, session[:quantity]
    end if session[:quantity]
  end
end
