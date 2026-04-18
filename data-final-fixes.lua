
-- Planetaris: Hyper Belts
local hyper_splitter_recipe = data.raw["recipe"]["planetaris-hyper-lane-splitter"]
if (hyper_splitter_recipe) then
	-- Sync the recipe and the item icons.
	hyper_splitter_recipe.icon = data.raw["item"]["planetaris-hyper-lane-splitter"].icon
	hyper_splitter_recipe.icons = data.raw["item"]["planetaris-hyper-lane-splitter"].icons

	-- Fix up crafting conditions on hyper balancer when Hyarion is installed.
	if (mods["planetaris-hyarion"]) then
		hyper_splitter_recipe.surface_conditions = {
			{ property = "planetaris-crystalization-resistance", min = 50, max = 100, }
		}
	end
end
