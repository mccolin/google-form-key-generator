#!/usr/bin/env ruby

if STDIN.tty?
  $stderr.puts "Google Survey Responses-to-Key Generator"
  $stderr.puts "Error: No CSV file or input provided to STDIN"
  $stderr.puts "Usage: #{File.basename($0)} < csv_to_read.csv > csv_to_write.csv"
  $stderr.puts "Guidance: (1) Provide a CSV of your Google Form survey responses headers"
  $stderr.puts "Guidance: (2) Script will output a CSV containing a key map for that survey"
  exit 1
end

R = ('A'..'Z').to_a
def idx_to_colname (idx)
  if idx < R.length
    return R[idx % R.length]
  else
    return [ R[idx / R.length - 1], R[idx % R.length] ].join()
  end
end

require 'csv'
output = CSV.generate do |csv|
  input = CSV.parse($stdin.read, headers: true)
  input.headers.each_with_index do |hdr, idx|
    csv << [idx, idx_to_colname(idx), hdr]
  end
end
puts output
