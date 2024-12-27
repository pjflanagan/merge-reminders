
# Merge Reminders

Merge Reminders is a Github Action pulls tagged comments from edited files and comments them on your PRs.
This is useful for code with specific rules about updating that are important not to forget.

![Merge Reminders Comment](https://github.com/pjflanagan/merge-reminders/blob/main/readme/comment.png?raw=true)

## Installation

...

## Usage

Add comments beginning with `MERGE:` to your code like this:

```tsx
// Header.tsx

const offsetHeight = 154; // MERGE: Be sure `offsetHeight` is reflected in `style.module.scss`
```

Comments can use Markdown and Github usernames:

```py
# api.py

# MERGE: Update the [documentation](https://docs.example.com) or @pjflanagan will be upset
class API:
  # ...
```

Then, when a dev creates a PR that modifies a file with `MERGE` comments,
those instructions will automatically be commented on your PRs, like this:

> **Merge Reminders**
> - [ ] `Header.tsx`: Be sure `offsetHeight` is reflected in `style.module.scss`
> - [ ] `api.py` Update the [documentation](https://docs.example.com) or @pjflanagan will be upset

You can then make it a requirement to check all boxes on PRs before merge,
forcing users to acknowledge instructions for each file. This is useful when:
- You want to ask devs to adhere to a pattern
- You need devs to update a different file to match changes in this one
- You need to remind devs to update documentation
- You need devs to be aware of how their code changes might cause unwanted side effects


### Notes

- https://docs.github.com/en/actions/writing-workflows/quickstart 
- https://github.com/bcgov-nr/action-pr-description-add