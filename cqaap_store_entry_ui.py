
def main(): 
    """ 
        This sets customer attributes 
        \r\n...for now
    """
    
    customer = Customers() 
    customer.edi_code = 'nod_carquest'
    customer.is_active = 'no'
    print (customer.is_active)


def cqaap(customer): 
    """ 
    Here there are two methods used:
    \r\nget to edit, add for new
    """ 
    pass

class Customers: 
    """ 
        This defines attributes for customers.  
        \r\n The primary use as of 3/29 is maintaining a database table of CARQUEST and AAP customers.
        \r\n
        Here there are two methods used:
        \r\nget to edit, add for new
    """     

    def __init__(self): 
        edi_code = '' 
        edi_store_id = ''
        dc_billto = '' 
        corp_or_ind = '' 
        name = '' 
        address = ''
        city = '' 
        state = ''
        zip_code = ''
        country_code = '' 
        is_active = 1


if __name__ == "__main__":
    pass
    main()