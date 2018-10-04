puts 'Creating Classes and relations'

mappings = YAML.load_file("#{Rails.root}/config/mappings.yml")

mappings.each do |model, methods|
  eval("#{model} = Class.new ActiveRecord::Base")

  associations = []
  methods.each do |relation, params|

    sentence = ''

    params.each_with_index do |param, i|
      sentence = relation + ' :' + param if (param.is_a? String)

      if params[i + 1].is_a? Hash
        sentence += params[i + 1].map{|k,v| ", #{k}: :#{v}"}.join
      end

      associations << sentence
    end

  end

  associations.uniq.each do |association|
    model.constantize.class_eval association

    puts model.constantize
    puts "\t"+ association
  end
end
