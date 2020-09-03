class Spectools < Formula
  desc "Furo spectools utility toolkit around the furo specs"
  homepage "https://github.com/theNorstroem/spectools"
  url "https://github.com/theNorstroem/spectools/archive/v1.0.0-rc.3.tar.gz"
  sha256 "b44eef4cf2e7af8c97543f8f95b126eb8668138996a001b3a4e0b5d11eaf05b1"
  license ""

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/theNorstroem/spectools").install buildpath.children
    cd "src/github.com/theNorstroem/spectools" do
      system "go", "build", "-o", bin/"spectools", "."
    end
  end

  test do
    system "#{bin}/spectools", "--help"
  end
end
