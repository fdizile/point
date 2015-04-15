json.array!(@computers) do |computer|
  json.extract! computer, :acpsnumber, :bpinumber, :make, :computer_model, :os, :room
  json.url computer_url(computer, format: :json)
end
