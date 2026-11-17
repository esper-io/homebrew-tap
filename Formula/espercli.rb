class Espercli < Formula
  desc "Command-line interface for the Esper device management API"
  homepage "https://github.com/esper-io/esper-cli"
  version "2.0.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.2/espercli_2.0.2_darwin_x86.tar.gz"
      sha256 "829d9a3f5a3da04dbebba409be42ea895fd00d48ea34f0b5e6b251393a98ec09"
    end
    if Hardware::CPU.arm?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.2/espercli_2.0.2_darwin_arm64.tar.gz"
      sha256 "4b6ce2119ed179704b99d768f823de53b576bfd18237839c539da317335b4296"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.2/espercli_2.0.2_linux_x86.tar.gz"
      sha256 "295b7d42698680e530adc5f129cf32a5253bf68e2e379dbe9f6cc5c4aef117d2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/esper-io/esper-cli/releases/download/v2.0.2/espercli_2.0.2_linux_arm64.tar.gz"
      sha256 "f42982d35a483d083924787a3466655bd94104be5275038dc8271b078da60102"
    end
  end

  def install
    bin.install "espercli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/espercli version")
  end
end
