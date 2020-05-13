require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Phalcon < AbstractPhp72Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.5.zip"
  sha256 "7214974d78fcde7b3c3ebc59f89d5a52b33a842cc1a388aeaa5ab03346438ba9"
  head "https://github.com/phalcon/cphalcon.git"

  depends_on "pcre"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "28b76f11d151c70959c40d47c8916a0a8621a5e8b04ca3748de2215a9c3a7525" => :high_sierra
  end

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
