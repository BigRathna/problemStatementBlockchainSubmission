// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../contracts/invoiceLedger.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
// Unit Test Cases: 
contract InvoiceLedgerTest {
    InvoiceLedger invoiceLedger = new InvoiceLedger();
    
    // Pass Conditions
    function testValidPANs() public {
        invoiceLedger.addInvoice("123456789", "098765432", 15000, 1, 1, 2021);
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].buyerPAN, "123456789", "Buyer PAN is not valid");
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].sellerPAN, "098765432", "Seller PAN is not valid");
    }
    
    function testValidInvoiceAmount() public {
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].invoiceAmount, 15000, "Invoice amount is not valid");
    }
    
    function testValidInvoiceDate() public {
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].invoiceDateDay, 1, "Invoice date day is not valid");
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].invoiceDateMonth, 1, "Invoice date month is not valid");
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].invoiceDateYear, 2021, "Invoice date year is not valid");
    }
    
    function testMultipleBuyersAndSellers() public {
        invoiceLedger.addInvoice("987654123", "123456789", 15000, 1, 1, 2021);
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[1].buyerPAN, "987654123", "Buyer PAN is not valid");
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[1].sellerPAN, "123456789", "Seller PAN is not valid");
    }
    
    function testValidPaymentStatus() public {
        invoiceLedger.updatePaymentStatus("123456789", "098765432", 15000, 1, 1, 2021, true);
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].paymentStatus, true, "Payment status is not valid");
    }
    
    function testValidPreviousInvoiceRetrieveal() public {
        Assert.equal(invoiceLedger.getPreviousInvoices("123456789")[0].buyerPAN, "123456789", "Previous invoice retrieval is not valid");
    }
    
    // Failed Conditions
    function testInvalidPANs() public {
        invoiceLedger.addInvoice("InvalidPAN", "InvalidPAN", 15000, 1, 1, 2021);
        Assert.notEqual(invoiceLedger.getPreviousInvoices("InvalidPAN")[0].buyerPAN, "InvalidPAN", "Buyer PAN is valid");
        Assert.notEqual(invoiceLedger.getPreviousInvoices("InvalidPAN")[0].sellerPAN, "InvalidPAN", "Seller PAN is valid");
    }
    

    
    function testMultipleInvalidBuyersAndSellers() public {
        invoiceLedger.addInvoice("InvalidPAN", "InvalidPAN", 15000, 1, 1, 2021);
        Assert.notEqual(invoiceLedger.getPreviousInvoices("123456789")[2].buyerPAN, "InvalidPAN", "Buyer PAN is valid");
        Assert.notEqual(invoiceLedger.getPreviousInvoices("123456789")[2].sellerPAN, "InvalidPAN", "Seller PAN is valid");
    }
    
    function testInvalidPreviousInvoiceRetrieveal() public {
        Assert.notEqual(invoiceLedger.getPreviousInvoices("InvalidPAN")[0].buyerPAN, "InvalidPAN", "Previous invoice retrieval is valid");
    }
}