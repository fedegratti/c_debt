namespace :cdebt do
  desc 'Build schema from Class params'
  task :build_schema => :environment do
    puts 'Building schema...'


    files = Dir['app/models/**/*.rb']

    files.each do |file|
      fields = {}

      File.open(file, 'r') do |file|
        file.each_line do |line|
          break if line.include?('<')

          next unless line.lstrip.start_with?('field')

          field = line.split(',').first.sub('field', '').sub(':', '').strip
          type = line.split(',').last.sub('type:', '').strip.downcase

          fields[field] = type
        end

        basename = File.basename(file, '.rb').capitalize

        byebug
        formatted_fields = fields.to_a.map { |f| f.join(':') }.join(' ')
        references = add_references(basename)
        puts references

        # puts formatted_fields
        # sh "bin/rails generate migration Create#{basename.pluralize}"\
        #    " #{formatted_fields} #{references} created_at:datetime updated_at:datetime --force"
      end
    end

    # byebug
    # File.open('app/models/purchase.rb', 'r') do |file|
    #   file.each_line do |line|
    #     # puts line
    #     # add_reference(line) if line.lstrip.start_with?('belongs_to')

    #     next unless line.lstrip.start_with?('field')

    #     field = line.split(',').first.sub('field', '').sub(':', '').strip
    #     type = line.split(',').last.sub('type:', '').strip.downcase

    #     fields[field] = type

    #     # byebug
    #   end

    #   basename = File.basename('app/models/purchase.rb', '.rb').capitalize

    #   formatted_fields = fields.to_a.map { |f| f.join(':') }.join(' ')
    #   references = add_references(basename)
    #   puts references

    #   # puts formatted_fields
    #   # sh "bin/rails generate migration Create#{basename.pluralize}"\
    #   #    " #{formatted_fields} #{references} created_at:datetime updated_at:datetime --force"
    # end
  end
end

def add_references(basename)
  output = ''
  mappings = YAML.load_file("#{Rails.root}/config/mappings.yml")

  mappings.each do |model, methods|
    next unless model == basename

    methods.each do |relation, params|
      if relation == 'belongs_to'
        output << "#{params.join}:references"
      end
    end
  end
  output
end
