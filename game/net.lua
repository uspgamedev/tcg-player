
module ('net', package.seeall)

local msg

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
  return assert(loadstring("return "..strdata)) ()
end

function send (data)
  msg = serialize(data)
end

function receive ()
  return unserialize(msg)
end
