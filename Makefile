VERSION:=$(shell cat VERSION)
VERSION_PREFIXED=_$(VERSION)
#PACKAGE=NaturalEarth-vector-$(VERSION)
#TARBALL=$(PACKAGE).tar.gz
#Remember to escape the : in the urls
#http://www.slac.stanford.edu/BFROOT/www/Computing/Offline/DataDist/ssh-idfile.html
DOCROOT_NE=naturalearthdata.com:download/test
#DOCROOT_NE=ftp\://naturalearthdata.com:download/test
DOCROOT_FREAC=ftp\://ftp.freac.fsu.edu:web-download/test

all: zips
	#Done!

zips: zips/packages/natural_earth_vector.zip \
	zips/packages/Natural_Earth_quick_start.zip
	#Made zips...

zips/packages/natural_earth_vector.zip: \
	zips/10m_cultural/10m_cultural.zip \
	zips/10m_physical/10m_physical.zip \
	zips/50m_cultural/50m_cultural.zip \
	zips/50m_physical/50m_physical.zip \
	zips/110m_cultural/110m_cultural.zip \
	zips/110m_physical/110m_physical.zip \
	zips/packages/natural_earth_vector.sqlite.zip
	
	zip -r $@ 10m_cultural 10m_physical 50m_cultural 50m_physical 110m_cultural 110m_physical VERSION README.md CHANGELOG
	#Bake off a version'd iteration of that file, too
	cp $@ archive/natural_earth_vector_$(VERSION).zip


