namespace :vote  do
  desc "test"
  task :import => :environment do
    File.open('./log/vote.txt', "r") do |f|
      f.each_line do |line|
        data = line.split(" ")
        data[0] == 'VOTE' && !!(data[1] =~ (/^\d+$/))
        %w(Campaign Validity Choice CONN MSISDN GUID Shortcode).map.with_index do |field, index|
          value = data[index+2]
          value.is_a?(String) && value.start_with?("#{field}:") && value.length > "#{field}:".length
        end.all?
        data_hash = { created_at: data[1], updated_at: data[1] }
        data.from(2).each do |piece|
          name, value = piece.split(':')
          key = name.downcase.to_sym
          data_hash[key] = value
        end

        campaign = Campaign.where(name: data_hash.delete(:campaign)).first_or_create
        candidate = Candidate.where(name: data_hash.delete(:choice)).first_or_create

        attributes = data_hash.merge(campaign: campaign, candidate: candidate)
        Vote.create(attributes)
      end
    end
  end

end
