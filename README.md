
![Merge Reminders Comment](https://github.com/pjflanagan/merge-reminders/blob/main/readme/comment.png?raw=true)

# Merge Reminders

Merge Reminders is a Github Action pulls tagged comments from edited files and comments them on your PRs.
This is useful for code with specific rules about updating that are important not to forget.


## Installation

...

## Usage

First, add a comments to a file like this:

```ts
// src/examples/readme.ts

// MERGE: be sure `offsetHeight` is reflected in `style.module.scss`
const offsetHeight = 154;

// ...

// MERGE: when adding an API endpoint, be sure to update the [documentation](https://docs.example.com)
class API {
  // ...
}
```

Then, when a dev creates a PR that touches a file with @merge comments, those instructions will automatically be added to the bottom of the PR description, like this:

> `src/examples/readme.ts`
> - [ ] `L3` - be sure `offsetHeight` is reflected in `style.module.scss`
> - [ ] `L12` - when adding an API endpoint, be sure to update the [documentation](https://docs.example.com)

User’s can then make it a requirement to check all boxes on PRs before merge, forcing users to acknowledge instructions for each file. This is useful when
- you want to ask devs to adhere to a pattern
- you need devs to update a different file to match changes in this one
- you need to remind devs to update documentation
- you need devs to be aware of how their code changes might cause unwanted side effects


### Notes

- https://docs.github.com/en/actions/writing-workflows/quickstart 
- https://github.com/bcgov-nr/action-pr-description-add