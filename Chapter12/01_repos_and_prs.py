from github import Github
import datetime

g = Github("YOUR_PERSONAL_ACCESS_TOKEN")
for repo in g.get_user().get_repos():
    print(repo.name)
    for pr in repo.get_pulls():
        print("  " + pr.created_at.isoformat() + " : " + pr.title) 
