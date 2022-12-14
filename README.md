# Problem Statement Blockchain One

This is my submission for the internship task. It is a basic website that has all the functionalities listed in the task sheet.

**Note:** 
1. I have not used a date time library as a particular functionality requires user input to be stored, which I have done in the simplest way possible.
2. I have used Remix to combine the code and deploy it in the testnet (Goerli) to get the required addresses and ABI.
3. Didn't find a way to display the ledger, so put it in a alert box for now. works the same, as we needed to find out weather the data is shown or not.
4. Sometimes after clicking on the button, and granting access, we are needed to click again to perform the transaction.

Link to website: https://blockchain-submission.netlify.app/

Test Cases: 

**Pass Conditions:**

1. Check if the buyer and seller PANs are valid, e.g.: 
    - BuyerPAN: 123456789
    - SellerPAN: 098765432
    - Invoice Amount: 15,000
    - Invoice Date: 01/01/2021

2. Check if the invoice amount is properly stored in the ledger, e.g.: 
    - Invoice Amount: 15,000

3. Check if the invoice date is properly stored in the ledger, e.g.: 
    - Invoice Date: 01/01/2021

4. Check if multiple buyers and sellers can be added to the ledger, e.g.: 
    - BuyerPAN: 123456789
    - SellerPAN: 098765432
    - BuyerPAN: 987654123
    - SellerPAN: 123456789

5. Check if the payment status of the invoice is properly stored in the ledger, e.g.: 
    - Payment Status: Paid

6. Check if the previous invoices can be retrieved from the ledger when searched with a buyer PAN, e.g.: 
    - BuyerPAN: 123456789

**Failed Conditions:**

1. Check if the buyer or seller PANs are invalid, e.g.: 
    - BuyerPAN: InvalidPAN
    - SellerPAN: InvalidPAN

2. Check if the invoice amount is not properly stored in the ledger, e.g.: 
    - Invoice Amount: InvalidAmount

3. Check if the invoice date is not properly stored in the ledger, e.g.: 
    - Invoice Date: InvalidDate

4. Check if multiple buyers and sellers cannot be added to the ledger, e.g.: 
    - BuyerPAN: 123456789
    - SellerPAN: 098765432
    - BuyerPAN: InvalidPAN
    - SellerPAN: InvalidPAN

5. Check if the payment status of the invoice is not properly stored in the ledger, e.g.: 
    - Payment Status: InvalidStatus

6. Check if the previous invoices cannot be retrieved from the ledger when searched with an invalid buyer PAN, e.g.: 
    - BuyerPAN: InvalidPAN
