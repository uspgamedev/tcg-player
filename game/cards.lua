
_1 = {
  name = "Turret",
  cost = 2,
  type = 'unit',
  size = 2,
  rules = {
    "Ranged 1."
  }
}

_2 = {
  name = "Fang",
  cost = 2,
  type = 'unit',
  size = 1,
  rules = {
    "Melee 2."
  }
}

_3 = {
  name = "Scout",
  cost = 1,
  type = 'unit',
  size = 1,
  rules = {
    "Assault 1."
  }
}

_4 = {
  name = "Volley",
  cost = 1,
  type = 'command',
  rules = {
    "Volley delas 3 damage to target player."
  }
}

_5 = {
  name = "Charge",
  cost = 1,
  type = 'command',
  rules = {
    "Target melee unit gets Melee +3."
  }
}

_6 = {
  name = "Backstab",
  cost = 1,
  type = 'command',
  rules = {
    "Target player discards 2 cards."
  }
}

_7 = {
  name = "Airship",
  type = 'vessel',
  rules = {}
}

_8 = {
  name = "Divert",
  cost = 2,
  type = "maneuver",
  rules = {
    "Target player cannot untap units."
  }
}

_9 = {
  name = "Cloyster",
  cost = 3,
  type = 'unit',
  size = 3,
  rules = {
    "Shield 3.",
    "Sacrifice Cloyster: Cloyster deals 3 damage to target unit."
  },
  flavor = "If it is useless, just throw it at them."
}

_10 = {
  name = "Cannon",
  cost = 3,
  type = 'unit',
  size = 4,
  rules = {
    "Ranged 3.",
    "{2}: Cannon gets Ranged +1."
  },
  flavor = "One can always load more into the canon."
}
