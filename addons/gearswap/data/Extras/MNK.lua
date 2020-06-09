function get_sets()
  include("organizer-lib")

  sets.inventory = {sub = "Remedy", ranged = "Panacea"}
  local overflow_threshold = 2449
  local wsd_threshold = 2299
  local capped = false -- toggle attack capped setting with //gs c cap
  local boosted = false

  sets.idle = {
    main="Godhands",
    ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands="Ken. Tekko +1",
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

  -- Job Ability Swaps

  sets.ja = {
    ["Hundred Fists"] = {legs = "Hesychast's Hose +3"},
    ["Dodge"] = {feet = "Anchorite's Gaiters +3"},
    ["Focus"] = {},
    ["Footwork"] = {feet = "Bhikku Gaiters +1"},
    ["Counterstance"] = {},
    ["Chi Blast"] = {head = "Hesychast's Crown +3"},
    ["Chakra"] = {hands = "Hesychast's gloves +3", body = "Anchorite's Cyclas +3"},
    ["Formless Strikes"] = {body = "Hesychast's Cyclas +3"},
    ["Mantra"] = {feet = "Hesychast's Gaiters +3"},
    ["Boost"] = {waist = "Ask Sash", hands = "Anchorite's Gloves +3"}
  }

  -- Standard Tp Sets
  melee_sets = {
    ["d"] = "Max DD", -- //gs c d
    ["sb"] = "Subtle Blow", -- //gs c sb
    ["me"] = "Magic Evasion", -- //gs c me
    ["dt"] = "Damage Taken", -- //gs c dt
    ["a"] = "Accuracy", -- //gs c a
    ["ax"] = "Max Accuracy", -- //gs c ax
    ["sc"] = "Skillchain", -- //gs c sc
    ["la"] = "Low Haste", -- //gs c lh
    ["c1"] = "Counter 1 (Defensive)", -- //gs c c1
    ["c2"] = "Counter 2 (Offensive)" -- //gs c c2
  }
  
  melee_key = "d"

  sets.tp = {
    footwork = {
      feet = "Anchorite's Gaiters +3",
      legs = "Ken. Hakama +1"
    },
    ["Max DD"] = {
    main="Godhands",
    ammo="Falcon eye",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Subtle Blow"] = {
    main="Godhands",
    ammo="Falcon eye",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Magic Evasion"] = {
    main="Godhands",
    ammo="Falcon eye",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Damage Taken"] = {
    main="Godhands",
    ammo="Falcon eye",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Accuracy"] = {
    main="Godhands",
    ammo="Falcon eye",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Max Accuracy"] = {
    main="Godhands",
    ammo="Falcon eye",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Skillchain"] = {
      ammo = "Falcon eye",
      head = "Ken. Jinpachi +1",
      body = "Ken. Samue +1",
      hands = {name = "Adhemar Wrist. +1", augments = {"DEX+12", "AGI+12", "Accuracy+20"}},
      legs = "Samnuha Tights",
      feet = {name = "Herculean Boots", augments = {"Accuracy+30", '"Triple Atk."+4', "AGI+4"}},
      neck = "Mnk. Nodowa +2",
      waist = "Moonbow Belt +1",
      left_ear = "Sherida Earring",
      right_ear = "Mache Earring +1",
      left_ring = "Gere Ring",
      right_ring = "Niqmaddu Ring",
      back = {
        name = "Segomo's Mantle",
        augments = {"DEX+20", "Accuracy+20 Attack+20", '"Store TP"+10', "Phys. dmg. taken-10%"}
      }
    },
    ["Low Haste"] = {
    main="Godhands",
    ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Ken. Samue +1",
    hands="Malignance Gloves",
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Counter 1 (Defensive)"] = {
      ammo = "Amar Cluster",
      head = "Malignance Chapeau",
      body = {name = "Hes. Cyclas +3", augments = {'Enhances "Formless Strikes" effect'}},
      hands = "Hizamaru Kote +2",
      legs = "Anch. Hose +3",
      feet = "Hiza. Sune-Ate +2",
      neck = "Loricate Torque +1",
      waist = "Moonbow Belt +1",
      left_ear = "Sherida Earring",
      right_ear = "Cryptic Earring",
      left_ring = "Hizamaru Ring",
      right_ring = "Defending Ring",
      back = {
        name = "Segomo's Mantle",
        augments = {"DEX+20", "Accuracy+20 Attack+20", "DEX+10", '"Dbl.Atk."+10', "System: 1 ID: 640 Val: 4"}
      }
    },
    ["Counter 2 (Offensive)"] = {
      ammo = "Amar Cluster",
      head = "Kendatsuba jinpachi +1",
      body = "Hesychast's Cyclas +3",
      hands = {name = "Adhemar Wrist. +1", augments = {"DEX+12", "AGI+12", "Accuracy+20"}},
      legs = "Samnuha Tights",
      feet = "Hesychast's Gaiters +3",
      neck = "Monk's Nodowa +2",
      waist = "Moonbow Belt +1",
      left_ear = "Sherida Earring",
      right_ear = "Mache Earring +1",
      left_ring = "Gere Ring",
      right_ring = "Epona's Ring",
      back = {
        name = "Segomo's Mantle",
        augments = {"DEX+20", "Accuracy+20 Attack+20", "DEX+10", '"Dbl.Atk."+10', "System: 1 ID: 640 Val: 4"}
      }
    }
  }

  -- Standard Weapon Skill Sets

  sets.ws = {
    footwork = {feet = "Anchorite's Gaiters +3"},
["Victory Smite"] = {
    main="Godhands",
    ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Ken. Samue +1",
    hands="Ryuo Tekko +1",
    legs="Ken. Hakama +1",
    feet={ name="Herculean Boots", augments={'Accuracy+21','Crit. hit damage +2%','STR+9',}},
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
},
    ["Howling Fist"] = {
    main="Godhands",
    ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Bhikku Cyclas +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Hiza. Hizayoroi +2",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Begrudging Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
},
    ["Raging Fists"] = {
    main="Godhands",
    ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
},
    ["Asuran Fists"] = {
    main="Godhands",
    ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
},
    ["Shijin Spiral"] = {
    main="Godhands",
    ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Ilabrat Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
},
    ["Tornado Kick"] = {
    main="Godhands",
    ammo="Falcon Eye",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Bhikku Cyclas +1",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Hiza. Hizayoroi +2",
    feet="Ken. Sune-Ate +1",
    neck="Monk's Nodowa +2",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Begrudging Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
},
    ["Dragon Kick"] = {
    main="Godhands",
    ammo="Falcon Eye",
    head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body="Ken. Samue +1",
    hands="Anchor. Gloves +3",
    legs="Ken. Hakama +1",
    feet="Anch. Gaiters +3",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
  }

  -- WSD Swap Sets

  sets.wsd = {
    ["Howling Fist"] = {
      head = "Hesychast's crown +3",
      ammo = "Falcon Eye",
      hands = "Anchorite's gloves +3",
      neck = "Monk's Nodowa +2",
      right_ring = "Regal Ring"
    }
  }

  -- Attack Capped Swap Sets

  sets.capped = {
    neck = "Monk's Nodowa +2",
    ["Victory Smite"] = {ammo = "Focal Orb"},
    ["Dragon Kick"] = {body = "Kendatsuba Samue +1"},
    ["Tornado Kick"] = {body = "Kendatsuba Samue +1"},
    ["Shijin Spiral"] = {body = "Kendatsuba Samue +1"},
    ["Asuran Fists"] = {},
    ["Howling Fist"] = {body = "Kendatsuba Samue +1"},
    ["Raging Fists"] = {
      body = "Kendatsuba Samue +1",
      head = "Kendatsuba Jinpachi +1"
    },
    ["Howling Fist"] = {
      body = "Kendatsuba Samue +1"
    }
  }

  -- Misc Swaps

  sets.during_boost = {waist = "Ask Sash"}
  sets.impetus = {body = "Bhikku Cyclas +1"}
  sets.brutal = {rear="Brutal Earring"}
  sets.overflow = {right_ear = "Brutal Earring"}
  sets.treasure = {
    head = {
      name = "Herculean Helm",
      augments = {"Weapon skill damage +3%", '"Mag.Atk.Bns."+7', '"Treasure Hunter"+2'}
    },
    legs = "Volte Hose",
    waist = "Chaac Belt"
  }

  function precast(spell)
    if spell.prefix == "/jobability" and buffactive["paralysis"] then
      cancel_spell()
      send_command(
        "@input /echo _____Warning: Paralyzed. Using Remedy (_" .. (player.inventory["Remedy"].count - 1) .. "_)_____"
      )
      send_command('@input /item "Remedy" <me>')
    elseif spell.action_type == "Magic" and buffactive["silence"] then
      cancel_spell()
      send_command(
        "@input /echo _____Warning: Silenced. Using Echo Drops (_" ..
          (player.inventory["Echo Drops"].count - 1) .. "_)_____"
      )
      send_command('@input /item "Echo Drops" <me>')
    elseif buffactive["Impetus"] and spell.english == "Victory Smite" then
     equip(
        set_combine(
          sets.ws[spell.english], sets.impetus, sets.brutal,
          player.tp > wsd_threshold and sets.wsd[spell.english] or {},
          player.tp > overflow_threshold and sets.overflow or {},
          capped and set_combine(sets.capped, sets.capped[spell.english]) or {}
        )
      )
    elseif spell.english == "" or spell.english == "" then
      if buffactive["Footwork"] then
        equip(
          set_combine(
            sets.ws[spell.english],
            sets.ws.footwork,
            capped and set_combine(sets.capped, sets.capped[spell.english]) or {},
            player.tp > overflow_threshold and sets.overflow or {}
          )
        )
      end
    elseif sets.ws[spell.english] then
      equip(
        set_combine(
          sets.ws[spell.english],
          player.tp > wsd_threshold and sets.wsd[spell.english] or {},
          player.tp > overflow_threshold and sets.overflow or {},
          capped and set_combine(sets.capped, sets.capped[spell.english]) or {}
        )
      )
    elseif sets.ja[spell.english] then
      equip(sets.ja[spell.english])
      if spell.english == "Boost" then
        boosted = true
      end
    end
  end

  function midcast(spell)
  end

  function aftercast(spell)
    if player.status == "Engaged" then
      equip(sets.tp[melee_sets[melee_key]])
      if buffactive["Impetus"] then
        equip(sets.impetus)
      end
      if buffactive["Footwork"] then
        equip(sets.tp.footwork)
      end
      if boosted or buffactive["Boost"] then
        equip(sets.during_boost)
      end
    else
      equip(sets.idle, (boosted or buffactive["Boost"]) and sets.during_boost or {})
    end
    if not buffactive["Boost"] then
      boosted = false
    end
  end

  function status_change(new, old)
    if T {"Idle", "Resting"}:contains(new) then
      equip(sets.idle, buffactive["Boost"] and sets.during_boost or {})
    elseif new == "Engaged" then
      equip(sets.tp[melee_sets[melee_key]])
      if buffactive["Impetus"] then
        equip(sets.impetus)
      end
      if buffactive["Footwork"] then
        equip(sets.tp.footwork)
      end
      if boosted or buffactive["Boost"] then
        equip(sets.during_boost)
      end
    end
  end

  function self_command(command)
    if melee_sets[command] then
      melee_key = command
      send_command("@input /echo ----- TP Set changed to " .. melee_sets[command] .. "-----")
      equip(sets.tp[melee_sets[command]])
    elseif command == "th" then
      send_command("@input /echo ----- Setting Treasure Hunter Gear-----")
      equip(sets.treasure)
    elseif command == "cap" then
      capped = not capped
      send_command("@input /echo ----- Attack Capped changed to " .. tostring(capped) .. "-----")
      equip(set_combine(sets.tp[melee_sets[melee_key]], capped and sets.capped or {}))
    end
  end
end