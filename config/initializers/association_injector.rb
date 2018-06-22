# puts "///////////////////////////////////////////////////////////"
# "FileManager".constantize.class_eval "has_many :buckets"
# "Bucket".constantize.class_eval "has_many :user_files"
# "Bucket".constantize.class_eval "belongs_to :file_manager, dependent: :destroy"

puts '######################################################################'
puts '######################################################################'
puts '######################################################################'

mappings = YAML.load_file("#{Rails.root}/config/mappings.yml")

mappings.each do |model, methods|
  eval("#{model} = Class.new ActiveRecord::Base")
  # pija = model.constantize
  # eval("#{model} = Class.new ActiveRecord::Base") do
  # end
  # byebug
  # model.constantize.class_eval do
    # include ActiveRecord::Base
    # include ActiveModel::Validations
  #   include ActiveModel::Conversion
  #   extend ActiveModel::Naming
    # extend ActiveSupport::Concern
  #end

  associations = []

  methods.each do |relation, params|
    sentence = relation + ' :' + params.first
    if params.count > 1
      params[1].each do |key, value|
        sentence += ', ' + key + ': :' + value.to_s
      end
    end
    associations << sentence
  end

  associations.each do |association|
    model.constantize.class_eval association

    puts model.constantize
    # puts "\t"+ association
  end

end

# puts "######################################################################"
# puts "######################################################################"
# puts "######################################################################"
