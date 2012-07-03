module ApplicationHelper
  
  def full_title(page_title)
    base_title= "AP Advanced Placement Exam Forums, Test Preparation"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def page_heading(page_header)
    base_header1= "Advanced Placement (AP)"
    base_header2= "Forum"
    if page_header.nil?
    else
      "#{base_header1} #{page_header} #{base_header2}"
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
   
   def user_pic(user)
     
     #replace user picture conditionals with these
     
   end
  
end
