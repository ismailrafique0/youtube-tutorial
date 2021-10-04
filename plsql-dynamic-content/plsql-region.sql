declare
    l_html clob;
begin
    l_html := '<div class="main-container">';
    for i in (
        select customer_id,
            cust_first_name ||' '||cust_last_name cust_name,
            street_address ||' - '|| postal_code ||', '|| city ||', ' || country_id cust_address,
            phone_number,
            to_char(credit_limit) credit_limit,
            lower(cust_email) cust_email,
            case
                when dbms_lob.getlength(cust_image) > 0 then
                    apex_util.get_blob_file_src('P41_CUST_IMAGE', customer_id)
                else
                    'https://www.shareicon.net/data/512x512/2016/07/26/802043_man_512x512.png'
            end cust_image,
            nvl(facebook_link, '#') facebook_link,
            nvl(twitter_link, '#') twitter_link,
            nvl(gplus_link, '#') gplus_link,
            nvl(linkedin_link, '#') linkedin_link
        from oehr_customers
    ) loop
        l_html := l_html || '    
            <div class="flip-container">
                <div class="flipper">
                    <!-- Card Front -->
                    <div class="front">
                        <div class="front-img-container">
                            <img src="'|| i.cust_image ||'" class="front-img" />
                        </div>
                        <h2 class="front-title">'|| i.cust_name ||'</h2>
                    </div>
                    
                    <!-- Card Back -->
                    <div class="back">
                        <div class="back-img-container">
                            <img src="'|| i.cust_image ||'" class="back-img" />
                        </div>
                        <div class="back-detail-container">
                            <h3 class="back-title">'|| i.cust_name ||'</h3>
                            <p class="back-subtitle">Limit: $'|| i.credit_limit ||'</p>
                            <hr />
                            <div class="font-a-icons">
                                <div class="icon-group">
                                    <span class="bold">T: </span><span class="contact phone">'|| i.phone_number ||'</span>
                                </div>
                                <div class="icon-group">
                                    <span class="bold">E: </span><a class="contact email" href="mailto:'|| i.cust_email ||'" target="_top">'|| i.cust_email ||'</a>
                                </div>
                                <div class="icon-group">
                                    <span class="contact address">'|| i.cust_address ||'</span>
                                </div>
                            </div>
                            
                            <div class="social-links">
                                <a class="icon-box" href="'|| i.facebook_link ||'" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a class="icon-box" href="'|| i.twitter_link ||'" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a class="icon-box" href="'|| i.gplus_link ||'" target="_blank"><i class="fa fa-google-plus"></i></a>
                                <a class="icon-box" href="'|| i.linkedin_link ||'" target="_blank"><i class="fa fa-linkedin"></i></a>
                                <a class="icon-box" href="#" target="_blank"><i class="fa fa-github"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        ';
    end loop;

    l_html := l_html || '</div>';

    apex_util.prn(l_html, false);
end;
