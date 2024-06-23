# Google Survey Responses-to-Key Generator

Ruby script to convert from a standard Google Forms response input to a
question key useful for introspecting and analyzing responses.

* Input: CSV from Google Forms responses, questions as columns and responses as rows
* Output: CSV with index, Sheets column identifier, and question text as rows

**No responses from input are saved.** This tool is for generating keys.

Input is expected in standard input. Output will be to standard output.

## Example Input and Output

Given input responses from Google Sheets:
```csv
Timestamp,First Question?,Second question in the survey?,More information
11/01/2023 12:00:00,Answer from first respondant,Another answer,No notes
```

The corresponding generated key:
```csv
0,A,Timestamp
1,B,First Question?
2,C,Second question in the survey?
3,D,More information
```

## Usage Examples

Output key to STDOUT:
```
generate_key.rb < my_google_responses.csv
```

Capture output key as file:
```
generate_key.rb < my_google_responses.csv > key_for_form.csv
```

