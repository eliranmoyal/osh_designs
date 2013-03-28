ActiveAdmin.register Order do
  filter :state  , :as => :select , :collection => ["unwatched","in progress"]

  scope :all, :default => true
    scope :unwatched
  scope :in_progress



  form do |f|
      f.inputs "Details" do
        f.input :state , :collection =>  ["unwatched","in progress"]
        f.input :expected_end ,:label => "Publish Post At"
        f.input :percentage
      end
      f.buttons
    end

end
