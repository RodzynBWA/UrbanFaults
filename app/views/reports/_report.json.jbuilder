json.extract! report, :id, :title, :report_category_id, :street, :house, :short_place_desc, :desc, :image, :user_id, :ip, :created_at, :updated_at
json.url report_url(report, format: :json)