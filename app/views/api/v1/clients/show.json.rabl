object @client
attributes :name, :company, :email, :website
node(:edit_url) {|client| edit_client_url(client)}

child :projects do
attributes :name, :desccription, :start_date, :status
end