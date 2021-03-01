class Pdftilecut < Formula
  desc "Sub-divide a PDF page(s) into smaller pages so you can print them"
  homepage "https://github.com/oxplot/pdftilecut"
  url "https://github.com/oxplot/pdftilecut/archive/v0.5.tar.gz"
  sha256 "48a34df2ab7a9fbf2f7dbec328fae9cd15fff8a77fe938675a9e2ee336357b58"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any, arm64_big_sur: "a36f6efee23fc0af788bdef8017bcfee5b0fa25031541a499508f4942d743083"
    sha256 cellar: :any, big_sur:       "e9cd816b6b435a80e0860b9a3d4e62aea35e85bbb6df82ba9308c4b8c10245d1"
    sha256 cellar: :any, catalina:      "015c4f2b9481772318dabbf7f8cb5aa0640e46781d7cd7ef5cfc9f33b91afb79"
    sha256 cellar: :any, mojave:        "59229d726c29240bd14240e9011bfc1ec731ffcef8e52373c5a720649e6cacb7"
  end

  depends_on "go" => :build
  depends_on "jpeg-turbo"
  depends_on "qpdf"

  def install
    system "go", "build", *std_go_args
  end

  test do
    testpdf = test_fixtures("test.pdf")
    system "#{bin}/pdftilecut", "-tile-size", "A6", "-in", testpdf, "-out", "split.pdf"
    assert_predicate testpath/"split.pdf", :exist?, "Failed to create split.pdf"
  end
end
