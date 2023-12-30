customer = Customer.create(email: 'customer@email.com', password: 'TESTp@ss0rd')

statement = Statement.create(customer: customer)
StatementItem.create(
  title: 'salary', amount: 2800.0, transaction_type: 'income', statement: statement
)

StatementItem.create(
  title: 'other', amount: 300.0, transaction_type: 'income', statement: statement
)

StatementItem.create(
  title: 'Mortgage', amount: 500.0, transaction_type: 'expenditure', statement: statement
)

StatementItem.create(
  title: 'Utilities', amount: 100.0, transaction_type: 'expenditure', statement: statement
)

StatementItem.create(
  title: 'Travel', amount: 150.0, transaction_type: 'expenditure', statement: statement
)

StatementItem.create(
  title: 'Food', amount: 500.0, transaction_type: 'expenditure', statement: statement
)

StatementItem.create(
  title: 'Loan Repayment', amount: 1000.0, transaction_type: 'expenditure', statement: statement
)
