class PgPathman < Formula
  PG_DIR = "#{HOMEBREW_PREFIX}/var/postgres"
  PG_CONF = "#{PG_DIR}/postgresql.conf"

  desc "The pg_pathman module provides optimized partitioning mechanism and functions to manage partitions."
  homepage "https://github.com/VladimirMikhailov"
  url "https://github.com/VladimirMikhailov/pg_pathman/archive/0.1.tar.gz"
  version "0.1"
  sha256 "47c27c563516e369f65cccd1827492f611098a9104de87bb192f2d008ac7f876"

  depends_on "postgresql"

  def install
    ENV["PG_CONFIG"] = "#{Formula['postgresql'].opt_bin}/pg_config"

    system "make", "install", "DESTDIR=#{buildpath}", "USE_PGXS=1"

    lib.install Dir["usr/local/lib/*"]
    share.install Dir["usr/local/share/*"]
  end

  def caveats
    <<-EOS.undent
      Modify shared_preload_libraries parameter in postgres.conf as following:

        shared_preload_libraries = 'pg_pathman'

      You can either use echo to add or update it manualy:

        sed -i '' -e "s/#shared_preload_libraries = ''/shared_preload_libraries = 'pg_pathman'/g" #{PG_CONF}"

      And restart postgres

        pg_ctl restart -D #{PG_DIR}
    EOS
  end
end
