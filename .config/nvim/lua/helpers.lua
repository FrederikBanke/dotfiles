local helpers = {}
-- Return a new table with the values merged from `first_table` and `second_table`.
-- The values of `second_table` will overwrite those in `first_table`, if they have the same keys.
function helpers.merge(first_table, second_table)
    local new_table = {}
    for k, v in pairs(first_table) do new_table[k] = v end
    for k, v in pairs(second_table) do new_table[k] = v end
    return new_table
end

return helpers
