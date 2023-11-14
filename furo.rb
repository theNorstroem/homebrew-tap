# frozen_string_literal: false
# Furo
class Furo < Formula
  desc "Furo CLI"
  homepage "https://furo.pro"
  url "https://github.com/eclipse/eclipsefuro/archive/v1.39.1.tar.gz"
  sha256 "bd77706bed340087adf2c11dcfb22c25668a99b4937394ccf1ae8d55b11e9050"
  license "MIT"
  depends_on "go"
  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/eclipse/eclipsefuro").install buildpath.children

    cd "src/github.com/eclipse/eclipsefuro/furo" do
      system "go", "build", "-o", bin/"furo", "."
    end
  end

  test do
    system "#{bin}/furo", "--help"
  end
end
