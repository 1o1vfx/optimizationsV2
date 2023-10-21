-- Sponsored by Duplicator.gg https://discord.gg/cVhRCSUAfx

local _RunConsoleCommand = RunConsoleCommand
_RunConsoleCommand("gmod_mcore_test", "1")
_RunConsoleCommand("r_queued_ropes", "1")
_RunConsoleCommand("r_threaded_client_shadow_manager", "1")
_RunConsoleCommand("r_threaded_renderables", "1")
_RunConsoleCommand("r_threaded_particles", "1")
_RunConsoleCommand("cl_threaded_bone_setup", "1")
_RunConsoleCommand("cl_threaded_client_leaf_system", "1")
_RunConsoleCommand("mat_queue_mode", "-1")
_RunConsoleCommand("studio_queue_mode", "1")
_RunConsoleCommand("r_drawmodeldecals", "0")
_RunConsoleCommand("mat_specular", "0")
_RunConsoleCommand("r_WaterDrawReflection", "0")
_RunConsoleCommand("r_waterforceexpensive", "0")
_RunConsoleCommand("r_3dsky", "0")
_RunConsoleCommand("physgun_halo", "0")
_RunConsoleCommand("r_shadows", "1")
_RunConsoleCommand("r_drawdetailprops", "0")
_RunConsoleCommand("cl_showhints", "0")
_RunConsoleCommand("violence_agibs", "0")
_RunConsoleCommand("violence_hgibs", "0")
_RunConsoleCommand("props_break_max_pieces", "0") -- Removes broken pieces on props
_RunConsoleCommand("cl_playerspraydisable", "0")
_RunConsoleCommand("stopsound", "1")
hook.Remove("NeedsDepthPass", "NeedsDepthPass_Bokeh")
hook.Remove("RenderScreenspaceEffects", "RenderTexturize")
hook.Remove("RenderScreenspaceEffects", "RenderBloom")
hook.Remove("PreRender", "PreRenderFrameBlend")
hook.Remove("DrawOverlay","sandbox_search_progress")
hook.Remove("PostRender", "RenderFrameBlend")
hook.Remove("Think", "DOFThink")
hook.Remove("CalcView", "rp_deathPOV")
hook.Remove("RenderScreenspaceEffects", "RenderMotionBlur")
-- Part 1

-- Sponsored by Duplicator.gg https://discord.gg/cVhRCSUAfx

local goThroughDoor = {
    prop_physics=true,
    sammyservers_textscreen=true,
    Keypad=true
    }
    hook.Add( "ShouldCollide", "SADMIN_COLLIDE", function( ent1, ent2 )
    if (goThroughDoor[ent1:GetClass()] != nil or ent1:GetClass() == "prop_door_rotating") and (goThroughDoor[ent2:GetClass()] != nil or ent2:GetClass() == "prop_door_rotating") then
      return false
    end
    return true
    end)
    hook.Add("OnEntityCreated","SADMIN_CREATE",function(ent)
    if(goThroughDoor[ent:GetClass()]) then ent:SetCustomCollisionCheck(true) end
    end)

    -- Part 3

    local DUPLICATORGG_ENTITIES_REMOVE = {
      [ "ambient_generic" ]               = true,
      [ "ambient_music" ]               = true,
      [ "env_speaker" ]               = true,
      [ "env_soundscape" ]               = true,
      [ "env_fire" ]                      = true,
      [ "env_sprite" ]                    = true,
      [ "env_soundscape" ]                = true,
      [ "func_monitor" ]                  = true, -- disables windows (turn both off)
      [ "func_breakable_surf" ]           = true, -- disables windows (turn both off)
      [ "lua_run" ]                       = true,
      [ "logic_timer" ]                   = true,
      [ "point_camera" ]                  = true,
      [ "point_template" ]                = true,
      [ "prop_physics_multiplayer" ]      = true,
      [ "prop_ragdoll" ]                  = true,
      [ "prop_physics" ]                  = true,
      [ "spotlight_end" ]                 = true,
      [ "light" ]                         = true,
      [ "point_spotlight" ]               = true,
      [ "beam" ]                          = true,
      [ "light_spot" ]                    = true,
      [ "func_tracktrain" ]               = true,
      [ "trigger_multiple" ]               = true,
  }
  
  hook.Add("InitPostEntity", "Remove_Sprites", function()
      local _IPAIRS_ = ents.GetAll()
      for _=1, #_IPAIRS_ do
          local v =_IPAIRS_[_]
          if IsValid(v) && (DUPLICATORGG_ENTITIES_REMOVE[v:GetClass()]) then
              v:Remove()
          end
      end
       hook.Remove("InitPostEntity", "Remove_Sprites")
  end)


  -- Sponsored by Duplicator.gg https://discord.gg/cVhRCSUAfx