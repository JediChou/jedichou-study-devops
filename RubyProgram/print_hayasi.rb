names = ["XiaoLin", "Lin", "GaoYe", "SenGang"]
names.each { | name|
    if /Lin/ =~ name
        puts name
    end
}
