
# Merge Comment Reminders

Merge Comment Reminders is a Github Action pulls flagged comments from edited files and comments them on your PRs.
This is useful for code with specific rules about updating that are important not to forget.

![Merge Comment Reminders PR Comment](https://github.com/pjflanagan/merge-reminders/blob/main/readme/comment.png?raw=true)

## Installation

First, add this file to your repository.

```yml
# .github/workflows/merge-comment-reminders.yml

name: Merge Comment Reminders

on:
  pull_request:
    types: [opened, edited, synchronize]

jobs:
  merge-comment-reminders-action:
    runs-on: ubuntu-latest

    steps:
      - name: Merge Comment Reminders
        uses: pjflanagan/merge-reminders@release-v0.0.1
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

Then, in the Github repository settings, go to Actions > General > Workflow permissions and allow actions to "Read and write permissions"

## Usage

Add comments beginning with `MERGE:` to your code like this:

```tsx
// Header.tsx

const offsetHeight = 120; // MERGE: Be sure `offsetHeight` is reflected in `style.module.scss`
```

Comments can use Markdown and Github usernames:

```py
# api.py

# MERGE: Update the [documentation](https://docs.example.com) or @pjflanagan will be **very** upset
class API:
  # ...
```

Then, when a dev creates a PR that modifies a file with `MERGE:` comments,
those instructions will automatically be commented on your PRs, like this:

> **Merge Reminders**
> - [ ] `Header.tsx`: Be sure `offsetHeight` is reflected in `style.module.scss`
> - [ ] `api.py` Update the [documentation](https://docs.example.com) or @pjflanagan will be **very** upset

You can then make it a requirement to check all boxes on PRs before merge using another action
like [Task Completed Checker](https://github.com/marketplace/actions/task-completed-checker),
requiring devs to acknowledge instructions for each file they updated. This is useful when:
- You want to ask devs to adhere to a pattern
- You need devs to update a different file to match changes in this one
- You need to remind devs to update documentation
- You need devs to be aware of how their code changes might cause unwanted side effects


### Specific use cases

Merge Reminders only supports `#` and `//` comments. If the language uses a different type of comment
you'll have to fake it.

```html
<!--
  HTML comment
  # MERGE: be sure to update footer links to match the header links
-->
```

## Testing

1. Clone the merge-reminders-test
2. Point the merge reminder action the branch you'd like to test
3. See the output

## Releasing

TKTK

## Contributing

TKTK
