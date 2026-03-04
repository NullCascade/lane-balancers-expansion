
local function update_icons(prefix)
	data.raw["item"][prefix .. "-lane-splitter"].icons = { { icon = "__lane-balancers-expansion__/graphics/icons/" .. prefix .. "-lane-splitter.png" } }
	data.raw["lane-splitter"][prefix .. "-lane-splitter"].icons = { { icon = "__lane-balancers-expansion__/graphics/icons/" .. prefix .. "-lane-splitter.png" } }
end

local function fix_recipe_ingredient(prefix, old_prefix, new_prefix)
	local recipe_name = prefix .. "-lane-splitter"
	local old_name = old_prefix .. "-lane-splitter"
	local new_name = new_prefix .. "-lane-splitter"

	local recipe_prototype = data.raw["recipe"][recipe_name]
	if (not recipe_prototype) then
		return
	end

	for _, ingredient in ipairs(recipe_prototype.ingredients) do
		if ingredient.name == old_name then
			ingredient.name = new_name
		end
	end
end

-- Arig
if mods["planetaris-arig"] then
	lane_balancers_handle({
		prefix = "planetaris-hyper-",
		tech = "planetaris-hyper-transport-belt",
		previous_prefix = "turbo-",
		order = "dd",
	})

	update_icons("planetaris-hyper")

	-- Fixup superior balancers with K2SO.
	if (mods["Krastorio2-spaced-out"]) then
		fix_recipe_ingredient("kr-superior", "turbo", "planetaris-hyper")
	end
end

-- Lignumis
if mods["lignumis"] then
	lane_balancers_handle({
		prefix = "wood-",
		tech = "wood-logistics",
		order = "1a",
	})

	update_icons("wood")
end
