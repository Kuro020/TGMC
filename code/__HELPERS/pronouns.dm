//pronoun procs, for getting pronouns without using the text macros that only work in certain positions
//datums don't have gender, but most of their subtypes do!
/datum/proc/p_they(capitalized, temp_gender)
	. = "it"
	if(capitalized)
		. = capitalize(.)


/datum/proc/p_their(capitalized, temp_gender)
	. = "its"
	if(capitalized)
		. = capitalize(.)


/datum/proc/p_them(capitalized, temp_gender)
	. = "it"
	if(capitalized)
		. = capitalize(.)


/datum/proc/p_have(temp_gender)
	. = "has"


/datum/proc/p_are(temp_gender)
	. = "is"


/datum/proc/p_were(temp_gender)
	. = "was"


/datum/proc/p_do(temp_gender)
	. = "does"


/datum/proc/p_theyve(capitalized, temp_gender)
	return p_they(capitalized, temp_gender) + "'" + copytext_char(p_have(temp_gender), 3)


/datum/proc/p_theyre(capitalized, temp_gender)
	return p_they(capitalized, temp_gender) + "'" + copytext_char(p_are(temp_gender), 2)


/datum/proc/p_s(temp_gender) //is this a descriptive proc name, or what?
	. = "s"


/datum/proc/p_es(temp_gender)
	. = "es"

/datum/proc/plural_s(pluralize)
	switch(copytext_char(pluralize, -2))
		if ("ss")
			. = "es"
		if ("sh")
			. = "es"
		if ("ch")
			. = "es"
		else
			switch(copytext_char(pluralize, -1))
				if("s", "x", "z")
					. = "es"
				else
					. = "s"

//like clients, which do have gender.
/client/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "they"
	switch(temp_gender)
		if(FEMALE)
			. = "she"
		if(MALE)
			. = "he"
	if(capitalized)
		. = capitalize(.)


/client/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "their"
	switch(temp_gender)
		if(FEMALE)
			. = "her"
		if(MALE)
			. = "his"
	if(capitalized)
		. = capitalize(.)


/client/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "them"
	switch(temp_gender)
		if(FEMALE)
			. = "her"
		if(MALE)
			. = "him"
	if(capitalized)
		. = capitalize(.)


/client/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "has"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "have"


/client/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "is"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "are"


/client/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "was"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "were"


/client/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "does"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "do"


/client/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL && temp_gender != NEUTER)
		. = "s"


/client/p_es(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL && temp_gender != NEUTER)
		. = "es"


//atoms also have gender! mostly only matters for singular/plural outside mobs, but you can have a male hat if you really want
/atom/p_they(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "it"
	switch(temp_gender)
		if(FEMALE)
			. = "she"
		if(MALE)
			. = "he"
		if(PLURAL)
			. = "they"
	if(capitalized)
		. = capitalize(.)


/atom/p_their(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "its"
	switch(temp_gender)
		if(FEMALE)
			. = "her"
		if(MALE)
			. = "his"
		if(PLURAL)
			. = "their"
	if(capitalized)
		. = capitalize(.)


/atom/p_them(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "it"
	switch(temp_gender)
		if(FEMALE)
			. = "her"
		if(MALE)
			. = "him"
		if(PLURAL)
			. = "them"
	if(capitalized)
		. = capitalize(.)


/atom/p_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "has"
	if(temp_gender == PLURAL)
		. = "have"


/atom/p_are(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "is"
	if(temp_gender == PLURAL)
		. = "are"


/atom/p_were(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "was"
	if(temp_gender == PLURAL)
		. = "were"


/atom/p_do(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "does"
	if(temp_gender == PLURAL)
		. = "do"


/atom/p_s(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL)
		. = "s"


/atom/p_es(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	if(temp_gender != PLURAL)
		. = "es"


//humans need special handling, because they can have their gender hidden
/mob/living/carbon/human/p_they(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_their(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_them(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_have(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_are(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_were(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_do(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_s(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()


/mob/living/carbon/human/p_es(temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask?.inv_hide_flags & HIDEFACE || head?.inv_hide_flags & HIDEFACE)
	if((SLOT_W_UNIFORM & obscured) && skipface)
		temp_gender = PLURAL
	return ..()
