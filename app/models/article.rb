class Article < ActiveRecord::Base
	#relationships declared here to other models in the app
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
	#has_attached_file method belongs to paperclip gem
	has_attached_file :image, styles: { medium: "350*350", thumb: "100*100" }
	#failure add this will result in MissingRequiredValidator error, as rails ver4.0 onwards you have to declare the attachments content type validation by including it.
	validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/jpg", "image/png"]

	#clubs two tags together
	def tag_lister
		tags.join(",")
	end

    #allows to create/use tags for each articles
	def tag_lister=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
   end
end
