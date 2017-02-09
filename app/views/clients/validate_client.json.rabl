if @client.nil?
	node(:can_create) {true}
else
	node(:can_create) {false}
end