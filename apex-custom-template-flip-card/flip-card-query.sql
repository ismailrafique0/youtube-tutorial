select customer_id,
    cust_first_name ||' '||cust_last_name card_title,
    street_address ||' - '|| postal_code ||', '|| city ||', ' || country_id card_contact_address,
    phone_number card_contact_phone,
    to_char(credit_limit) card_subtitle,
    lower(cust_email) card_contact_email,
    case
        when dbms_lob.getlength(cust_image) > 0 then
            apex_util.get_blob_file_src('P41_CUST_IMAGE', customer_id)
        else
            'https://www.shareicon.net/data/512x512/2016/07/26/802043_man_512x512.png'
    end card_image,
    nvl(facebook_link, '#') card_link_facebook,
    nvl(twitter_link, '#') card_link_twitter,
    nvl(gplus_link, '#') card_link_gplus,
    nvl(linkedin_link, '#') card_link_linkedin
from oehr_customers
order by card_image
