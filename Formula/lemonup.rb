class Lemonup < Formula
  desc "Cross Platform TUI World of Warcraft Addon Manager "
  homepage "https://github.com/archcorsair/lemonup"
  version "0.0.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.1.13/lemonup-macos-arm64"
    sha256 "00e77ec1c785c1df8777c4bac44190b2ef230672b5aeb7ef0b568d0eb9eab5f7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.1.13/lemonup-macos-x64"
    sha256 "e3071610ca964cd112c6411135076454d50418e59faf7593a6471cbc5e602971"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.1.13/lemonup-linux-x64"
    sha256 "fff4f9bc8929fe5cddc7bef64847f4f4c6230fffd869124af3e382c48e225e41"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "lemonup-macos-arm64" => "lemonup"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "lemonup-macos-x64" => "lemonup"
    elsif OS.linux?
      bin.install "lemonup-linux-x64" => "lemonup"
    end

    if OS.mac?
      system "codesign", "--force", "--deep", "--sign", "-", "#{bin}/lemonup"
    end
  end

  test do
    system "#{bin}/lemonup", "--version"
  end
end
