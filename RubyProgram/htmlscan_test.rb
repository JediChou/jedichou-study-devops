HTMLRegexp = /(<!--.*?--\s*>)|
              (<(?:[^"'>]*|"[^"]*"|'[^']*')+>)|
              ([^<]*)/xm

data = DATA.read
data.scan(HTMLRegexp) {|match|
    comment, tag, tdata = match[0..2]
    if comment
        p [ "Comment", comment ]
    elsif tag
        p [ "Tag", tag ]
    elsif tdata
        tdata.gsub!(/\s+/, "")
        tdata.sub!(/ $/, "")
        p [ "TextData", tdata ] unless tdata.empty? 
    end
 }
__END__
<!DOCTYPE HTML>
<HTML>
   <BODY>
        <A name="FOO" href="foo" attr >foo</A>
        <A name='BAR' href='bar' attr >bar</A>
        <A name=BAZ href=baz attr >baz</A>
        <!--
            <A href="dummy">dummy</A>
        -->
   </BODY>
</HTML>
