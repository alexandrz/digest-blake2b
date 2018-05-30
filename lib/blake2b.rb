require 'blake2b_ext'
require 'blake2b/key'

class Blake2b
  def self.hex(input, key = Blake2b::Key.none, out_len = 32)
    check_if_valid!(input, key, out_len)
    Blake2b.new(out_len, key).digest(input, :to_hex)
  end

  def self.bytes(input, key = Blake2b::Key.none, out_len = 32)
    check_if_valid!(input, key, out_len)
    Blake2b.new(out_len, key).digest(input, :to_bytes)
  end

  def self.check_if_valid!(input, key, out_len)
    unless input.is_a?(String)
      raise ArgumentError, 'input arg must be a String'
    end

    unless key.is_a?(Blake2b::Key)
      raise ArgumentError, 'key arg must be a Blake2b::Key'
    end

    unless out_len.is_a?(Integer) && out_len.between?(1, 32)
      raise ArgumentError, 'out_len arg must be an Integer between 1 and 32 inclusive'
    end
  end
  private_class_method :check_if_valid!
end
