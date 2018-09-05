# Artifactory location
server=http://192.168.56.101:8081/artifactory
repo=libs_snapshot_local

# Maven artifact location
name=emusicstore
artifact=com/mywebsite/emusicstore
path=$server/$repo/$artifact
version=$(curl -s $path/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/")
build=$(curl -s $path/$version/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/")
jar=$name-$build.jar
url=$path/$version/$jar

# Download
echo $url
wget -q -N $url
