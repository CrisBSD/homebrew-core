class QvdClient < Formula
  desc "QVD Client is the client for use with QVD VDI"
  homepage "https://www.theqvd.com/"
  url "https://www.theqvd.com/packages/qvd-client-qt/sources/releases/qvd-client-qt_4.2.0.orig.tar.xz"
  sha256 "70cf3747afa8f3d8c5ce3c74b3cd99508c740d972df5ed8a2ccba723019d2ce1"
  license "GPL-3.0-only"

  depends_on "cmake" => :build
  depends_on "qt@5"
  depends_on "pulseaudio"
  depends_on "nxproxy"

  def install
    system "cmake", "-S", "src", "-B", "build", *std_cmake_args
    system "make", "-C", "build", "install"
  end

  def caveats
    <<~EOS
      You need to install xquartz with:
        brew install --cask xquartz
    EOS
  end

  test do
    system "false"
  end
end
