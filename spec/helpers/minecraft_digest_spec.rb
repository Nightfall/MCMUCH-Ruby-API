require "spec_helper"

describe MinecraftDigest do
  it "produces the correct hashes" do
    expect(MinecraftDigest.hexdigest("Notch")).to eq "4ed1f46bbe04bc756bcb17c0c7ce3e4632f06a48"
    expect(MinecraftDigest.hexdigest("jeb_")).to eq "-7c9d5b0044c130109a5d7b5fb5c317c02b4e28c1"
    expect(MinecraftDigest.hexdigest("simon")).to eq "88e16a1019277b15d58faf0541e11910eb756f6"
  end
end
