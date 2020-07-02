#Placeholder for a model

class Article < ActiveRecord::Base
    validates_presence_of :title, :content

end