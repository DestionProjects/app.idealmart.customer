import math

def haversine(lat1, lon1, lat2, lon2):
    # Radius of the Earth in km
    R = 6371.0
    
    # Convert latitude and longitude from degrees to radians
    lat1_rad = math.radians(lat1)
    lon1_rad = math.radians(lon1)
    lat2_rad = math.radians(lat2)
    lon2_rad = math.radians(lon2)
    
    # Difference in coordinates
    dlat = lat2_rad - lat1_rad
    dlon = lon2_rad - lon1_rad
    
    # Haversine formula
    a = math.sin(dlat / 2)**2 + math.cos(lat1_rad) * math.cos(lat2_rad) * math.sin(dlon / 2)**2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    
    # Distance in km
    distance = R * c
    return distance

# Example usage
customer_location = (12.9715987, 77.5945627)  # (latitude, longitude)
stores = [
    {"name": "Store 1", "location": (13.0358, 77.5970)},
    {"name": "Store 2", "location": (12.9260, 77.6762)},
    {"name": "Store 3", "location": (12.9352, 77.6245)}
]

total_distance = 0
for store in stores:
    distance = haversine(customer_location[0], customer_location[1], store["location"][0], store["location"][1])
    total_distance += distance
    print(f"Distance to {store['name']}: {distance:.2f} km")

average_distance = total_distance 
print(f"TotalS distance: {average_distance:.2f} km")
