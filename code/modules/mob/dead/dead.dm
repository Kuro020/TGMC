//Dead mobs can exist whenever. This is needful

INITIALIZE_IMMEDIATE(/mob/dead)

/mob/dead
	sight = SEE_TURFS | SEE_MOBS | SEE_OBJS | SEE_SELF
	move_resist = INFINITY
	resistance_flags = RESIST_ALL


/mob/dead/dust()	//ghosts can't be vaporised.
	return

/mob/dead/gib()		//ghosts can't be gibbed.
	return

/mob/dead/forceMove(atom/destination)
	var/turf/old_turf = get_turf(src)
	var/turf/new_turf = get_turf(destination)
	if (old_turf?.z != new_turf?.z)
		var/same_z_layer = (GET_TURF_PLANE_OFFSET(old_turf) == GET_TURF_PLANE_OFFSET(new_turf))
		on_changed_z_level(old_turf, new_turf, same_z_layer) // todo these call seems redundant
	var/oldloc = loc
	loc = destination
	Moved(oldloc, NONE, TRUE)

/mob/dead/abstract_move(atom/destination)
	var/turf/old_turf = get_turf(src)
	var/turf/new_turf = get_turf(destination)
	if (old_turf?.z != new_turf?.z)
		var/same_z_layer = (GET_TURF_PLANE_OFFSET(old_turf) == GET_TURF_PLANE_OFFSET(new_turf))
		on_changed_z_level(old_turf, new_turf, same_z_layer) // todo these call seems redundant
	return ..()

