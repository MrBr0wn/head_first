# frozen_string_literal: true

require 'Ch_4/initialize'

RSpec.describe Employee do
  context '.new Employee' do
    subject { described_class.new }
    it 'should return default name' do
      expect(subject.name).to eq 'Anonymous'
    end

    it 'should raise error message if @name is empty' do
      expect { subject.name = '' }.to raise_error(RuntimeError, /Name can't be blank/)
    end

    it '#print_name should output name' do
      subject.name = 'Test'
      expect { subject.print_name }.to output(/Name: Test/).to_stdout
    end
  end
end

describe SalariedEmployee do
  context '.new SalariedEmployee' do
    subject { described_class.new }
    it 'should be Employee class children' do
      expect(subject).to be_kind_of(Employee)
    end

    it 'should return default values name and salary' do
      expect(subject.name).to eq 'Anonymous'
      expect(subject.salary).to eq(0.0)
    end

    it 'should raise error message if @salary is negative' do
      expect { subject.salary = -1 }.to raise_error(RuntimeError, /A salary of -1 isn't valid/)
    end

    it '#print_pay_stub' do
      subject.name = 'Test'
      subject.salary = 200_000
      sum = (subject.salary / 365.0) * 14
      expect { subject.print_pay_stub }.to output(include("Name: #{subject.name}")).to_stdout
      expect { subject.print_pay_stub }.to output(include("Pay This Period: $#{sum.round(2)}")).to_stdout
    end
  end
end

describe HourlyEmployee do
  context '.new HourlyEmployee' do
    subject { described_class.new }

    it 'should be Employee class children' do
      expect(subject).to be_kind_of(Employee)
    end

    it 'should return default values' do
      expect(subject.name).to eq 'Anonymous'
      expect(subject.hourly_wage).to eq(0.0)
      expect(subject.hours_per_week).to eq(0.0)
    end

    it 'should raise error message if @hourly_wage or @hours_per_week is negative' do
      expect { subject.hourly_wage = -1 }.to raise_error(RuntimeError, /An hourly wage of -1 isn't valid/)
      expect { subject.hours_per_week = -1 }.to raise_error(RuntimeError, /-1 hours per week isn't valid/)
    end
  end
  context 'HourlyEmployee class methods' do
    it '.security_guard' do
      expect(described_class.security_guard('Jane')).to be_kind_of(Employee)
      expect(described_class.security_guard('Jane').hourly_wage).to eq(19.25)
      expect(described_class.security_guard('Jane').hours_per_week).to eq(30)
    end

    it '.cashier' do
      expect(described_class.cashier('Bob')).to be_kind_of(Employee)
      expect(described_class.cashier('Bob').hourly_wage).to eq(12.75)
      expect(described_class.cashier('Bob').hours_per_week).to eq(25)
    end

    it '.janitor' do
      expect(described_class.janitor('John')).to be_kind_of(Employee)
      expect(described_class.janitor('John').hourly_wage).to eq(10.50)
      expect(described_class.janitor('John').hours_per_week).to eq(20)
    end
  end

  it '#print_pay_stub' do
    ivan = described_class.security_guard('Ivan')
    sum = ivan.hourly_wage * ivan.hours_per_week * 2
    expect(ivan).to be_kind_of(HourlyEmployee)
    expect { ivan.print_pay_stub }.to output(include("Pay This Period: $#{sum.round(2)}")).to_stdout
  end
end
