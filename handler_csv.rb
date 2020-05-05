require 'csv'
require 'active_record'

class HandlerCsv

  def initialize(csv)
    @csv = csv
  end

  def run
    ActiveRecord::Base.transaction do
      @csv.each do |csv|
        @file = csv

        send file_to_methods(
          File.basename(csv, '.csv').to_sym
        )
      end
    end
  end

  def movementation
    Transaction.all.each do |transaction|
      account = Account.find(
        transaction.account_id
      )

      balance = account.balance + transaction.value
      balance -= 300 if balance < 0 && transaction.value < 0

      account.update(
        balance: balance
      )
    end
  end

  def print
    Account.all.each do |account|
      puts "#{account.id},#{account.balance}"
    end
  end

  private

  def save_accounts
    CSV.foreach(@file) do |account|
      Account.create!(
        id: account[0],
        balance: account[1]
      )
    end
  end

  def save_transactions
    CSV.foreach(@file) do |transaction|
      Transaction.create!(
        account_id: transaction[0],
        value: transaction[1]
      )
    end
  end

  def file_to_methods(file)
    {
      contas: 'save_accounts',
      transacoes: 'save_transactions'
    }[
      file.to_sym
    ]
  end
end
