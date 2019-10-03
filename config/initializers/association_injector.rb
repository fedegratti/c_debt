puts 'Creating Classes and relations'

mappings = YAML.load_file("#{Rails.root}/config/mappings.yml")

mappings.each do |model, methods|
  associations = []

  methods.each do |relation, params|

    if relation == 'child_of'
      eval("#{model} = Class.new #{params.first.camelize}")
      next
    else
      unless Object.constants.include?(model.to_sym)
        eval("#{model} = Class.new ActiveRecord::Base")
      end
    end

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
    puts model.constantize
    puts "\t"+ association

    model.constantize.class_eval association
  end

  # Model file
  model_path = "app/models/#{model.underscore}.rb"

  File.open(model_path, 'r') do |file|
    class_content = ''

    file.each_line do |line|

      # Ignore if the line is the name of the model
      next if line.lstrip.start_with?('class')

      # Ignore if the line is a field of the model
      next if line.lstrip.start_with?('field')

      # Ignore if the line is the last one
      next if line.start_with?('end')

      class_content += line
    end

    model.constantize.class_eval class_content
  end
end
