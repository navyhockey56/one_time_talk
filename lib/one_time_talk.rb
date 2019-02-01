class String

	def map
		res = []
		(0...length).map do |i|
			yield(self[i])
		end
	end

	def to_int_arr
		map(&:ord)
	end

  def ^( other )
    b1 = to_int_arr
    b2 = other.to_int_arr
    shortest_length = b1.length < b1.length ? b2.length : b1.length
    (0...shortest_length).map do |i|
    	(b1[i] ^ b2[i]).chr
  	end.join("")
  end

end


MAX_MESSAGE_LENGTH = 5000

def decrypt_message(message:, pad:, placement: nil, length: nil)
	message ^= pad
	return message unless placement
	length ||= message.length
	message[placement...(placement + length)]
end

def encrypt_message(message, pad=nil)
	return nil unless message 
	length = message.length
	if pad && pad.length < length
		puts "Warning: Supplied pad is too short, a new pad will be generated" 
		pad = generate_pad(MAX_MESSAGE_LENGTH)
	end
	pad ||= generate_pad(MAX_MESSAGE_LENGTH)

	placement = rand(MAX_MESSAGE_LENGTH - message.length)
	message = buffer_message(message, placement)
	message ^= pad 
	{ message: message, pad: pad, placement: placement, length:  length }
end

def generate_pad(length)
	(0...length).map do 
		generate_random_char
	end.join("")
end

def buffer_message(message, placement)

	buffered_message = ""
	(0...placement).each do 
		buffered_message << generate_random_char 
	end

	buffered_message << message
	
	((placement + message.length)...MAX_MESSAGE_LENGTH).each do 
		buffered_message << generate_random_char
	end

	buffered_message
end

def generate_random_char
	return rand(255).chr
end