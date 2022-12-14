pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
contract InvoiceLedger {
    struct Invoice {
        string buyerPAN;
        string sellerPAN;
        uint invoiceAmount;
        uint invoiceDateDay;
        uint invoiceDateMonth;
        uint invoiceDateYear;
        bool paymentStatus;
    }
    
    mapping(string => Invoice[]) public buyerInvoices;
    
    function addInvoice(string memory _buyerPAN, string memory _sellerPAN, uint _invoiceAmount, uint _invoiceDateDay, uint _invoiceDateMonth, uint _invoiceDateYear) public {
        buyerInvoices[_buyerPAN].push(Invoice(_buyerPAN, _sellerPAN, _invoiceAmount, _invoiceDateDay,_invoiceDateMonth,_invoiceDateYear, false));
    }
    
    function getPreviousInvoices(string memory _buyerPAN) public view returns ( Invoice[] memory ) {
        return buyerInvoices[_buyerPAN];
    }
    
    function updatePaymentStatus(string memory _buyerPAN, string memory _sellerPAN, uint _invoiceAmount,  uint _invoiceDateDay, uint _invoiceDateMonth, uint _invoiceDateYear, bool _paymentStatus) public {
        for (uint i = 0; i < buyerInvoices[_buyerPAN].length; i++) {
            Invoice storage invoice = buyerInvoices[_buyerPAN][i];
            
            if (keccak256(abi.encodePacked(invoice.sellerPAN)) == keccak256(abi.encodePacked(_sellerPAN))&& invoice.invoiceAmount == _invoiceAmount && invoice.invoiceDateDay == _invoiceDateDay && invoice.invoiceDateMonth == _invoiceDateMonth && invoice.invoiceDateYear == _invoiceDateYear ) {
                invoice.paymentStatus = _paymentStatus;
            }
        }
    }

}