@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Open Invoices - Consumption View'
@Metadata.allowExtensions: true

@UI.headerInfo: {
  typeName:       'Open Invoice',
  typeNamePlural: 'Open Invoices',
  title:          { type: #STANDARD, value: 'DocumentNumber' },
  description:    { type: #STANDARD, value: 'Customer' }
}

@Search.searchable: true

define root view entity ZC_OpenInvoice
  as projection on ZI_OpenInvoice
{
      @UI.selectionField: [{ position: 10 }]
      @UI.lineItem:       [{ position: 10, label: 'Company Code' }]
      @UI.identification: [{ position: 10 }]
  key CompanyCode,

      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem:       [{ position: 20, label: 'Document No.' }]
      @UI.identification: [{ position: 20 }]
  key DocumentNumber,

      @UI.lineItem:       [{ position: 30, label: 'Fiscal Year' }]
      @UI.identification: [{ position: 30 }]
  key FiscalYear,

      @UI.selectionField: [{ position: 30 }]
      @UI.lineItem:       [{ position: 40, label: 'Customer' }]
      @UI.identification: [{ position: 40 }]
      @Search.defaultSearchElement: true
      Customer,

      @UI.lineItem:       [{ position: 50, label: 'Invoice Date' }]
      @UI.identification: [{ position: 50 }]
      @UI.selectionField: [{ position: 40 }]
      InvoiceDate,

      @UI.lineItem:       [{ position: 60, label: 'Due Date' }]
      @UI.identification: [{ position: 60 }]
      @UI.selectionField: [{ position: 50 }]
      DueDate,

      @UI.lineItem:       [{ position: 70, label: 'Amount (Doc. Currency)' }]
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      AmountInDocCurrency,

      DocumentCurrency,

      @UI.lineItem:       [{ position: 80, label: 'Amount (CC Currency)' }]
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,

      CompanyCodeCurrency,

      LastChangeDate
}
