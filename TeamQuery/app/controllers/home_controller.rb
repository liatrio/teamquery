class HomeController < ApplicationController
   def index
     # don't need to do anything here (too simple of an application). Usually will do work here.
     if current_user
       @nav_company = Company.find_by id: current_user.company_id
     end
   end
end
