#!/bin/sh

export DISABLE_SPRING=true
bin/rails runner Batch::MonthlyPaymentRegister.new.execute
