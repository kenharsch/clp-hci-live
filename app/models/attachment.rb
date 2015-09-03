class Attachment < ActiveRecord::Base
	belongs_to :project
	has_attached_file :record,
						styles: { thumb: ["48x48#", :jpg] }
	validates_attachment :record,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf", "application/doc", "application/docx"] }
end
