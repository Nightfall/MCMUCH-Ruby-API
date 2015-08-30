require "digest"

class MinecraftDigest
  def self.java_hex_digest(data)
    hash = Digest::SHA1.digest(data).bytes

    negative = (hash[0] & 0x80) == 0x80

    twos_compliment(hash) if negative

    string = hash.map { |b| format("%02x", b)[-2..-1] }.join.sub(/^0+/, "")

    string = "-" + string if negative

    string
  end

  def self.twos_compliment(hash)
    carry = true
    (hash.length - 1).step(0, -1) do |i|
      hash[i] = ~hash[i]
      if carry
        carry = hash[i] == 0xFF
        hash[i] += 1
      end
    end
  end
end
