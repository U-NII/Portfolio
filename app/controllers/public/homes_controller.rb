class Public::HomesController < ApplicationController
    def top
        @projects = Project.all
    end
    
    def about
    end 
end
