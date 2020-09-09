--- Functions for working with directions.
-- @module direction
-- @alias flib_direction
-- @usage local direction = require('__flib__.direction')
-- @see defines.direction

local flib_direction = {}

--- Returns the opposite direction
-- @tparam defines.direction direction the direction
-- @treturn defines.direction the opposite direction
function flib_direction.opposite(direction)
  return (direction + 4) % 8
end

--- Returns the next direction.
--> For entities that only support two directions, see @{opposite}.
-- @tparam defines.direction direction the starting direction
-- @tparam[opt=false] boolean eight_way true to get the next direction in 8-way (note: not many prototypes support
-- 8-way)
-- @treturn defines.direction the next direction
function flib_direction.next(direction, eight_way)
  return (direction + (eight_way and 1 or 2)) % 8
end

--- Returns the previous direction.
--> For entities that only support two directions, see @{opposite}.
-- @tparam defines.direction direction the starting direction
-- @tparam[opt=false] boolean eight_way true to get the previous direction in 8-way (note: not many prototypes support
-- 8-way)
-- @treturn defines.direction the next direction
function flib_direction.previous(direction, eight_way)
  return (direction + (eight_way and -1 or -2)) % 8
end

--- Returns an orientation from a direction.
-- @tparam defines.direction direction
-- @treturn number
function flib_direction.to_orientation(direction)
  return direction / 8
end

--- Returns a vector from a direction.
-- @tparam defines.direction direction
-- @tparam[opt = 1] number distance
-- @treturn Concepts.Position
function flib_direction.to_vector(direction, distance)
  local directions = defines.direction
  distance = distance or 1
  local x, y = 0, 0
  if direction == directions.north then
    y = y - distance
  elseif direction == directions.northeast then
    x, y = x + distance, y - distance
  elseif direction == directions.east then
    x = x + distance
  elseif direction == directions.southeast then
    x, y = x + distance, y + distance
  elseif direction == directions.south then
    y = y + distance
  elseif direction == directions.southwest then
    x, y = x - distance, y + distance
  elseif direction == directions.west then
    x = x - distance
  elseif direction == directions.northwest then
    x, y = x - distance, y - distance
  end
  return {x = x, y = y}
end

--- Returns a two-dimensional vector from a cardinal direction.
--
-- Only supports cardinal (four-way) directions.
-- @tparam defines.direction direction
-- @tparam number longitudinal Distance to move in the specified direction.
-- @tparam number orthogonal Distance to move perpendicular to the specified direction. A negative distance will move
-- "left" and a positive distance will move "right" from the perspective of the direction.
-- @treturn Concepts.Position
function flib_direction.to_vector_2d(direction, longitudinal, orthogonal)
  if direction == defines.direction.north then
    return {x=orthogonal, y=-longitudinal}
  elseif direction == defines.direction.south then
    return {x=-orthogonal, y=longitudinal}
  elseif direction == defines.direction.east then
    return {x=longitudinal, y=orthogonal}
  elseif direction == defines.direction.west then
    return {x=-longitudinal, y=-orthogonal}
  end
end

return flib_direction