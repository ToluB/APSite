module ApplicationHelper
  
  def full_title(page_title)
    base_title= "AP Advanced Placement Exam Forums, Test Preparation"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def nav_link(link_text, link_path)
     class_name = current_page?(link_path) ? 'active' : ''

     content_tag(:li, :class => class_name) do
       link_to link_text, link_path
     end
   end
   
   def no_forum_nav?
     controller_name == 'invitations' || 
     controller_name == 'kases' && action_name == 'index' 
   end
  
end
