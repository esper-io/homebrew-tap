class Espercli < Formula
  desc "Command-line interface for the Esper device management API"
  homepage "https://github.com/esper-io/esper-cli"
  version "2.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.1/espercli_2.0.1_darwin_x86.tar.gz"
      sha256 "009484bbbfe9cdf48d8e1622cec459153616ee1981407e1a9374620ddf5017c8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.1/espercli_2.0.1_darwin_arm64.tar.gz"
      sha256 "5da237cfa91566a6ee42f54f78ad3d6ae5b9dbfeccae91c16dbf60208a633538"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.1/espercli_2.0.1_linux_x86.tar.gz"
      sha256 "58eb35155e167a5840936c9bdefc7eda88ce4122d7dd148cd2b76c0ec8b3ce85"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.1/espercli_2.0.1_linux_arm64.tar.gz"
      sha256 "6a6a86a741af04bc7abd96d0c1a9ac22ebd605e15ed296b5b4961ba334a948e8"
    end
  end

  def install
    bin.install "espercli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/espercli version")
  end
end
