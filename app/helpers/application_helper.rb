module ApplicationHelper
    
    def my_name
          "James becker"  
    end
    
    
    def form_group_tag(errors, &block)
            if errors.any?
                content_tag :div, capture(&block), class: 'form-group has-error'
            else 
                content_tag :div, capture(&block), class: 'form-group'
            end
    end
    def avatar_url(user)
    if user == nil
        return
    else    
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
    end
    
end
