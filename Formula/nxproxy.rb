class Nxproxy < Formula
  desc "Tool that allows one to tunnel X sessions through the NX compression library"
  homepage "https://wiki.x2go.org/doku.php/wiki:libs:nx-libs"
  url "https://code.x2go.org/releases/source/nx-libs/nx-libs-3.5.99.22-lite.tar.gz"
  sha256 "0c411aae869675a0d1803e629592ce1c4ade598611e5dcc444696494b92a8e4e"
  license "GPL-2.0-only"

  depends_on "autoconf"   => :build
  depends_on "automake"   => :build
  depends_on "libtool"    => :build
  depends_on "pkg-config" => :build

  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "xorgproto"

  uses_from_macos "zlib"

  def install
    chdir "nxcomp" do
      system "autoreconf", "-vfsi"
      system "./configure", *std_configure_args, "--disable-silent-rules"
      system "mv", "VERSION", "VERSION.txt"
      system "make", "install"
    end

    chdir "nxproxy" do
      system "autoreconf", "-vfsi"
      system "./configure", *std_configure_args, "--disable-silent-rules"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
