names = [ "小林", "林", "森崗", "花道" ]
names.each { |name|
    if /林/ =~ name
        puts name
    end
}