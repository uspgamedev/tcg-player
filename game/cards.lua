
alfa_00_04 = {
  {
    name = "Turret",
    cost = 2,
    type = 'unit',
    size = 2,
    rules = {
      "Ranged 1."
    }
  },
  {
    name = "Fang",
    cost = 2,
    type = 'unit',
    size = 1,
    rules = {
      "Melee 2."
    }
  },
  {
    name = "Scout",
    cost = 1,
    type = 'unit',
    size = 1,
    rules = {
      "Assault 1."
    }
  },
  {
    name = "Volley",
    cost = 1,
    type = 'command',
    rules = {
      "Volley delas 3 damage to target player."
    }
  },
  {
    name = "Charge",
    cost = 1,
    type = 'command',
    rules = {
      "Target melee unit gets Melee +3."
    }
  },
  {
    name = "Backstab",
    cost = 1,
    type = 'command',
    rules = {
      "Target player discards 2 cards."
    }
  },
  {
    name = "Airship",
    type = 'vessel',
    rules = {}
  },
  {
    name = "Divert",
    cost = 2,
    type = "maneuver",
    rules = {
      "Target player cannot untap units."
    }
  },
  {
    name = "Cloyster",
    cost = 3,
    type = 'unit',
    size = 3,
    rules = {
      "Shield 3.",
      "Sacrifice Cloyster: Cloyster deals 3 damage to target unit."
    },
    flavor = "If it is useless, just throw it at them."
  },
  {
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
}
