def hex_to_rgb(hex):
    hex = hex.lstrip('#')
    hlen = len(hex)
    return tuple(int(hex[i:i + hlen // 3], 16) for i in range(0, hlen, hlen // 3))

def rgb_to_hex(red, green, blue):
    hex_result = "".join([format(val, '02X') for val in (red, green, blue)])
    return "#"+hex_result