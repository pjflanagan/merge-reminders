import os
import subprocess

def get_modified_files(base_sha, head_sha):
  result = subprocess.run(['git', 'diff', '--name-only', base_sha, head_sha], capture_output=True, text=True)
  return result.stdout.strip().split('\n')

def search_merge_comments(files):
  comments = []
  for file in files:
    if file:
      result = subprocess.run(['grep', '-r', '// MERGE:', file], capture_output=True, text=True)
      lines = result.stdout.strip().split('\n')
      for line in lines:
        if line:
          comments.append(f"- [ ] `{line.replace('// MERGE:', '`:')}")
  return comments

def main():
  base_sha = os.getenv('GITHUB_BASE_SHA')
  head_sha = os.getenv('GITHUB_HEAD_SHA')
  files = get_modified_files(base_sha, head_sha)
  
  if files:
    comments = search_merge_comments(files)
    if comments:
      print("comments=" + "\n".join(comments))
    else:
      print("comments=None")
  else:
    print("comments=None")

if __name__ == "__main__":
  main()