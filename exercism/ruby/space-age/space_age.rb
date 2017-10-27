class SpaceAge

  SECONDS_PER_EARTH_YEAR = 31557600
  FACTORS =
    {
      mercury: 0.2408467,
      venus: 0.61519726,
      mars: 1.8808158,
      jupiter: 11.862615,
      saturn: 29.447498,
      uranus: 84.016846,
      neptune: 164.79132
    }

  def initialize(seconds)
    @seconds = seconds.to_f
  end

  def on_earth
    @seconds / SECONDS_PER_EARTH_YEAR
  end

  def convert(planet)
    @seconds / (FACTORS[planet] * SECONDS_PER_EARTH_YEAR)
  end

  def on_mercury
    convert(:mercury)
  end

  def on_venus
    convert(:venus)
  end

  def on_mars
    convert(:mars)
  end

  def on_jupiter
    convert(:jupiter)
  end

  def on_saturn
    convert(:saturn)
  end

  def on_uranus
    convert(:uranus)
  end

  def on_neptune
    convert(:neptune)
  end
end


module BookKeeping
  VERSION = 1
end