zips/packages/natural_earth_vector.sqlite.zip:
	#SQL-Lite
	rm packages/natural_earth_vector.sqlite
	for shp in 10m_cultural/*.shp 10m_physical/*.shp 50m_cultural/*.shp 50m_physical/*.shp 110m_cultural/*.shp 110m_physical/*.shp; \
	do \
		ogr2ogr -f SQLite -append packages/natural_earth_vector.sqlite $$shp; \
	done
	zip $@ packages/natural_earth_vector.sqlite VERSION README.md CHANGELOG

	cp $@ archive/natural_earth_vector.sqlite_$(VERSION).zip
	
	
zips/packages/Natural_Earth_quick_start.zip: \
	packages/Natural_Earth_quick_start/10m_cultural/status.txt \
	packages/Natural_Earth_quick_start/10m_physical/status.txt \
	packages/Natural_Earth_quick_start/50m_raster/status.txt \
	packages/Natural_Earth_quick_start/110m_cultural/status.txt \
	packages/Natural_Earth_quick_start/110m_physical/status.txt

	zip -r $@ packages/Natural_Earth_quick_start/ VERSION README.md CHANGELOG
	cp $@ archive/Natural_Earth_quick_start_$(VERSION).zip

# PER THEME, BY SCALESET

# SCALESET ZIPS by zoom and physical, cultural (6 total)

zips/10m_cultural/10m_cultural.zip: \
	zips/10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.zip \
	zips/10m_cultural/ne_10m_admin_0_boundary_lines_land.zip \
	zips/10m_cultural/ne_10m_admin_0_boundary_lines_map_units.zip \
	zips/10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.zip \
	zips/10m_cultural/ne_10m_admin_0_breakaway_disputed_areas_scale_ranks.zip \
	zips/10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.zip \
	zips/10m_cultural/ne_10m_admin_0_countries.zip \
	zips/10m_cultural/ne_10m_admin_0_map_subunits.zip \
	zips/10m_cultural/ne_10m_admin_0_map_units.zip \
	zips/10m_cultural/ne_10m_admin_0_pacific_groupings.zip \
	zips/10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.zip \
	zips/10m_cultural/ne_10m_admin_0_scale_ranks.zip \
	zips/10m_cultural/ne_10m_admin_0_sovereignty.zip \
	zips/10m_cultural/ne_10m_admin_1_states_provinces_lakes_shp.zip \
	zips/10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.zip \
	zips/10m_cultural/ne_10m_admin_1_states_provinces_shp.zip \
	zips/10m_cultural/ne_10m_populated_places_simple.zip \
	zips/10m_cultural/ne_10m_populated_places.zip \
	zips/10m_cultural/ne_10m_railroads.zip \
	zips/10m_cultural/ne_10m_roads_north_america.zip \
	zips/10m_cultural/ne_10m_roads.zip \
	zips/10m_cultural/ne_10m_urban_areas_landscan.zip \
	zips/10m_cultural/ne_10m_urban_areas.zip \
	zips/10m_cultural/ne_10m_admin_1_states_provinces_geodb.zip \
	zips/10m_cultural/ne_10m_admin_1_states_provinces_lakes_geodb.zip \
	zips/10m_cultural/ne_10m_parks_and_protected_areas.zip

	zip -r zips/10m_cultural/10m_cultural.zip 10m_cultural VERSION README.md CHANGELOG
	cp $@ archive/10m_cultural_$(VERSION).zip	

zips/10m_physical/10m_physical.zip: \
	zips/10m_physical/ne_10m_antarctic_ice_shelves_lines.zip \
	zips/10m_physical/ne_10m_antarctic_ice_shelves_polys.zip \
	zips/10m_physical/ne_10m_coastline.zip \
	zips/10m_physical/ne_10m_geographic_lines.zip \
	zips/10m_physical/ne_10m_geography_marine_polys.zip \
	zips/10m_physical/ne_10m_geography_regions_elevation_points.zip \
	zips/10m_physical/ne_10m_geography_regions_points.zip \
	zips/10m_physical/ne_10m_geography_regions_polys.zip \
	zips/10m_physical/ne_10m_glaciated_areas.zip \
	zips/10m_physical/ne_10m_lakes_europe.zip \
	zips/10m_physical/ne_10m_lakes_historic.zip \
	zips/10m_physical/ne_10m_lakes_north_america.zip \
	zips/10m_physical/ne_10m_lakes_pluvial.zip \
	zips/10m_physical/ne_10m_lakes.zip \
	zips/10m_physical/ne_10m_land.zip \
	zips/10m_physical/ne_10m_minor_islands_coastline.zip \
	zips/10m_physical/ne_10m_minor_islands.zip \
	zips/10m_physical/ne_10m_ocean.zip \
	zips/10m_physical/ne_10m_playas.zip \
	zips/10m_physical/ne_10m_reefs.zip \
	zips/10m_physical/ne_10m_rivers_europe.zip \
	zips/10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.zip \
	zips/10m_physical/ne_10m_rivers_lake_centerlines.zip \
	zips/10m_physical/ne_10m_rivers_north_america.zip \
	zips/10m_physical/ne_10m_bathymetry_all.zip \
	zips/10m_physical/ne_10m_bathymetry_A_10000.zip \
	zips/10m_physical/ne_10m_bathymetry_B_9000.zip \
	zips/10m_physical/ne_10m_bathymetry_C_8000.zip \
	zips/10m_physical/ne_10m_bathymetry_D_7000.zip \
	zips/10m_physical/ne_10m_bathymetry_E_6000.zip \
	zips/10m_physical/ne_10m_bathymetry_F_5000.zip \
	zips/10m_physical/ne_10m_bathymetry_G_4000.zip \
	zips/10m_physical/ne_10m_bathymetry_H_3000.zip \
	zips/10m_physical/ne_10m_bathymetry_I_2000.zip \
	zips/10m_physical/ne_10m_bathymetry_J_1000.zip \
	zips/10m_physical/ne_10m_bathymetry_K_200.zip \
	zips/10m_physical/ne_10m_bathymetry_L_0.zip \
	zips/10m_physical/ne_10m_graticules_all.zip \
	zips/10m_physical/ne_10m_graticules_1.zip \
	zips/10m_physical/ne_10m_graticules_5.zip \
	zips/10m_physical/ne_10m_graticules_10.zip \
	zips/10m_physical/ne_10m_graticules_15.zip \
	zips/10m_physical/ne_10m_graticules_20.zip \
	zips/10m_physical/ne_10m_graticules_30.zip \
	zips/10m_physical/ne_10m_wgs84_bounding_box.zip

	zip -j -r $@ 10m_physical VERSION README.md CHANGELOG
	cp $@ archive/10m_physical_$(VERSION).zip

zips/50m_cultural/50m_cultural.zip: \
	zips/50m_cultural/ne_50m_admin_0_boundary_breakaway_disputed_areas.zip \
	zips/50m_cultural/ne_50m_admin_0_boundary_lines_land.zip \
	zips/50m_cultural/ne_50m_admin_0_boundary_lines_maritime_indicator.zip \
	zips/50m_cultural/ne_50m_admin_0_boundary_map_units.zip \
	zips/50m_cultural/ne_50m_admin_0_breakaway_disputed_areas.zip \
	zips/50m_cultural/ne_50m_admin_0_countries.zip \
	zips/50m_cultural/ne_50m_admin_0_map_subunits.zip \
	zips/50m_cultural/ne_50m_admin_0_map_units.zip \
	zips/50m_cultural/ne_50m_admin_0_pacific_groupings.zip \
	zips/50m_cultural/ne_50m_admin_0_scale_ranks.zip \
	zips/50m_cultural/ne_50m_admin_0_sovereignty.zip \
	zips/50m_cultural/ne_50m_admin_0_tiny_countries.zip \
	zips/50m_cultural/ne_50m_admin_1_states_provinces_lines_shp.zip \
	zips/50m_cultural/ne_50m_admin_1_states_provinces_shp.zip \
	zips/50m_cultural/ne_50m_populated_places_simple.zip \
	zips/50m_cultural/ne_50m_populated_places.zip \
	zips/50m_cultural/ne_50m_urban_areas.zip

	zip -j -r zips/50m_cultural/50m_cultural.zip 50m_cultural VERSION README.md CHANGELOG
	cp $@ archive/50m_cultural_$(VERSION).zip

zips/50m_physical/50m_physical.zip: \
	zips/50m_physical/ne_50m_antarctic_ice_shelves_lines.zip \
	zips/50m_physical/ne_50m_antarctic_ice_shelves_polys.zip \
	zips/50m_physical/ne_50m_coastline.zip \
	zips/50m_physical/ne_50m_geographic_lines.zip \
	zips/50m_physical/ne_50m_geography_marine_polys.zip \
	zips/50m_physical/ne_50m_geography_regions_elevation_points.zip \
	zips/50m_physical/ne_50m_geography_regions_points.zip \
	zips/50m_physical/ne_50m_geography_regions_polys.zip \
	zips/50m_physical/ne_50m_glaciated_areas.zip \
	zips/50m_physical/ne_50m_lakes_historic.zip \
	zips/50m_physical/ne_50m_lakes.zip \
	zips/50m_physical/ne_50m_land.zip \
	zips/50m_physical/ne_50m_ocean.zip \
	zips/50m_physical/ne_50m_playas.zip \
	zips/50m_physical/ne_50m_rivers_lake_centerlines_scale_ranks.zip \
	zips/50m_physical/ne_50m_rivers_lake_centerlines.zip \
	zips/50m_physical/ne_50m_graticules_all.zip \
	zips/50m_physical/ne_50m_graticules_1.zip \
	zips/50m_physical/ne_50m_graticules_5.zip \
	zips/50m_physical/ne_50m_graticules_10.zip \
	zips/50m_physical/ne_50m_graticules_15.zip \
	zips/50m_physical/ne_50m_graticules_20.zip \
	zips/50m_physical/ne_50m_graticules_30.zip \
	zips/50m_physical/ne_50m_wgs84_bounding_box.zip

	zip -j -r zips/50m_physical/50m_physical.zip 50m_physical VERSION README.md CHANGELOG
	cp $@ archive/50m_physical_$(VERSION).zip

zips/110m_cultural/110m_cultural.zip: \
	zips/110m_cultural/ne_110m_admin_0_boundary_lines_land.zip \
	zips/110m_cultural/ne_110m_admin_0_countries.zip \
	zips/110m_cultural/ne_110m_admin_0_map_units.zip \
	zips/110m_cultural/ne_110m_admin_0_pacific_groupings.zip \
	zips/110m_cultural/ne_110m_admin_0_scale_ranks.zip \
	zips/110m_cultural/ne_110m_admin_0_sovereignty.zip \
	zips/110m_cultural/ne_110m_admin_0_tiny_countries.zip \
	zips/110m_cultural/ne_110m_admin_1_states_provinces_lines_shp.zip \
	zips/110m_cultural/ne_110m_admin_1_states_provinces_shp.zip \
	zips/110m_cultural/ne_110m_populated_places_simple.zip \
	zips/110m_cultural/ne_110m_populated_places.zip
	
	zip -j -r zips/110m_cultural/110m_cultural.zip 110m_cultural VERSION README.md CHANGELOG
	cp $@ archive/110m_cultural_$(VERSION).zip

zips/110m_physical/110m_physical.zip: \
	zips/110m_physical/ne_110m_coastline.zip \
	zips/110m_physical/ne_110m_geographic_lines.zip \
	zips/110m_physical/ne_110m_geography_marine_polys.zip \
	zips/110m_physical/ne_110m_geography_regions_elevation_points.zip \
	zips/110m_physical/ne_110m_geography_regions_points.zip \
	zips/110m_physical/ne_110m_geography_regions_polys.zip \
	zips/110m_physical/ne_110m_glaciated_areas.zip \
	zips/110m_physical/ne_110m_lakes.zip \
	zips/110m_physical/ne_110m_land.zip \
	zips/110m_physical/ne_110m_ocean.zip \
	zips/110m_physical/ne_110m_physical_geographic_lines.zip \
	zips/110m_physical/ne_110m_rivers_lake_centerlines.zip \
	zips/110m_physical/ne_110m_graticules_all.zip \
	zips/110m_physical/ne_110m_graticules_1.zip \
	zips/110m_physical/ne_110m_graticules_5.zip \
	zips/110m_physical/ne_110m_graticules_10.zip \
	zips/110m_physical/ne_110m_graticules_15.zip \
	zips/110m_physical/ne_110m_graticules_20.zip \
	zips/110m_physical/ne_110m_graticules_30.zip \
	zips/110m_physical/ne_110m_wgs84_bounding_box.zip

	zip -j -r zips/110m_physical/110m_physical.zip 110m_physical VERSION README.md CHANGELOG
	cp $@ archive/110m_physical_$(VERSION).zip


# THEMES

# If either the geometry or the attributes change, time to remake the ZIPs

# grep pattern matching: 
#find:    (\.\./zips/(\w+)/(\w+)\.zip): \r\tzip -j -r \$@ \r
#replace: \1: \2/\3.shp \2/\3.dbf\r\tzip -j -r $@ \2/\3.*\r

# 10m_cultural

zips/10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.zip: 10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.shp 10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.*
	cp $@ archive/ne_10m_admin_0_boundary_breakaway_disputed_areas$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_admin_0_boundary_lines_land.zip: 10m_cultural/ne_10m_admin_0_boundary_lines_land.shp 10m_cultural/ne_10m_admin_0_boundary_lines_land.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_boundary_lines_land.*
	cp $@ archive/ne_10m_admin_0_boundary_lines_land$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_0_boundary_lines_map_units.zip: 10m_cultural/ne_10m_admin_0_boundary_lines_map_units.shp 10m_cultural/ne_10m_admin_0_boundary_lines_map_units.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_boundary_lines_map_units.*
	cp $@ archive/ne_10m_admin_0_boundary_lines_map_units$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.zip: 10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.shp 10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.*
	cp $@ archive/ne_10m_admin_0_boundary_lines_maritime_indicator$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_0_breakaway_disputed_areas_scale_ranks.zip: 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas_scale_ranks.shp 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas_scale_ranks.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas_scale_ranks.*
	cp $@ archive/ne_10m_admin_0_breakaway_disputed_areas_scale_ranks$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.zip: 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.shp 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.*
	cp $@ archive/ne_10m_admin_0_breakaway_disputed_areas$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_admin_0_countries.zip: 10m_cultural/ne_10m_admin_0_countries.shp 10m_cultural/ne_10m_admin_0_countries.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_countries.*
	cp $@ archive/ne_10m_admin_0_countries$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_0_map_subunits.zip: 10m_cultural/ne_10m_admin_0_map_subunits.shp 10m_cultural/ne_10m_admin_0_map_subunits.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_map_subunits.*
	cp $@ archive/ne_10m_admin_0_map_subunits$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_0_map_units.zip: 10m_cultural/ne_10m_admin_0_map_units.shp 10m_cultural/ne_10m_admin_0_map_units.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_map_units.*
	cp $@ archive/ne_10m_admin_0_map_units$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_admin_0_pacific_groupings.zip: 10m_cultural/ne_10m_admin_0_pacific_groupings.shp 10m_cultural/ne_10m_admin_0_pacific_groupings.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_pacific_groupings.*
	cp $@ archive/ne_10m_admin_0_pacific_groupings$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.zip: 10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.shp 10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.*
	cp $@ archive/ne_10m_admin_0_scale_ranks_with_minor_islands$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_admin_0_scale_ranks.zip: 10m_cultural/ne_10m_admin_0_scale_ranks.shp 10m_cultural/ne_10m_admin_0_scale_ranks.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_scale_ranks.*
	cp $@ archive/ne_10m_admin_0_scale_ranks$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_admin_0_sovereignty.zip: 10m_cultural/ne_10m_admin_0_sovereignty.shp 10m_cultural/ne_10m_admin_0_sovereignty.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_0_sovereignty.*
	cp $@ archive/ne_10m_admin_0_sovereignty$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_admin_1_states_provinces_lakes_shp.zip: 10m_cultural/ne_10m_admin_1_states_provinces_lakes_shp.shp 10m_cultural/ne_10m_admin_1_states_provinces_lakes_shp.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_1_states_provinces_lakes_shp.*
	cp $@ archive/ne_10m_admin_1_states_provinces_lakes_shp$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.zip: 10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.shp 10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.*
	cp $@ archive/ne_10m_admin_1_states_provinces_lines_shp$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_1_states_provinces_shp.zip: 10m_cultural/ne_10m_admin_1_states_provinces_shp.shp 10m_cultural/ne_10m_admin_1_states_provinces_shp.dbf
	zip -j -r $@ 10m_cultural/ne_10m_admin_1_states_provinces_shp.*
	cp $@ archive/ne_10m_admin_1_states_provinces_shp$(VERSION_PREFIXED).zip
	
zips/10m_cultural/ne_10m_populated_places_simple.zip: 10m_cultural/ne_10m_populated_places_simple.shp 10m_cultural/ne_10m_populated_places_simple.dbf
	zip -j -r $@ 10m_cultural/ne_10m_populated_places_simple.*
	cp $@ archive/ne_10m_populated_places_simple$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_populated_places.zip: 10m_cultural/ne_10m_populated_places.shp 10m_cultural/ne_10m_populated_places.dbf
	zip -j -r $@ 10m_cultural/ne_10m_populated_places.*
	cp $@ archive/ne_10m_populated_places$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_railroads.zip: 10m_cultural/ne_10m_railroads.shp 10m_cultural/ne_10m_railroads.dbf
	zip -j -r $@ 10m_cultural/ne_10m_railroads.*
	cp $@ archive/ne_10m_railroads$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_roads.zip: 10m_cultural/ne_10m_roads.shp 10m_cultural/ne_10m_roads.dbf
	zip -j -r $@ 10m_cultural/ne_10m_roads.*
	cp $@ archive/ne_10m_roads$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_roads_north_america.zip: 10m_cultural/ne_10m_roads_north_america.shp 10m_cultural/ne_10m_roads_north_america.dbf
	zip -j -r $@ 10m_cultural/ne_10m_roads_north_america.*
	cp $@ archive/ne_10m_roads_north_america$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_urban_areas_landscan.zip: 10m_cultural/ne_10m_urban_areas_landscan.shp 10m_cultural/ne_10m_urban_areas_landscan.dbf
	zip -j -r $@ 10m_cultural/ne_10m_urban_areas_landscan.*
	cp $@ archive/ne_10m_urban_areas_landscan$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_urban_areas.zip: 10m_cultural/ne_10m_urban_areas.shp 10m_cultural/ne_10m_urban_areas.dbf
	zip -j -r $@ 10m_cultural/ne_10m_urban_areas.*
	cp $@ archive/ne_10m_urban_areas$(VERSION_PREFIXED).zip
			
# folders for theme groups or geodb special items
zips/10m_cultural/ne_10m_admin_1_states_provinces_geodb.zip: 10m_cultural/ne_10m_admin_1_states_provinces_geodb.gdb/gdb
	zip -j -r $@ 10m_cultural/ne_10m_admin_1_states_provinces_geodb.gdb
	cp $@ archive/ne_10m_admin_1_states_provinces_geodb$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_admin_1_states_provinces_lakes_geodb.zip: 10m_cultural/ne_10m_admin_1_states_provinces_lakes_geodb.gdb/gdb
	zip -j -r $@ 10m_cultural/ne_10m_admin_1_states_provinces_lakes_geodb.gdb
	cp $@ archive/ne_10m_admin_1_states_provinces_lakes_geodb$(VERSION_PREFIXED).zip

zips/10m_cultural/ne_10m_parks_and_protected_areas.zip: \
	10m_cultural/ne_10m_parks_and_protected_areas/ne_10m_us_parks_area.shp 10m_cultural/ne_10m_parks_and_protected_areas/ne_10m_us_parks_area.dbf \
	10m_cultural/ne_10m_parks_and_protected_areas/ne_10m_us_parks_line.shp 10m_cultural/ne_10m_parks_and_protected_areas/ne_10m_us_parks_line.dbf \
	10m_cultural/ne_10m_parks_and_protected_areas/ne_10m_us_parks_point.shp 10m_cultural/ne_10m_parks_and_protected_areas/ne_10m_us_parks_point.dbf \
	10m_cultural/ne_10m_parks_and_protected_areas/10m_us_parks_READ_ME.rtf
	
	zip -j -r $@ 10m_cultural/ne_10m_parks_and_protected_areas/ne_10m_us_parks_*.* 10m_cultural/ne_10m_parks_and_protected_areas/10m_us_parks_READ_ME.rtf
	cp $@ archive/ne_10m_parks_and_protected_areas$(VERSION_PREFIXED).zip


# 10m physical:

zips/10m_physical/ne_10m_antarctic_ice_shelves_lines.zip: 10m_physical/ne_10m_antarctic_ice_shelves_lines.shp 10m_physical/ne_10m_antarctic_ice_shelves_lines.dbf
	zip -j -r $@ 10m_physical/ne_10m_antarctic_ice_shelves_lines.*
	cp $@ archive/ne_10m_antarctic_ice_shelves_lines$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_antarctic_ice_shelves_polys.zip: 10m_physical/ne_10m_antarctic_ice_shelves_polys.shp 10m_physical/ne_10m_antarctic_ice_shelves_polys.dbf
	zip -j -r $@ 10m_physical/ne_10m_antarctic_ice_shelves_polys.*
	cp $@ archive/ne_10m_antarctic_ice_shelves_lines$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_coastline.zip: 10m_physical/ne_10m_coastline.shp 10m_physical/ne_10m_coastline.dbf
	zip -j -r $@ 10m_physical/ne_10m_coastline.*
	cp $@ archive/ne_10m_coastline$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_geographic_lines.zip: 10m_physical/ne_10m_geographic_lines.shp 10m_physical/ne_10m_geographic_lines.dbf
	zip -j -r $@ 10m_physical/ne_10m_geographic_lines.*
	cp $@ archive/ne_10m_geographic_lines$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_geography_marine_polys.zip: 10m_physical/ne_10m_geography_marine_polys.shp 10m_physical/ne_10m_geography_marine_polys.dbf
	zip -j -r $@ 10m_physical/ne_10m_geography_marine_polys.*
	cp $@ archive/ne_10m_geography_marine_polys$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_geography_regions_elevation_points.zip: 10m_physical/ne_10m_geography_regions_elevation_points.shp 10m_physical/ne_10m_geography_regions_elevation_points.dbf
	zip -j -r $@ 10m_physical/ne_10m_geography_regions_elevation_points.*
	cp $@ archive/ne_10m_geography_regions_elevation_points$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_geography_regions_points.zip: 10m_physical/ne_10m_geography_regions_points.shp 10m_physical/ne_10m_geography_regions_points.dbf
	zip -j -r $@ 10m_physical/ne_10m_geography_regions_points.*
	cp $@ archive/ne_10m_geography_regions_points$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_geography_regions_polys.zip: 10m_physical/ne_10m_geography_regions_polys.shp 10m_physical/ne_10m_geography_regions_polys.dbf
	zip -j -r $@ 10m_physical/ne_10m_geography_regions_polys.*
	cp $@ archive/ne_10m_geography_regions_polys$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_glaciated_areas.zip: 10m_physical/ne_10m_glaciated_areas.shp 10m_physical/ne_10m_glaciated_areas.dbf
	zip -j -r $@ 10m_physical/ne_10m_glaciated_areas.*
	cp $@ archive/ne_10m_glaciated_areas$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_lakes_europe.zip: 10m_physical/ne_10m_lakes_europe.shp 10m_physical/ne_10m_lakes_europe.dbf
	zip -j -r $@ 10m_physical/ne_10m_lakes_europe.*
	cp $@ archive/ne_10m_lakes_europe$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_lakes_historic.zip: 10m_physical/ne_10m_lakes_historic.shp 10m_physical/ne_10m_lakes_historic.dbf
	zip -j -r $@ 10m_physical/ne_10m_lakes_historic.*
	cp $@ archive/ne_10m_lakes_historic$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_lakes_north_america.zip: 10m_physical/ne_10m_lakes_north_america.shp 10m_physical/ne_10m_lakes_north_america.dbf
	zip -j -r $@ 10m_physical/ne_10m_lakes_north_america.*
	cp $@ archive/ne_10m_lakes_north_america$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_lakes_pluvial.zip: 10m_physical/ne_10m_lakes_pluvial.shp 10m_physical/ne_10m_lakes_pluvial.dbf
	zip -j -r $@ 10m_physical/ne_10m_lakes_pluvial.*
	cp $@ archive/ne_10m_lakes_pluvial$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_lakes.zip: 10m_physical/ne_10m_lakes.shp 10m_physical/ne_10m_lakes.dbf
	zip -j -r $@ 10m_physical/ne_10m_lakes.*
	cp $@ archive/ne_10m_lakes$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_land.zip: 10m_physical/ne_10m_land.shp 10m_physical/ne_10m_land.dbf
	zip -j -r $@ 10m_physical/ne_10m_land.*
	cp $@ archive/ne_10m_land$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_minor_islands_coastline.zip: 10m_physical/ne_10m_minor_islands_coastline.shp 10m_physical/ne_10m_minor_islands_coastline.dbf
	zip -j -r $@ 10m_physical/ne_10m_minor_islands_coastline.*
	cp $@ archive/ne_10m_minor_islands_coastline$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_minor_islands.zip: 10m_physical/ne_10m_minor_islands.shp 10m_physical/ne_10m_minor_islands.dbf
	zip -j -r $@ 10m_physical/ne_10m_minor_islands.*
	cp $@ archive/ne_10m_minor_islands$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_ocean.zip: 10m_physical/ne_10m_ocean.shp 10m_physical/ne_10m_ocean.dbf
	zip -j -r $@ 10m_physical/ne_10m_ocean.*
	cp $@ archive/ne_10m_ocean$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_playas.zip: 10m_physical/ne_10m_playas.shp 10m_physical/ne_10m_playas.dbf
	zip -j -r $@ 10m_physical/ne_10m_playas.*
	cp $@ archive/ne_10m_playas$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_reefs.zip: 10m_physical/ne_10m_reefs.shp 10m_physical/ne_10m_reefs.dbf
	zip -j -r $@ 10m_physical/ne_10m_reefs.*
	cp $@ archive/ne_10m_reefs$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_rivers_europe.zip: 10m_physical/ne_10m_rivers_europe.shp 10m_physical/ne_10m_rivers_europe.dbf
	zip -j -r $@ 10m_physical/ne_10m_rivers_europe.*
	cp $@ archive/ne_10m_rivers_europe$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.zip: 10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.shp 10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.dbf
	zip -j -r $@ 10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.*
	cp $@ archive/ne_10m_rivers_lake_centerlines_scale_ranks$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_rivers_lake_centerlines.zip: 10m_physical/ne_10m_rivers_lake_centerlines.shp 10m_physical/ne_10m_rivers_lake_centerlines.dbf
	zip -j -r $@ 10m_physical/ne_10m_rivers_lake_centerlines.*
	cp $@ archive/ne_10m_rivers_lake_centerlines$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_rivers_north_america.zip: 10m_physical/ne_10m_rivers_north_america.shp 10m_physical/ne_10m_rivers_north_america.dbf
	zip -j -r $@ 10m_physical/ne_10m_rivers_north_america.*
	cp $@ archive/ne_10m_rivers_north_america$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_all.zip: \
	zips/10m_physical/ne_10m_bathymetry_A_10000.zip \
	zips/10m_physical/ne_10m_bathymetry_B_9000.zip \
	zips/10m_physical/ne_10m_bathymetry_C_8000.zip \
	zips/10m_physical/ne_10m_bathymetry_D_7000.zip \
	zips/10m_physical/ne_10m_bathymetry_E_6000.zip \
	zips/10m_physical/ne_10m_bathymetry_F_5000.zip \
	zips/10m_physical/ne_10m_bathymetry_G_4000.zip \
	zips/10m_physical/ne_10m_bathymetry_H_3000.zip \
	zips/10m_physical/ne_10m_bathymetry_I_2000.zip \
	zips/10m_physical/ne_10m_bathymetry_J_1000.zip \
	zips/10m_physical/ne_10m_bathymetry_K_200.zip \
	zips/10m_physical/ne_10m_bathymetry_L_0.zip
	
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/*.*
	cp $@ archive/ne_10m_bathymetry_all$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_A_10000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_A_10000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_A_10000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_A_10000.*
	cp $@ archive/ne_10m_bathymetry_A_10000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_B_9000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_B_9000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_B_9000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_B_9000.*
	cp $@ archive/ne_10m_bathymetry_B_9000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_C_8000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_C_8000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_C_8000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_C_8000.*
	cp $@ archive/ne_10m_bathymetry_C_8000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_D_7000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_D_7000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_D_7000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_D_7000.*
	cp $@ archive/ne_10m_bathymetry_D_7000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_E_6000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_E_6000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_E_6000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_E_6000.*
	cp $@ archive/ne_10m_bathymetry_E_6000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_F_5000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_F_5000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_F_5000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_F_5000.*
	cp $@ archive/ne_10m_bathymetry_F_5000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_G_4000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_G_4000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_G_4000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_G_4000.*
	cp $@ archive/ne_10m_bathymetry_G_4000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_H_3000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_H_3000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_H_3000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_H_3000.*
	cp $@ archive/ne_10m_bathymetry_H_3000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_I_2000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_I_2000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_I_2000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_I_2000.*
	cp $@ archive/ne_10m_bathymetry_I_2000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_J_1000.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_J_1000.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_J_1000.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_J_1000.*
	cp $@ archive/ne_10m_bathymetry_J_1000$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_K_200.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_K_200.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_K_200.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_K_200.*
	cp $@ archive/ne_10m_bathymetry_K_200$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_bathymetry_L_0.zip: 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_L_0.shp 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_L_0.dbf
	zip -j -r $@ 10m_physical/ne_10m_bathymetry_all/ne_10m_bathymetry_L_0.*
	cp $@ archive/ne_10m_bathymetry_L_0$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_graticules_all.zip: \
	zips/10m_physical/ne_10m_graticules_1.zip \
	zips/10m_physical/ne_10m_graticules_5.zip \
	zips/10m_physical/ne_10m_graticules_10.zip \
	zips/10m_physical/ne_10m_graticules_15.zip \
	zips/10m_physical/ne_10m_graticules_20.zip \
	zips/10m_physical/ne_10m_graticules_30.zip \
	zips/10m_physical/ne_10m_wgs84_bounding_box.zip
	
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/*.*
	cp $@ archive/ne_10m_graticules_all$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_graticules_1.zip: 10m_physical/ne_10m_graticules_all/ne_10m_graticules_1.shp 10m_physical/ne_10m_graticules_all/ne_10m_graticules_1.dbf
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/ne_10m_graticules_1.*
	cp $@ archive/ne_10m_graticules_1$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_graticules_5.zip: 10m_physical/ne_10m_graticules_all/ne_10m_graticules_5.shp 10m_physical/ne_10m_graticules_all/ne_10m_graticules_5.dbf
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/ne_10m_graticules_5.*
	cp $@ archive/ne_10m_graticules_5$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_graticules_10.zip: 10m_physical/ne_10m_graticules_all/ne_10m_graticules_10.shp 10m_physical/ne_10m_graticules_all/ne_10m_graticules_10.dbf
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/ne_10m_graticules_10.*
	cp $@ archive/ne_10m_graticules_10$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_graticules_15.zip: 10m_physical/ne_10m_graticules_all/ne_10m_graticules_15.shp 10m_physical/ne_10m_graticules_all/ne_10m_graticules_15.dbf
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/ne_10m_graticules_15.*
	cp $@ archive/ne_10m_graticules_15$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_graticules_20.zip: 10m_physical/ne_10m_graticules_all/ne_10m_graticules_20.shp 10m_physical/ne_10m_graticules_all/ne_10m_graticules_20.dbf
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/ne_10m_graticules_20.*
	cp $@ archive/ne_10m_graticules_20$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_graticules_30.zip: 10m_physical/ne_10m_graticules_all/ne_10m_graticules_30.shp 10m_physical/ne_10m_graticules_all/ne_10m_graticules_30.dbf
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/ne_10m_graticules_30.*
	cp $@ archive/ne_10m_graticules_30$(VERSION_PREFIXED).zip

zips/10m_physical/ne_10m_wgs84_bounding_box.zip: 10m_physical/ne_10m_graticules_all/ne_10m_wgs84_bounding_box.shp 10m_physical/ne_10m_graticules_all/ne_10m_wgs84_bounding_box.dbf
	zip -j -r $@ 10m_physical/ne_10m_graticules_all/ne_10m_wgs84_bounding_box.*
	cp $@ archive/ne_10m_wgs84_bounding_box$(VERSION_PREFIXED).zip


# 50m cultural

zips/50m_cultural/ne_50m_admin_0_boundary_breakaway_disputed_areas.zip: 50m_cultural/ne_50m_admin_0_boundary_breakaway_disputed_areas.shp 50m_cultural/ne_50m_admin_0_boundary_breakaway_disputed_areas.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_boundary_breakaway_disputed_areas.*
	cp $@ archive/ne_50m_admin_0_boundary_breakaway_disputed_areas$(VERSION_PREFIXED).zip
	
zips/50m_cultural/ne_50m_admin_0_boundary_lines_land.zip: 50m_cultural/ne_50m_admin_0_boundary_lines_land.shp 50m_cultural/ne_50m_admin_0_boundary_lines_land.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_boundary_lines_land.*
	cp $@ archive/ne_50m_admin_0_boundary_lines_land$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_boundary_lines_maritime_indicator.zip: 50m_cultural/ne_50m_admin_0_boundary_lines_maritime_indicator.shp 50m_cultural/ne_50m_admin_0_boundary_lines_maritime_indicator.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_boundary_lines_maritime_indicator.*
	cp $@ archive/ne_50m_admin_0_boundary_lines_maritime_indicator$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_boundary_map_units.zip: 50m_cultural/ne_50m_admin_0_boundary_map_units.shp 50m_cultural/ne_50m_admin_0_boundary_map_units.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_boundary_map_units.*
	cp $@ archive/ne_50m_admin_0_boundary_map_units$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_breakaway_disputed_areas.zip: 50m_cultural/ne_50m_admin_0_breakaway_disputed_areas.shp 50m_cultural/ne_50m_admin_0_breakaway_disputed_areas.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_breakaway_disputed_areas.*
	cp $@ archive/ne_50m_admin_0_breakaway_disputed_areas$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_countries.zip: 50m_cultural/ne_50m_admin_0_countries.shp 50m_cultural/ne_50m_admin_0_countries.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_countries.*
	cp $@ archive/ne_50m_admin_0_countries$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_map_subunits.zip: 50m_cultural/ne_50m_admin_0_map_subunits.shp 50m_cultural/ne_50m_admin_0_map_subunits.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_map_subunits.*
	cp $@ archive/ne_50m_admin_0_map_subunits$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_map_units.zip: 50m_cultural/ne_50m_admin_0_map_units.shp 50m_cultural/ne_50m_admin_0_map_units.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_map_units.*
	cp $@ archive/ne_50m_admin_0_map_units$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_pacific_groupings.zip: 50m_cultural/ne_50m_admin_0_pacific_groupings.shp 50m_cultural/ne_50m_admin_0_pacific_groupings.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_pacific_groupings.*
	cp $@ archive/ne_50m_admin_0_pacific_groupings$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_scale_ranks.zip: 50m_cultural/ne_50m_admin_0_scale_ranks.shp 50m_cultural/ne_50m_admin_0_scale_ranks.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_scale_ranks.*
	cp $@ archive/ne_50m_admin_0_scale_ranks$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_sovereignty.zip: 50m_cultural/ne_50m_admin_0_sovereignty.shp 50m_cultural/ne_50m_admin_0_sovereignty.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_sovereignty.*
	cp $@ archive/ne_50m_admin_0_sovereignty$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_0_tiny_countries.zip: 50m_cultural/ne_50m_admin_0_tiny_countries.shp 50m_cultural/ne_50m_admin_0_tiny_countries.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_0_tiny_countries.*
	cp $@ archive/ne_50m_admin_0_tiny_countries$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_1_states_provinces_lines_shp.zip: 50m_cultural/ne_50m_admin_1_states_provinces_lines_shp.shp 50m_cultural/ne_50m_admin_1_states_provinces_lines_shp.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_1_states_provinces_lines_shp.*
	cp $@ archive/ne_50m_admin_1_states_provinces_lines_shp$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_admin_1_states_provinces_shp.zip: 50m_cultural/ne_50m_admin_1_states_provinces_shp.shp 50m_cultural/ne_50m_admin_1_states_provinces_shp.dbf
	zip -j -r $@ 50m_cultural/ne_50m_admin_1_states_provinces_shp.*
	cp $@ archive/ne_50m_admin_1_states_provinces_shp$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_populated_places_simple.zip: 50m_cultural/ne_50m_populated_places_simple.shp 50m_cultural/ne_50m_populated_places_simple.dbf
	zip -j -r $@ 50m_cultural/ne_50m_populated_places_simple.*
	cp $@ archive/ne_50m_populated_places_simple$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_populated_places.zip: 50m_cultural/ne_50m_populated_places.shp 50m_cultural/ne_50m_populated_places.dbf
	zip -j -r $@ 50m_cultural/ne_50m_populated_places.*
	cp $@ archive/ne_50m_populated_places$(VERSION_PREFIXED).zip

zips/50m_cultural/ne_50m_urban_areas.zip: 50m_cultural/ne_50m_urban_areas.shp 50m_cultural/ne_50m_urban_areas.dbf
	zip -j -r $@ 50m_cultural/ne_50m_urban_areas.*
	cp $@ archive/ne_50m_urban_areas$(VERSION_PREFIXED).zip


# 50m physical

zips/50m_physical/ne_50m_antarctic_ice_shelves_lines.zip: 50m_physical/ne_50m_antarctic_ice_shelves_lines.shp 50m_physical/ne_50m_antarctic_ice_shelves_lines.dbf
	zip -j -r $@ 50m_physical/ne_50m_antarctic_ice_shelves_lines.*
	cp $@ archive/ne_50m_antarctic_ice_shelves_lines$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_antarctic_ice_shelves_polys.zip: 50m_physical/ne_50m_antarctic_ice_shelves_polys.shp 50m_physical/ne_50m_antarctic_ice_shelves_polys.dbf
	zip -j -r $@ 50m_physical/ne_50m_antarctic_ice_shelves_polys.*
	cp $@ archive/ne_50m_antarctic_ice_shelves_polys$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_coastline.zip: 50m_physical/ne_50m_coastline.shp 50m_physical/ne_50m_coastline.dbf
	zip -j -r $@ 50m_physical/ne_50m_coastline.*
	cp $@ archive/ne_50m_coastline$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_geographic_lines.zip: 50m_physical/ne_50m_geographic_lines.shp 50m_physical/ne_50m_geographic_lines.dbf
	zip -j -r $@ 50m_physical/ne_50m_geographic_lines.*
	cp $@ archive/ne_50m_geographic_lines$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_geography_marine_polys.zip: 50m_physical/ne_50m_geography_marine_polys.shp 50m_physical/ne_50m_geography_marine_polys.dbf
	zip -j -r $@ 50m_physical/ne_50m_geography_marine_polys.*
	cp $@ archive/ne_50m_geography_marine_polys$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_geography_regions_elevation_points.zip: 50m_physical/ne_50m_geography_regions_elevation_points.shp 50m_physical/ne_50m_geography_regions_elevation_points.dbf
	zip -j -r $@ 50m_physical/ne_50m_geography_regions_elevation_points.*
	cp $@ archive/ne_50m_geography_regions_elevation_points$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_geography_regions_points.zip: 50m_physical/ne_50m_geography_regions_points.shp 50m_physical/ne_50m_geography_regions_points.dbf
	zip -j -r $@ 50m_physical/ne_50m_geography_regions_points.*
	cp $@ archive/ne_50m_geography_regions_points$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_geography_regions_polys.zip: 50m_physical/ne_50m_geography_regions_polys.shp 50m_physical/ne_50m_geography_regions_polys.dbf
	zip -j -r $@ 50m_physical/ne_50m_geography_regions_polys.*
	cp $@ archive/ne_50m_geography_regions_polys$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_glaciated_areas.zip: 50m_physical/ne_50m_glaciated_areas.shp 50m_physical/ne_50m_glaciated_areas.dbf
	zip -j -r $@ 50m_physical/ne_50m_glaciated_areas.*
	cp $@ archive/ne_50m_glaciated_areas$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_lakes_historic.zip: 50m_physical/ne_50m_lakes_historic.shp 50m_physical/ne_50m_lakes_historic.dbf
	zip -j -r $@ 50m_physical/ne_50m_lakes_historic.*
	cp $@ archive/ne_50m_lakes_historic$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_lakes.zip: 50m_physical/ne_50m_lakes.shp 50m_physical/ne_50m_lakes.dbf
	zip -j -r $@ 50m_physical/ne_50m_lakes.*
	cp $@ archive/ne_50m_lakes$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_land.zip: 50m_physical/ne_50m_land.shp 50m_physical/ne_50m_land.dbf
	zip -j -r $@ 50m_physical/ne_50m_land.*
	cp $@ archive/ne_50m_land$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_ocean.zip: 50m_physical/ne_50m_ocean.shp 50m_physical/ne_50m_ocean.dbf
	zip -j -r $@ 50m_physical/ne_50m_ocean.*
	cp $@ archive/ne_50m_ocean$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_playas.zip: 50m_physical/ne_50m_playas.shp 50m_physical/ne_50m_playas.dbf
	zip -j -r $@ 50m_physical/ne_50m_playas.*
	cp $@ archive/ne_50m_playas$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_rivers_lake_centerlines_scale_ranks.zip: 50m_physical/ne_50m_rivers_lake_centerlines_scale_ranks.shp 50m_physical/ne_50m_rivers_lake_centerlines_scale_ranks.dbf
	zip -j -r $@ 50m_physical/ne_50m_rivers_lake_centerlines_scale_ranks.*
	cp $@ archive/ne_50m_rivers_lake_centerlines_scale_ranks$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_rivers_lake_centerlines.zip: 50m_physical/ne_50m_rivers_lake_centerlines.shp 50m_physical/ne_50m_rivers_lake_centerlines.dbf
	zip -j -r $@ 50m_physical/ne_50m_rivers_lake_centerlines.*
	cp $@ archive/ne_50m_rivers_lake_centerlines$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_graticules_all.zip: \
	zips/50m_physical/ne_50m_graticules_1.zip \
	zips/50m_physical/ne_50m_graticules_5.zip \
	zips/50m_physical/ne_50m_graticules_10.zip \
	zips/50m_physical/ne_50m_graticules_15.zip \
	zips/50m_physical/ne_50m_graticules_20.zip \
	zips/50m_physical/ne_50m_graticules_30.zip \
	zips/50m_physical/ne_50m_wgs84_bounding_box.zip
	
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/*.*
	cp $@ archive/ne_50m_graticules_all$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_graticules_1.zip: 50m_physical/ne_50m_graticules_all/ne_50m_graticules_1.shp 50m_physical/ne_50m_graticules_all/ne_50m_graticules_1.dbf
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/ne_50m_graticules_1.*
	cp $@ archive/ne_50m_graticules_1$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_graticules_5.zip: 50m_physical/ne_50m_graticules_all/ne_50m_graticules_5.shp 50m_physical/ne_50m_graticules_all/ne_50m_graticules_5.dbf
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/ne_50m_graticules_5.*
	cp $@ archive/ne_50m_graticules_5$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_graticules_10.zip: 50m_physical/ne_50m_graticules_all/ne_50m_graticules_10.shp 50m_physical/ne_50m_graticules_all/ne_50m_graticules_10.dbf
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/ne_50m_graticules_10.*
	cp $@ archive/ne_50m_graticules_10$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_graticules_15.zip: 50m_physical/ne_50m_graticules_all/ne_50m_graticules_15.shp 50m_physical/ne_50m_graticules_all/ne_50m_graticules_15.dbf
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/ne_50m_graticules_15.*
	cp $@ archive/ne_50m_graticules_15$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_graticules_20.zip: 50m_physical/ne_50m_graticules_all/ne_50m_graticules_20.shp 50m_physical/ne_50m_graticules_all/ne_50m_graticules_20.dbf
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/ne_50m_graticules_20.*
	cp $@ archive/ne_50m_graticules_20$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_graticules_30.zip: 50m_physical/ne_50m_graticules_all/ne_50m_graticules_30.shp 50m_physical/ne_50m_graticules_all/ne_50m_graticules_30.dbf
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/ne_50m_graticules_30.*
	cp $@ archive/ne_50m_graticules_30$(VERSION_PREFIXED).zip

zips/50m_physical/ne_50m_wgs84_bounding_box.zip: 50m_physical/ne_50m_graticules_all/ne_50m_wgs84_bounding_box.shp 50m_physical/ne_50m_graticules_all/ne_50m_wgs84_bounding_box.dbf
	zip -j -r $@ 50m_physical/ne_50m_graticules_all/ne_50m_wgs84_bounding_box.*
	cp $@ archive/ne_50m_wgs84_bounding_box$(VERSION_PREFIXED).zip


# 110m cultural

zips/110m_cultural/ne_110m_admin_0_boundary_lines_land.zip: 110m_cultural/ne_110m_admin_0_boundary_lines_land.shp 110m_cultural/ne_110m_admin_0_boundary_lines_land.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_0_boundary_lines_land.*
	cp $@ archive/ne_110m_admin_0_boundary_lines_land$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_0_countries.zip: 110m_cultural/ne_110m_admin_0_countries.shp 110m_cultural/ne_110m_admin_0_countries.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_0_countries.*
	cp $@ archive/ne_110m_admin_0_countries$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_0_map_units.zip: 110m_cultural/ne_110m_admin_0_map_units.shp 110m_cultural/ne_110m_admin_0_map_units.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_0_map_units.*
	cp $@ archive/ne_110m_admin_0_map_units$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_0_pacific_groupings.zip: 110m_cultural/ne_110m_admin_0_pacific_groupings.shp 110m_cultural/ne_110m_admin_0_pacific_groupings.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_0_pacific_groupings.*
	cp $@ archive/ne_110m_admin_0_pacific_groupings$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_0_scale_ranks.zip: 110m_cultural/ne_110m_admin_0_scale_ranks.shp 110m_cultural/ne_110m_admin_0_scale_ranks.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_0_scale_ranks.*
	cp $@ archive/ne_110m_admin_0_scale_ranks$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_0_sovereignty.zip: 110m_cultural/ne_110m_admin_0_sovereignty.shp 110m_cultural/ne_110m_admin_0_sovereignty.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_0_sovereignty.*
	cp $@ archive/ne_110m_admin_0_sovereignty$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_0_tiny_countries.zip: 110m_cultural/ne_110m_admin_0_tiny_countries.shp 110m_cultural/ne_110m_admin_0_tiny_countries.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_0_tiny_countries.*
	cp $@ archive/ne_110m_admin_0_tiny_countries$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_1_states_provinces_lines_shp.zip: 110m_cultural/ne_110m_admin_1_states_provinces_lines_shp.shp 110m_cultural/ne_110m_admin_1_states_provinces_lines_shp.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_1_states_provinces_lines_shp.*
	cp $@ archive/ne_110m_admin_1_states_provinces_lines_shp$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_admin_1_states_provinces_shp.zip: 110m_cultural/ne_110m_admin_1_states_provinces_shp.shp 110m_cultural/ne_110m_admin_1_states_provinces_shp.dbf
	zip -j -r $@ 110m_cultural/ne_110m_admin_1_states_provinces_shp.*
	cp $@ archive/ne_110m_admin_1_states_provinces_shp$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_populated_places_simple.zip: 110m_cultural/ne_110m_populated_places_simple.shp 110m_cultural/ne_110m_populated_places_simple.dbf
	zip -j -r $@ 110m_cultural/ne_110m_populated_places_simple.*
	cp $@ archive/ne_110m_populated_places_simple$(VERSION_PREFIXED).zip
	
zips/110m_cultural/ne_110m_populated_places.zip: 110m_cultural/ne_110m_populated_places.shp 110m_cultural/ne_110m_populated_places.dbf
	zip -j -r $@ 110m_cultural/ne_110m_populated_places.*
	cp $@ archive/ne_110m_populated_places$(VERSION_PREFIXED).zip
	
	
# 110m physical

zips/110m_physical/ne_110m_coastline.zip: 110m_physical/ne_110m_coastline.shp 110m_physical/ne_110m_coastline.dbf
	zip -j -r $@ 110m_physical/ne_110m_coastline.*
	cp $@ archive/ne_110m_coastline$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_geographic_lines.zip: 110m_physical/ne_110m_geographic_lines.shp 110m_physical/ne_110m_geographic_lines.dbf
	zip -j -r $@ 110m_physical/ne_110m_geographic_lines.*
	cp $@ archive/ne_110m_geographic_lines$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_geography_marine_polys.zip: 110m_physical/ne_110m_geography_marine_polys.shp 110m_physical/ne_110m_geography_marine_polys.dbf
	zip -j -r $@ 110m_physical/ne_110m_geography_marine_polys.*
	cp $@ archive/ne_110m_geography_marine_polys$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_geography_regions_elevation_points.zip: 110m_physical/ne_110m_geography_regions_elevation_points.shp 110m_physical/ne_110m_geography_regions_elevation_points.dbf
	zip -j -r $@ 110m_physical/ne_110m_geography_regions_elevation_points.*
	cp $@ archive/ne_110m_geography_regions_elevation_points$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_geography_regions_points.zip: 110m_physical/ne_110m_geography_regions_points.shp 110m_physical/ne_110m_geography_regions_points.dbf
	zip -j -r $@ 110m_physical/ne_110m_geography_regions_points.*
	cp $@ archive/ne_110m_geography_regions_points$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_geography_regions_polys.zip: 110m_physical/ne_110m_geography_regions_polys.shp 110m_physical/ne_110m_geography_regions_polys.dbf
	zip -j -r $@ 110m_physical/ne_110m_geography_regions_polys.*
	cp $@ archive/ne_110m_geography_regions_polys$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_glaciated_areas.zip: 110m_physical/ne_110m_glaciated_areas.shp 110m_physical/ne_110m_glaciated_areas.dbf
	zip -j -r $@ 110m_physical/ne_110m_glaciated_areas.*
	cp $@ archive/ne_110m_glaciated_areas$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_lakes.zip: 110m_physical/ne_110m_lakes.shp 110m_physical/ne_110m_lakes.dbf
	zip -j -r $@ 110m_physical/ne_110m_lakes.*
	cp $@ archive/ne_110m_lakes$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_land.zip: 110m_physical/ne_110m_land.shp 110m_physical/ne_110m_land.dbf
	zip -j -r $@ 110m_physical/ne_110m_land.*
	cp $@ archive/ne_110m_land$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_ocean.zip: 110m_physical/ne_110m_ocean.shp 110m_physical/ne_110m_ocean.dbf
	zip -j -r $@ 110m_physical/ne_110m_ocean.*
	cp $@ archive/ne_110m_ocean$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_physical_geographic_lines.zip: 110m_physical/ne_110m_physical_geographic_lines.shp 110m_physical/ne_110m_physical_geographic_lines.dbf
	zip -j -r $@ 110m_physical/ne_110m_physical_geographic_lines.*
	cp $@ archive/ne_110m_physical_geographic_lines$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_rivers_lake_centerlines.zip: 110m_physical/ne_110m_rivers_lake_centerlines.shp 110m_physical/ne_110m_rivers_lake_centerlines.dbf
	zip -j -r $@ 110m_physical/ne_110m_rivers_lake_centerlines.*
	cp $@ archive/ne_110m_rivers_lake_centerlines$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_graticules_all.zip: \
	zips/110m_physical/ne_110m_graticules_1.zip \
	zips/110m_physical/ne_110m_graticules_5.zip \
	zips/110m_physical/ne_110m_graticules_10.zip \
	zips/110m_physical/ne_110m_graticules_15.zip \
	zips/110m_physical/ne_110m_graticules_20.zip \
	zips/110m_physical/ne_110m_graticules_30.zip \
	zips/110m_physical/ne_110m_wgs84_bounding_box.zip
	
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/*.*
	cp $@ archive/ne_110m_graticules_all$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_graticules_1.zip: 110m_physical/ne_110m_graticules_all/ne_110m_graticules_1.shp 110m_physical/ne_110m_graticules_all/ne_110m_graticules_1.dbf
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/ne_110m_graticules_1.*
	cp $@ archive/ne_110m_graticules_1$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_graticules_5.zip: 110m_physical/ne_110m_graticules_all/ne_110m_graticules_5.shp 110m_physical/ne_110m_graticules_all/ne_110m_graticules_5.dbf
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/ne_110m_graticules_5.*
	cp $@ archive/ne_110m_graticules_5$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_graticules_10.zip: 110m_physical/ne_110m_graticules_all/ne_110m_graticules_10.shp 110m_physical/ne_110m_graticules_all/ne_110m_graticules_10.dbf
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/ne_110m_graticules_10.*
	cp $@ archive/ne_110m_graticules_10$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_graticules_15.zip: 110m_physical/ne_110m_graticules_all/ne_110m_graticules_15.shp 110m_physical/ne_110m_graticules_all/ne_110m_graticules_15.dbf
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/ne_110m_graticules_15.*
	cp $@ archive/ne_110m_graticules_15$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_graticules_20.zip: 110m_physical/ne_110m_graticules_all/ne_110m_graticules_20.shp 110m_physical/ne_110m_graticules_all/ne_110m_graticules_20.dbf
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/ne_110m_graticules_20.*
	cp $@ archive/ne_110m_graticules_20$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_graticules_30.zip: 110m_physical/ne_110m_graticules_all/ne_110m_graticules_30.shp 110m_physical/ne_110m_graticules_all/ne_110m_graticules_30.dbf
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/ne_110m_graticules_30.*
	cp $@ archive/ne_110m_graticules_30$(VERSION_PREFIXED).zip

zips/110m_physical/ne_110m_wgs84_bounding_box.zip: 110m_physical/ne_110m_graticules_all/ne_110m_wgs84_bounding_box.shp 110m_physical/ne_110m_graticules_all/ne_110m_wgs84_bounding_box.dbf
	zip -j -r $@ 110m_physical/ne_110m_graticules_all/ne_110m_wgs84_bounding_box.*
	cp $@ archive/ne_110m_wgs84_bounding_box$(VERSION_PREFIXED).zip


# PACKAGES
	
# copy the master assets into position for 10m_cultural: 
packages/Natural_Earth_quick_start/10m_cultural/status.txt: \
	10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.shp 10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.dbf \
	10m_cultural/ne_10m_admin_0_boundary_lines_land.shp 10m_cultural/ne_10m_admin_0_boundary_lines_land.dbf \
	10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.shp 10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.dbf \
	10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.shp 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.dbf \
	10m_cultural/ne_10m_admin_0_map_subunits.shp 10m_cultural/ne_10m_admin_0_map_subunits.dbf \
	10m_cultural/ne_10m_admin_0_map_units.shp 10m_cultural/ne_10m_admin_0_map_units.dbf \
	10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.shp 10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.dbf \
	10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.shp 10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.dbf \
	10m_cultural/ne_10m_admin_1_states_provinces_shp.shp 10m_cultural/ne_10m_admin_1_states_provinces_shp.dbf \
	10m_cultural/ne_10m_populated_places.shp 10m_cultural/ne_10m_populated_places.dbf \
	10m_cultural/ne_10m_urban_areas.shp 10m_cultural/ne_10m_urban_areas.dbf

	mkdir -p packages/Natural_Earth_quick_start/10m_cultural

	cp 10m_cultural/ne_10m_admin_0_boundary_breakaway_disputed_areas.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_0_boundary_lines_land.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_0_boundary_lines_maritime_indicator.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_0_breakaway_disputed_areas.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_0_map_subunits.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_0_map_units.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_0_scale_ranks_with_minor_islands.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_1_states_provinces_lines_shp.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_admin_1_states_provinces_shp.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_populated_places.* packages/Natural_Earth_quick_start/10m_cultural/
	cp 10m_cultural/ne_10m_urban_areas.* packages/Natural_Earth_quick_start/10m_cultural/
	
	touch $@
	
# copy the master assets into position for 10m_physical: 	
packages/Natural_Earth_quick_start/10m_physical/status.txt: \
	10m_physical/ne_10m_coastline.shp 10m_physical/ne_10m_coastline.dbf \
	10m_physical/ne_10m_geography_marine_polys.shp 10m_physical/ne_10m_geography_marine_polys.dbf \
	10m_physical/ne_10m_geography_regions_elevation_points.shp 10m_physical/ne_10m_geography_regions_elevation_points.dbf \
	10m_physical/ne_10m_geography_regions_points.shp 10m_physical/ne_10m_geography_regions_points.dbf \
	10m_physical/ne_10m_geography_regions_polys.shp 10m_physical/ne_10m_geography_regions_polys.dbf \
	10m_physical/ne_10m_lakes.shp 10m_physical/ne_10m_lakes.dbf \
	10m_physical/ne_10m_minor_islands.shp 10m_physical/ne_10m_minor_islands.dbf \
	10m_physical/ne_10m_ocean.shp 10m_physical/ne_10m_ocean.dbf \
	10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.shp 10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.dbf \
	10m_physical/ne_10m_rivers_lake_centerlines.shp 10m_physical/ne_10m_rivers_lake_centerlines.dbf
	
	mkdir -p packages/Natural_Earth_quick_start/10m_physical

	cp 10m_physical/ne_10m_coastline.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_geography_marine_polys.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_geography_regions_elevation_points.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_geography_regions_points.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_geography_regions_polys.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_lakes.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_minor_islands.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_ocean.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_rivers_lake_centerlines_scale_ranks.* packages/Natural_Earth_quick_start/10m_physical/
	cp 10m_physical/ne_10m_rivers_lake_centerlines.* packages/Natural_Earth_quick_start/10m_physical/
	
	touch $@
	
# TODO: get the raster from the other repo, which doesn't exist now.
packages/Natural_Earth_quick_start/50m_raster/status.txt:

	mkdir -p packages/Natural_Earth_quick_start/50m_raster
	rm -rf packages/Natural_Earth_quick_start/50m_raster/*
	curl -o packages/Natural_Earth_quick_start/50m_raster/NE1_50M_SR_W.zip -L http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/raster/NE1_50M_SR_W.zip
	unzip packages/Natural_Earth_quick_start/50m_raster/NE1_50M_SR_W.zip -d packages/Natural_Earth_quick_start/50m_raster/
	rm packages/Natural_Earth_quick_start/50m_raster/NE1_50M_SR_W.zip
	
	touch $@
	
# copy the master assets into position for 110m_cultural:
packages/Natural_Earth_quick_start/110m_cultural/status.txt: \
	110m_cultural/ne_110m_admin_0_boundary_lines_land.shp 110m_cultural/ne_110m_admin_0_boundary_lines_land.dbf \
	110m_cultural/ne_110m_admin_0_countries.shp 110m_cultural/ne_110m_admin_0_countries.dbf \
	110m_cultural/ne_110m_admin_0_pacific_groupings.shp 110m_cultural/ne_110m_admin_0_pacific_groupings.dbf \
	110m_cultural/ne_110m_admin_0_tiny_countries.shp 110m_cultural/ne_110m_admin_0_tiny_countries.dbf \
	110m_cultural/ne_110m_admin_1_states_provinces_shp.shp 110m_cultural/ne_110m_admin_1_states_provinces_shp.dbf \
	110m_cultural/ne_110m_populated_places.shp 110m_cultural/ne_110m_populated_places.dbf

	mkdir -p packages/Natural_Earth_quick_start/110m_cultural

	cp 110m_cultural/ne_110m_admin_0_boundary_lines_land.* packages/Natural_Earth_quick_start/110m_cultural/
	cp 110m_cultural/ne_110m_admin_0_countries.* packages/Natural_Earth_quick_start/110m_cultural/
	cp 110m_cultural/ne_110m_admin_0_pacific_groupings.* packages/Natural_Earth_quick_start/110m_cultural/
	cp 110m_cultural/ne_110m_admin_0_tiny_countries.* packages/Natural_Earth_quick_start/110m_cultural/
	cp 110m_cultural/ne_110m_admin_1_states_provinces_shp.* packages/Natural_Earth_quick_start/110m_cultural/
	cp 110m_cultural/ne_110m_populated_places.* packages/Natural_Earth_quick_start/110m_cultural/
	
	touch $@
	
# copy the master assets into position for 110m_physical: 	
packages/Natural_Earth_quick_start/110m_physical/status.txt: \
	110m_physical/ne_110m_coastline.shp 110m_physical/ne_110m_coastline.dbf \
	110m_physical/ne_110m_geography_marine_polys.shp 110m_physical/ne_110m_geography_marine_polys.dbf \
	110m_physical/ne_110m_geography_regions_points.shp 110m_physical/ne_110m_geography_regions_points.dbf \
	110m_physical/ne_110m_geography_regions_polys.shp 110m_physical/ne_110m_geography_regions_polys.dbf \
	110m_physical/ne_110m_lakes.shp 110m_physical/ne_110m_lakes.dbf \
	110m_physical/ne_110m_ocean.shp 110m_physical/ne_110m_ocean.dbf
		
	mkdir -p packages/Natural_Earth_quick_start/110m_physical

	cp 110m_physical/ne_110m_coastline.* packages/Natural_Earth_quick_start/110m_physical/
	cp 110m_physical/ne_110m_geography_marine_polys.* packages/Natural_Earth_quick_start/110m_physical/
	cp 110m_physical/ne_110m_geography_regions_points.* packages/Natural_Earth_quick_start/110m_physical/
	cp 110m_physical/ne_110m_geography_regions_polys.* packages/Natural_Earth_quick_start/110m_physical/
	cp 110m_physical/ne_110m_lakes.* packages/Natural_Earth_quick_start/110m_physical/
	cp 110m_physical/ne_110m_ocean.* packages/Natural_Earth_quick_start/110m_physical/
	
	touch $@
	
zips/updates/natural_earth_update_1.1.0.zip:
	zip -r $@ updates/version_1d1/

zips/updates/natural_earth_update_1.1.3.zip:
	zip -r $@ updates/version_1d1d3/

zips/updates/natural_earth_update_1.2.0.zip:
	zip -r $@ updates/version_1d2/

zips/updates/natural_earth_update_1.3.0.zip:
	zip -r $@ updates/version_1d3/
		
zips/updates/natural_earth_update_1.4.0.zip:
	zip -r $@ updates/version_1d4/

zips/updates/natural_earth_update_2.0.0.zip:
	zip -r $@ updates/version_2d0/

live-packages_ne: \
	zips/packages/natural_earth_vector.zip \
	zips/packages/natural_earth_vector.sqlite.zip \
	zips/packages/Natural_Earth_quick_start.zip
	
	rsync -Cr --progress zips/packages/ $(DOCROOT_NE)/packages/
	
live-10m_cultural_ne: zips/10m_cultural/10m_cultural.zip
	rsync -Cr --progress zips/10m_cultural/ $(DOCROOT_NE)/10m/cultural/

live-10m_physical_ne: zips/10m_cultural/10m_physical.zip
	rsync -Cr --progress zips/10m_physical/ $(DOCROOT_NE)/10m/physical/

live-50m_cultural_ne: zips/10m_cultural/50m_cultural.zip
	rsync -Cr --progress zips/50m_cultural/ $(DOCROOT_NE)/50m/cultural/

live-50m_physical_ne: zips/10m_cultural/50m_physical.zip
	rsync -Cr --progress zips/50m_physical/ $(DOCROOT_NE)/50m/physical/

live-110m_cultural_ne: zips/10m_cultural/110m_cultural.zip
	rsync -Cr --progress zips/110m_cultural/ $(DOCROOT_NE)/110m/cultural/

live-110m_physical_ne: zips/10m_cultural/110m_physical.zip
	rsync -Cr --progress zips/110m_physical/ $(DOCROOT_NE)/110m/physical/


live-packages_freac: \
	zips/packages/natural_earth_vector.zip \
	zips/packages/natural_earth_vector.sqlite.zip \
	zips/packages/Natural_Earth_quick_start.zip
	
	rsync -Cr --progress zips/packages/ $(DOCROOT_FREAC)/packages/
	
live-10m_cultural_freac: zips/10m_cultural/10m_cultural.zip
	rsync -Cr --progress zips/10m_cultural/ $(DOCROOT_FREAC)/10m/cultural/

live-10m_physical_freac: zips/10m_cultural/10m_cultural.zip
	rsync -Cr --progress zips/10m_physical/ $(DOCROOT_FREAC)/10m/physical/

live-50m_cultural_freac: zips/10m_cultural/50m_cultural.zip
	rsync -Cr --progress zips/50m_cultural/ $(DOCROOT_FREAC)/50m/cultural/

live-50m_physical_freac: zips/10m_cultural/50m_physical.zip
	rsync -Cr --progress zips/50m_physical/ $(DOCROOT_FREAC)/50m/physical/

live-110m_cultural_freac: zips/10m_cultural/110m_cultural.zip
	rsync -Cr --progress zips/110m_cultural/ $(DOCROOT_FREAC)/110m/cultural/

live-110m_physical_freac: zips/10m_cultural/110m_physical.zip
	rsync -Cr --progress zips/110m_physical/ $(DOCROOT_FREAC)/110m/physical/


live: zips \
	zips/updates/natural_earth_update_$(VERSION).zip \
	live-packages_ne \
	live-10m_cultural_ne \
	live-10m_physical_ne \
	live-50m_cultural_ne \
	live-50m_physical_ne \
	live-110m_cultural_ne \
	live-110m_physical_ne \
	live-packages_freac \
	live-10m_cultural_freac \
	live-10m_physical_freac \
	live-50m_cultural_freac \
	live-50m_physical_freac \
	live-110m_cultural_freac \
	live-110m_physical_freac
	
	#copy *.zip in folder > *_$(VERSION).zip
	#ls zips/10m_cultural/*.zip | perl -p -e 's/^((.+)\.zip)$/cp \1 \2-1.4.zip/' | sh -ex

	# NATURALEARTHDATA.com copy
	#special items:
	scp -i zips/updates/natural_earth_update_$(VERSION).zip $(DOCROOT_NE)/updates/natural_earth_update_$(VERSION).zip
	
	# FREAC copy
	#special items:
	scp -i zips/updates/natural_earth_update_$(VERSION).zip $(DOCROOT_FREAC)/web-download/updates/natural_earth_update_$(VERSION).zip

	# DOWNLOADS copy
	#special items:
	cp updates/natural_earth_update_$(VERSION).zip downloads/
	# packages
	rsync -Cr --progress zips/packages/ downloads/
	# etc for each theme
	rsync -Cr --progress zips/10m_cultural/ downloads/
	rsync -Cr --progress zips/10m_physical/ downloads/
	rsync -Cr --progress zips/50m_cultural/ downloads/
	rsync -Cr --progress zips/50m_physical/ downloads/
	rsync -Cr --progress zips/110m_cultural/ downloads/
	rsync -Cr --progress zips/110m_physical/ downloads/


clean-quick-start:
	rm -rf packages/Natural_Earth_quick_start/10m_cultural/*`
	rm -rf packages/Natural_Earth_quick_start/10m_physical/*
	rm -rf packages/Natural_Earth_quick_start/50m_raster/*
	rm -rf packages/Natural_Earth_quick_start/110m_cultural/*
	rm -rf packages/Natural_Earth_quick_start/110m_physical/*
	

clean:
	mkdir -p zips/10m_cultural
	mkdir -p zips/10m_physical
	mkdir -p zips/50m_cultural
	mkdir -p zips/50m_physical
	mkdir -p zips/110m_cultural
	mkdir -p zips/110m_physical
	mkdir -p zips/packages/
	mkdir -p archive
	rm -rf zips/10m_cultural/*
	rm -rf zips/10m_physical/*
	rm -rf zips/50m_cultural/*
	rm -rf zips/50m_physical/*
	rm -rf zips/110m_cultural/*
	rm -rf zips/110m_physical/*
	#rm -rf zips/packages/*