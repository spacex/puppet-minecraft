class minecraft::source {

  $jar_name = 'minecraft_server'

  case $minecraft::family {
    'vanilla': {
      case $minecraft::source {
        /^(\d+)\.(\d+)\.(\d+)$/: {
          $download = get_vanilla_url(${minecraft::source})
        }
        'latest': {
          $download = get_vanilla_latest_url("release")
        }
        default: {
          fail("Unknown vanilla source string: \'${minecraft::source}\'")
        }
      }
    }
    'snapshot': {
      case $minecraft::source {
        /^(\d{2})w(\d{2})[a-z]$/: {
          $download = get_vanilla_url(${minecraft::source})
        }
        'latest': {
          $download = get_vanilla_latest_url("snapshot")
        }
        default: {
          fail("Unknown vanilla snapshots source string: \'${minecraft::source}\'")
        }
      }
    }
    'bukkit','craftbukkit': {
      case $minecraft::source {
        'recommended', 'rb', 'stable': {
          $download = 'http://dl.bukkit.org/latest-rb/craftbukkit.jar'
        }
        'beta', 'dev': {
          $download = "http://dl.bukkit.org/latest-${minecraft::source}/craftbukkit-${minecraft::source}.jar"
        }
        default: {
          fail("Unknown bukkit source string: \'${minecraft::source}\'")
        }
    }
    'direct': {
      $download = ${minecraft::source}
    }
    default: { # keep old logic in here in case undef or other?
      case $minecraft::source {
        /^(\d+)\.(\d+)\.(\d+)$/, # Matches Semantic Versioning for vanilla Minecraft, see http://semver.org/
        /^(\d{2})w(\d{2})[a-z]$/: { # Matches current versioning scheme for vanilla Minecraft snapshots, uses the same download source url
          $download = get_vanilla_url(${minecraft::source})
        }
        'recommended', 'rb', 'stable': {
          $download = 'http://dl.bukkit.org/latest-rb/craftbukkit.jar'
        }
        'beta', 'dev': {
          $download = "http://dl.bukkit.org/latest-${minecraft::source}/craftbukkit-${minecraft::source}.jar"
        }
        default: {
          $download = ${minecraft::source}
        }
      }
    }
  }

  wget::fetch { 'minecraft':
    source      => $download,
    destination => "${minecraft::install_dir}/minecraft_server.jar",
    user        => ${minecraft::user},
    require     => User[${minecraft::user}],
  }
}
