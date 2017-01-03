from xml.dom import minidom

xmldoc = minidom.parse('items.xml')
itemlist = xmldoc.getElementsByTagName('coordinates')
lat = itemlist[0].attributes['latitude'].value
lon = itemlist[0].attributes['longitude'].value
print("found here: "+"http://maps.google.com/maps?z=12&t=m&q=loc:"+lat+"+"+lon)
