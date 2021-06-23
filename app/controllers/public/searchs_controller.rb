class Public::SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end
  
  private
    def search_for(model, content, method)
      if model == "genre"
        if method == "perfect"
          Genre.where(name: content)
        else
          User.where('name LIKE ?', '%'+content+'%')
        end
      elsif model == "project"
        if method == "perfect"
          Project.where(name: content)
        else
          Project.where("title LIKE ?", "%"+content+"%")
        end
      end
    end
end
