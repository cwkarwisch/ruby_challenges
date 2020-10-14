class SecretHandshake
  attr_reader :binary

  def initialize(number)
    @binary = convert_to_binary(number)
  end

  def commands
    handshake = []
    @binary.chars.reverse.take(5).each_with_index do |digit, index|
      if index == 4 && digit == '1'
        handshake.reverse!
      elsif digit == '1'
        handshake << SECRETS[index]
      end
    end
    handshake
  end

  private

  SECRETS = ['wink', 'double blink', 'close your eyes', 'jump']

  def convert_to_binary(number)
    if number.is_a?(Integer)
      number.to_s(2)
    elsif number.is_a?(String)
      number.to_i.to_s(2)
    else
      raise ArgumentError, "Provide an integer or a string."
    end
  end
end
