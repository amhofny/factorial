json.extract! version, :id
json.created_at time_ago_in_words(version.created_at)
json.changeset version.changeset
