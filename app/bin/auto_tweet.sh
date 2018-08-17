#!/bin/sh

export DISABLE_SPRING=true
bin/rails runner Batch::AutoTweet.new.execute
