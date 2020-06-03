# Google Spreadsheet - CSV importer GitHub Action
This action allows you to upload your CSV file to a Google Spreadsheet.


## Usage

To use the action add the following step to your workflow file (e.g.
`.github/workflows/main.yml`)


```yml
- name: Upload CSV to Spreadsheet
  uses: canonical-web-and-design/csv-to-google-spreadsheet
  with:
    csv_path: path/file.csv
    spreadsheet_id: ${{ secrets.google_spreadsheet_id }}
    worksheet: 0
    google_service_account_email: ${{ secrets.google_service_account_email }}
    google_service_account_private_key: ${{ secrets.google_service_account_private_key }}
```

A common use case could be to upload CSV only on a tagged commit, to do you can add a
conditional to the step:


```yml
  if: github.event_name == 'push' && startsWith(github.event.ref, 'refs/tags')
```

So the full step would look like:


```yml
- name: Upload CSV to Spreadsheet
  if: github.event_name == 'push' && startsWith(github.event.ref, 'refs/tags')
  uses: canonical-web-and-design/csv-to-google-spreadsheet
  with:
    csv_path: path/file.csv
    spreadsheet_id: ${{ secrets.google_spreadsheet_id }}
    worksheet: 0
    google_service_account_email: ${{ secrets.google_service_account_email }}
    google_service_account_private_key: ${{ secrets.google_service_account_private_key }}
```


**If you are wondering how to get a Service Account**

A service account is a special type of Google account intended to represent a non-human user that needs to authenticate and be authorized to access data in Google APIs.

Since it’s a separate account, by default it does not have access to any spreadsheet until you share it with this account. Just like any other Google account.

Here’s how to get one:
1. Enable API Access for a Project if you haven’t done it yet.
2. Go to “APIs & Services > Credentials” and choose “Create credentials > Service account key”.
3. Fill out the form
4. Click “Create key”
5. Select “JSON” and click “Create”
6. Extract the account email and the account private key from there


## Non-goals

This GitHub Action only updates the content of a Google Spreadsheet with the same content of a CSV file.


## Append content

It is possible to append content to the worksheet, that means the content of your CSV will be added in the next free row.

The action invocation in this case would look like:
```yml
- name: Upload CSV to Spreadsheet
  uses: canonical-web-and-design/csv-to-google-spreadsheet
  with:
    csv_path: path/file.csv
    spreadsheet_id: ${{ secrets.google_spreadsheet_id }}
    worksheet: 0
    append_content: true
    google_service_account_email: ${{ secrets.google_service_account_email }}
    google_service_account_private_key: ${{ secrets.google_service_account_private_key }}
```


## License

The Dockerfile and associated scripts and documentation in this project
are released under the [GNU Lesser General Public License v3.0](LICENSE).


[Creating & using secrets]:
https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets
