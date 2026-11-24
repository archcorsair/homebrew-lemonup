class Lemonup < Formula
  desc "Cross-platform TUI World of Warcraft addon manager"
  homepage "https://github.com/archcorsair/lemonup"
  version "2.9.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-arm64"
    sha256 "16658b25d59a30b2d59dc6d765d03558ac1a7367b51fbfd34f11eafa4452233f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-x64"
    sha256 "73b898fc056100340d74a34514de786764e0ab634159d7feba9c48ce1aa1c225"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-linux-x64"
    sha256 "9b737e899a70158404a4fce4da76dbe6af27a24b8a14a5167cb69a6b1469c1fe"
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
