
module ('net', package.seeall)

require 'lux.list'

local msg = {}

local serializers = {}

function serialize (data)
  return serializers[type(data)](data)
end

function serializers.number (n)
  return tostring(n)
end

function serializers.string (s)
  return '"'..s..'"'
end

function serializers.boolean (b)
  return tostring(b)
end

serializers["function"] = function (f)
  return nil
end

function serializers.table (t)
  local s = "{"
  for k,v in pairs(t) do
    s = s .. "[" .. serialize(k) .. "]="
    s = s .. serialize(v) .. ","
  end
  s = s .. "}"
  return s
end

local function unserialize (strdata)
  return strdata and assert(loadstring("return "..strdata)) ()
end

local function push (id, data)
  if not msg[id] then
    msg[id] = lux.list:new{}
  end
  msg[id]:push_back(data)
end

local function pop (id)
  return msg[id] and msg[id]:pop_front()
end

function sendto (id, data)
  if not data then
    return function (data)
      return sendto(id, data)
    end
  end
  push(id, serialize(data))
end

function receivefrom (id)
  return unserialize(pop(id))
end
