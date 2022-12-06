json.extract! contact, :id, :email, :first_name, :last_name, :phone_number, :created_at, :updated_at
json.versions contact.versions, partial: "contacts/version", as: :version
json.url contact_url(contact, format: :json)
