class Lemonup < Formula
  desc "Cross-platform TUI World of Warcraft addon manager"
  homepage "https://github.com/archcorsair/lemonup"
  version "2.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-arm64"
    sha256 "49b8cf16a1fb241e4a68dffa50782546b09935d98b284e68e1e97d878959c1ee"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-x64"
    sha256 "44082e61a681979f17f138e550a25b954619f9e974f9c4f41c3d69dc90d3f2fb"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-linux-x64"
    sha256 "ebc85698324fd13f908234c033d12abdc1ef234c6a7da845ff6e2c111ace0214"
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
