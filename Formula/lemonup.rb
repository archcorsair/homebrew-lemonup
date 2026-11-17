class Lemonup < Formula
  desc "Cross-platform TUI World of Warcraft addon manager"
  homepage "https://github.com/archcorsair/lemonup"
  version "2.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-arm64"
    sha256 "b50b83168435f4b00ec315adb5e6aca276cf746fb2035f16a2c1543a7e208bce"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-x64"
    sha256 "75f5845be1bfcfedb354e7ae4db20b2f63609ccb113baaddc3e8a86fa7b5a0ae"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-linux-x64"
    sha256 "a12f8a0fe4715d5ec4b9739d35bd19011edd6b884d4a93c7b25286c6a779a189"
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
