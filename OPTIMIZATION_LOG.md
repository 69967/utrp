# UTRP Lua Code Optimization Log

## Summary
Optimizing UTRP (Urban Tactical Roleplay) addon for Garry's Mod to maximize CPU efficiency.
This is a TacRP-based weapons system with extensive customization and ballistics.

## Files Optimized So Far:

### Core System Files:
1. **autorun/sh_tacrp_load.lua** - Main loader, optimized array iterations
2. **tacrp/shared/sh_common.lua** - Core common functions, optimized loops
3. **tacrp/shared/sh_0_convar.lua** - Large ConVar system (1979 lines), major performance impact - optimized timer checks and loops
4. **tacrp/shared/sh_physbullet.lua** - Physics bullet system, CPU intensive - optimized array iterations
5. **tacrp/shared/sh_move.lua** - Movement system, optimized assignment operators
6. **tacrp/shared/sh_1_ttt.lua** - TTT integration, optimized array iterations
7. **tacrp/shared/sh_weaponlimit.lua** - Weapon limit system, optimized loops and operators
8. **tacrp/shared/sh_atts.lua** - Attachment system, optimized extensive array iterations
9. **tacrp/shared/sh_npc.lua** - NPC system, optimized array iterations

### Weapon Base Files:
10. **weapons/tacrp_base/cl_hud.lua** - HUD rendering system (971 lines), major client performance impact
11. **weapons/tacrp_base/sh_shoot.lua** - Shooting mechanics (872 lines), major server performance impact - optimized loops and operators
12. **weapons/tacrp_base/sh_aggregate.lua** - Aggregation system (1443 lines), major performance impact - optimized extensive loops and operators
13. **weapons/tacrp_base/cl_radialmenu.lua** - Radial menu system (914 lines), UI performance - optimized loops and operators
14. **weapons/tacrp_base/cl_hint.lua** - Hint system, client-side
15. **weapons/tacrp_base/sh_vm.lua** - Viewmodel system, optimized loops and assignment operators
16. **weapons/tacrp_base/shared.lua** - Shared weapon base, optimized array iterations and operators
17. **weapons/tacrp_base/cl_customize.lua** - Customization UI, optimized array iterations
18. **weapons/tacrp_base/cl_light.lua** - Light system, optimized extensive array iterations
19. **weapons/tacrp_base/sh_quicknade.lua** - Quick grenade system, optimized operators
20. **weapons/tacrp_base/sh_scope.lua** - Scope system, optimized operators
21. **weapons/tacrp_base/sh_blindfire.lua** - Blindfire system, optimized array iterations and operators
22. **weapons/tacrp_base/sh_reload.lua** - Reload system, optimized operators
23. **weapons/tacrp_base/sh_init.lua** - Weapon initialization, optimized array iterations
24. **weapons/tacrp_base/cl_viewmodel.lua** - Viewmodel client, optimized array iterations
25. **weapons/tacrp_base/cl_laser.lua** - Laser system, optimized array iterations and operators

### Client-Side Files:
26. **tacrp/client/cl_news.lua** - News system (1758 lines), major client performance impact - optimized extensive array iterations, string operations, timer checks
27. **tacrp/client/cl_subcategories.lua** - Subcategory system, optimized array iterations
28. **tacrp/client/cl_ttt.lua** - TTT client integration, optimized array iterations

### Server-Side Files:
29. **tacrp/server/sv_damage.lua** - Damage system, optimized array iterations and timer checks
30. **tacrp/server/sv_util.lua** - Server utilities, optimized array iterations and timer checks

### Entity Files:
31. **entities/tacrp_proj_base.lua** - Base projectile system, optimized array iteration
32. **entities/tacrp_fire_cloud.lua** - Fire cloud entity, optimized
33. **entities/tacrp_gas_cloud.lua** - Gas cloud entity, optimized array iterations, operators, and timer checks
34. **entities/tacrp_heal_cloud.lua** - Heal cloud entity, optimized array iterations
35. **entities/tacrp_nuke_cloud.lua** - Nuke cloud entity, optimized array iterations

### Weapon Files:
36. **weapons/tacrp_ak47.lua** - Sample weapon file, optimized

## Performance Impact Priority:
1. **HIGH PRIORITY COMPLETED**: sh_0_convar.lua, sh_aggregate.lua, sh_shoot.lua, cl_hud.lua, sh_physbullet.lua, cl_news.lua
2. **MEDIUM PRIORITY COMPLETED**: cl_radialmenu.lua, sh_vm.lua, sh_move.lua, shared.lua, cl_light.lua, sh_scope.lua, sh_blindfire.lua, server utilities
3. **LOW PRIORITY**: Individual weapon files (100+ remaining)

## Current Optimization Status:
**36 files optimized out of 415 total Lua files**
- Core system files: **9/9 COMPLETE**
- Major weapon base files: **16/16 COMPLETE** 
- Client-side system files: **3/8 partially complete**
- Server-side system files: **2/7 partially complete**
- High-impact entity files: **5/35 partially complete**
- Individual weapon files: **1/300+ minimal progress**

## Next Steps:
- Continue optimizing remaining client/server system files
- Optimize remaining high-impact entity files 
- Begin batch optimization of individual weapon files
- Test performance impact in-game

## Optimization Types Applied:
- Replaced pairs() with ipairs() for array iterations (major CPU improvement)
- Fixed mixed assignment/comparison operators (syntax error prevention)
- Added timer.Exists() checks before timer creation (prevents timer conflicts)
- Optimized string operations in hot loops (reduced string concatenation overhead)
- Local variable caching where beneficial
- General code efficiency improvements

## Estimated Performance Impact:
- **High Impact Files**: 20+ files optimized (major server/client performance boost expected)
- **Array Iteration Optimization**: 100+ instances of pairs() → ipairs() conversion
- **Timer System Optimization**: 10+ timer conflict prevention fixes
- **String Operation Optimization**: Reduced overhead in UI and news system
