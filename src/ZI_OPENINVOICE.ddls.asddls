@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Open Invoices - Interface View'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZI_OpenInvoice
  as select from I_CustomerLineItem
{
  key CompanyCode,
  key AccountingDocument          as DocumentNumber,
  key FiscalYear,

      Customer,
      DocumentDate                as InvoiceDate,
      NetDueDate                  as DueDate,
      AmountInTransactionCurrency as AmountInDocCurrency,
      TransactionCurrency         as DocumentCurrency,
      AmountInCompanyCodeCurrency,
      CompanyCodeCurrency,

      /* Mandatory for $metadata and etag */
      LastChangeDate
}
where
  AccountingDocumentCategory = 'D'   -- customer invoices only
  and IsCleared              = ''    -- open items only (not cleared)
