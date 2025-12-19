class Lemonup < Formula
  desc "Cross Platform TUI World of Warcraft Addon Manager "
  homepage "https://github.com/archcorsair/lemonup"
  version "0.0.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.2/lemonup-macos-arm64"
    sha256 "69e261baa62272251e87c1fdc60958b35820c8a5387145412286005f3ae7dc76"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.2/lemonup-macos-x64"
    sha256 "024821b737c477144fa4ad460c2f6c4af10ca3278e22ad71f37846aa32dd586e"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.2/lemonup-linux-x64"
    sha256 "c70315957a5bbf1ae4daec3e580600e964430665bac205c615d035be6228f9a5"
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
