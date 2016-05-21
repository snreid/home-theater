class HomeTheaterInfo < ActiveRecord::Base
  def self.search(page, search = nil)
    if search.present?
      where('dvd_title like ?', "%#{search}%").paginate page: page
    else
      paginate page: page
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    spreadsheet.each do |row|
      info = find_or_create_by(home_theater_info_id: row['ID'])
      info.attributes = attributes_from_row(row)
      info.save
    end
  end

  def self.open_spreadsheet(file)
    raise "Unknown file type: #{file.original_filename}" unless File.extname(file.original_filename) == '.csv'
    csv_text = File.read(file.path)
    CSV.parse(csv_text, {headers: true, skip_blanks: true})
  end

  def self.attributes_from_row(row)
    new_hash = {}

    row.to_hash.each do |k, v|
      unless k == "ID"
        new_hash.merge!({ k.downcase => v})
      end
    end

    new_hash
  end
end
